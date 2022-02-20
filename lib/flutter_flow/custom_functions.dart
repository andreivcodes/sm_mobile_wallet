import 'dart:convert';
import 'dart:ffi';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:ed25519spacemesh/spacemesh_ed25519.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:grpc/grpc.dart';
import 'package:intl/intl.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/global_state.pbgrpc.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/global_state_types.pb.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/mesh.pbgrpc.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/mesh_types.pb.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/types.pb.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import 'lat_lng.dart';
import 'place.dart';

Ed25519Spacemesh ed25519 = new Ed25519Spacemesh();

var apiChannel;

Future<String> getBalance(
  dynamic networkJson,
  List<int> privateKey,
) async {
  final accountClient = new GlobalStateServiceClient(apiChannel);
  AccountId accountQueryId = new AccountId(address: privateKey.sublist(24));
  AccountDataFilter accountQueryFilter = new AccountDataFilter(
      accountId: accountQueryId,
      accountDataFlags: AccountDataFlag.ACCOUNT_DATA_FLAG_ACCOUNT.value);
  AccountDataQueryRequest accountQuery =
      new AccountDataQueryRequest(filter: accountQueryFilter, maxResults: 1);

  AccountDataQueryResponse accountQueryResponse =
      await accountClient.accountDataQuery(accountQuery);

  var balance = accountQueryResponse
      .accountItem.first.accountWrapper.stateProjected.balance.value;

  return balance.toString();
}

String getSenderAddress() {
  var senderAddress;
  return senderAddress;
}

String getReceiverAddress() {
  var receiverAddress;
  return receiverAddress;
}

String getTxMessage() {
  var txMessage;
  return txMessage;
}

bool checkSeedPhrase(
  String inputSeedPhrase,
  String generatedSeedPhrase,
) {
  if (inputSeedPhrase == generatedSeedPhrase) {
    return true;
  } else {
    return false;
  }
}

bool copySeedPhraseToClipboard(String usedSeed) {
  Clipboard.setData(ClipboardData(text: usedSeed));
  return true;
}

String getUserShortAddress() {
  return "";
}

bool sendTx(
  String recipient,
  String amount,
  String fee,
  Map<dynamic, dynamic> networkJson,
  List<int> privateKey,
) {
  return true;
}

bool clearStorage() {
  return true;
}

Future<List<String>> getAvailableNetworks() async {
  List<String> networks = [];
  final response =
      await http.get(Uri.parse('https://discover.spacemesh.io/networks.json'));

  var values = json.decode(response.body);

  for (var item in values) {
    if (item["netName"] != null) networks.add(item["netName"]);
  }

  return networks;
}

dynamic getNetworkJson(String selectedNetwork) async {
  final response =
      await http.get(Uri.parse('https://discover.spacemesh.io/networks.json'));

  var values = json.decode(response.body);

  for (var item in values) {
    if (item["netName"] == selectedNetwork) return item;
  }
}

void connectNetwork(dynamic selectedNetwork) {
  apiChannel = ClientChannel(
    "ticktockbent.ddns.net",
    //selectedNetwork["grpcAPI"].substring(8).replaceAll("/", ""),
    port: 9092,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
}

String generateSeed() {
  return bip39.generateMnemonic();
}

Future<List<int>> getPrivatekeyFromSeed(String userSeed) async {
  var seed = bip39.mnemonicToSeed(userSeed);
  seed = seed.sublist(32);

  var privateKey = await ed25519.newDerivedKeyFromSeed(
      Uint8List.fromList(seed),
      Uint8List.fromList([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]),
      Uint8List.fromList(utf8.encode("Spacemesh blockmesh")));

  return privateKey;
}

Future<List<int>> getPublickeyFromSeed(String userSeed) async {
  var seed = bip39.mnemonicToSeed(userSeed);
  seed = seed.sublist(32);

  var privateKey = await ed25519.newDerivedKeyFromSeed(
      Uint8List.fromList(seed),
      Uint8List.fromList([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]),
      Uint8List.fromList(utf8.encode("Spacemesh blockmesh")));

  Uint8List dummyMessage = Uint8List.fromList([0xFF, 0x00, 0xFF, 0x00]);
  Uint8List signature = await ed25519.sign(dummyMessage, privateKey);

  var publicKey = await ed25519.extractPublicKey(dummyMessage, signature);

  return publicKey.toList();
}

Future<String> getPublicaddressFromSeed(String userSeed) async {
  var seed = bip39.mnemonicToSeed(userSeed);
  seed = seed.sublist(32);

  var privateKey = await ed25519.newDerivedKeyFromSeed(
      Uint8List.fromList(seed),
      Uint8List.fromList([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]),
      Uint8List.fromList(utf8.encode("Spacemesh blockmesh")));

  Uint8List dummyMessage = Uint8List.fromList([0xFF, 0x00, 0xFF, 0x00]);
  Uint8List signature = await ed25519.sign(dummyMessage, privateKey);

  var publicKey = await ed25519.extractPublicKey(dummyMessage, signature);
  var addressIntList = publicKey.toList().sublist(12);

  return "0x" + hex.encode(addressIntList);
}

class TX_Data {
  Uint8List id;
  Uint8List receiver;
  Uint8List sender;
  String type;
  double amount;
  int gas;
  Uint8List signature;
  int layer;

  TX_Data(
      {this.id,
      this.receiver,
      this.sender,
      this.amount,
      this.type,
      this.gas,
      this.signature,
      this.layer});
  Map<String, dynamic> toJson() => {
        'id': id,
        'receiver': receiver,
        'sender': sender,
        'type': type,
        'amount': amount,
        'gas': gas,
        'signature': signature,
        'layer': layer
      };
}

Future<List> getTxList(
  dynamic networkJson,
  List<int> publicKey,
) async {
  final meshClient = new MeshServiceClient(apiChannel);

  AccountId accountId = AccountId(address: publicKey);
  AccountMeshDataFilter accountFilter = new AccountMeshDataFilter(
      accountId: accountId,
      accountMeshDataFlags:
          AccountMeshDataFlag.ACCOUNT_MESH_DATA_FLAG_TRANSACTIONS.value);
  AccountMeshDataQueryRequest accDataRequest =
      new AccountMeshDataQueryRequest(filter: accountFilter);

  AccountMeshDataQueryResponse response =
      await meshClient.accountMeshDataQuery(accDataRequest);

  List txs = [];

  for (var tx in response.data) {
    var txInfo = TX_Data(
        id: tx.meshTransaction.transaction.id.id,
        receiver: tx.meshTransaction.transaction.coinTransfer.receiver.address,
        sender: tx.meshTransaction.transaction.sender.address,
        amount: tx.meshTransaction.transaction.amount.value.toDouble(),
        type: tx.meshTransaction.transaction.sender.address ==
                FFAppState().publicKey
            ? "outgoing"
            : "incoming",
        gas: tx.meshTransaction.transaction.gasOffered.gasProvided.toInt(),
        signature: tx.meshTransaction.transaction.signature.signature,
        layer: tx.meshTransaction.layerId.number);

    txs.add(txInfo);
  }

  return Future.value(txs);
}

String getAddressQRPath(String publicAddress) {
  return "";
}
