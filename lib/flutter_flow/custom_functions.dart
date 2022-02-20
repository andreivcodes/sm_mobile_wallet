import 'dart:convert';
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
import 'lat_lng.dart';
import 'place.dart';

Ed25519Spacemesh ed25519 = new Ed25519Spacemesh();

Future<String> getBalance(
  dynamic networkJson,
  List<int> privateKey,
) async {
  // Add your function code here!
  final apiChannel = ClientChannel(
    networkJson["grpcAPI"].substring(8).replaceAll("/", ""),
    port: 443,
    options: const ChannelOptions(credentials: ChannelCredentials.secure()),
  );

  final accountClient = new GlobalStateServiceClient(apiChannel);
  AccountId accountQueryId = new AccountId(address: privateKey.sublist(24));
  AccountDataFilter accountQueryFilter = new AccountDataFilter(
      accountId: accountQueryId,
      accountDataFlags: AccountDataFlag.ACCOUNT_DATA_FLAG_ACCOUNT.value);
  AccountDataQueryRequest accountQuery =
      new AccountDataQueryRequest(filter: accountQueryFilter, maxResults: 1);

  AccountDataQueryResponse accountQueryResponse =
      await accountClient.accountDataQuery(accountQuery);

  print(accountQueryResponse.accountItem.first.accountWrapper);
  var balance = accountQueryResponse
      .accountItem.first.accountWrapper.stateProjected.balance
      .toString();

  return balance;
}

String getSenderAddress() {
  // Add your function code here!
  var senderAddress;
  return senderAddress;
}

String getReceiverAddress() {
  // Add your function code here!
  var receiverAddress;
  return receiverAddress;
}

String getTxMessage() {
  // Add your function code here!
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
  // Add your function code here!
  Clipboard.setData(ClipboardData(text: usedSeed));
  return true;
}

String getUserShortAddress() {
  return "";
  // Add your function code here!
}

bool sendTx(
  String recipient,
  String amount,
  String fee,
  Map<dynamic, dynamic> networkJson,
  List<int> privateKey,
) {
  return true;
  // Add your function code here!
}

bool clearStorage() {
  return true;
  // Add your function code here!
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

dynamic getNetworkJson(String selectedNetwork) async {
  final response =
      await http.get(Uri.parse('https://discover.spacemesh.io/networks.json'));

  var values = json.decode(response.body);

  for (var item in values) {
    if (item["netName"] == selectedNetwork) return item;
  }
}

Future<List> getTxList(
  dynamic networkJson,
  List<int> publicKey,
) async {
  print("Test");
  print(networkJson);
  // Add your function code here!
  final apiChannel = ClientChannel(
    networkJson["grpcAPI"].substring(8).replaceAll("/", ""),
    port: 9092,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

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

  return response.data;
}

String getAddressQRPath(String publicAddress) {
  return "";
}
