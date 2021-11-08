import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/global_state.pbgrpc.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/global_state_types.pb.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/mesh.pbgrpc.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/mesh_types.pb.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/smesher.pbgrpc.dart';
import 'package:protospacemesh/protoc/gen/spacemesh/v1/types.pb.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/services.dart';
import 'package:convert/convert.dart';
import 'package:ed25519spacemesh/spacemesh_ed25519.dart';

import 'flutter_flow_util.dart';

Ed25519Spacemesh ed25519 = new Ed25519Spacemesh();

String userSeedPhrase = "";
var seed = "";
Uint8List privateKey;
Uint8List publicKey;
List<int> publicKeyIntList;
List<int> addressIntList;
ClientChannel apiChannel;

Future<double> getBalance() async {
  // Add your function code here!
  apiChannel = ClientChannel(
    'ticktockbent.ddns.net',
    port: 9092,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
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

  double balance = accountQueryResponse
      .accountItem.first.accountWrapper.stateProjected.balance.value
      .toDouble();

  return balance;
}

bool isSmesher(List<int> address) {}

double getTxAmount(int txListIndex) {
  // Add your function code here!
  var amount;
  return amount;
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

double inputTxCompAmount() {
  // Add your function code here!
  var amount;
  return amount;
}

double outputTxCompAmount() {
  // Add your function code here!
  var amount;
  return amount;
}

double rewardTxCompAmount() {
  // Add your function code here!
  var amount;
  return amount;
}

String getGeneratedSeedPhrase() {
  // Add your function code here!

  //we need to do this only once because this function is called
  //several times during screen lifecycle
  if (userSeedPhrase.toString().length < 1) {
    var seedPhrase = bip39.generateMnemonic();
    userSeedPhrase = seedPhrase;
  }
  return userSeedPhrase;
}

bool checkSeedPhrase(String inputSeedPhrase) {
  // Add your function code here!
  if (inputSeedPhrase == userSeedPhrase) {
    getKeypairFromSeedPhrase(userSeedPhrase);
    return true;
  } else
    return false;
}

bool restoreFromSeedPhrase(String inputSeedPhrase) {
  // Add your function code here!
  final storage = new FlutterSecureStorage();
  storage.write(key: "seed", value: inputSeedPhrase);
  getKeypairFromSeedPhrase(inputSeedPhrase);
  return true;
}

bool copySeedPhraseToClipboard() {
  // Add your function code here!
  Clipboard.setData(ClipboardData(text: userSeedPhrase));
  return true;
}

Future<bool> getKeypairFromSeedPhrase(String inputSeedPhrase) async {
  // Add your function code here!
  final storage = new FlutterSecureStorage();
  var storedSeed = await storage.read(key: "seed");
  if (storedSeed != null) inputSeedPhrase = storedSeed;
  var seed = bip39.mnemonicToSeed(inputSeedPhrase);

  seed = seed.sublist(0, 32);

  print("mnemonic: " + inputSeedPhrase);
  print("seed: " + seed.toString());

  privateKey = await ed25519.newDerivedKeyFromSeed(
      Uint8List.fromList(seed),
      Uint8List.fromList([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]),
      Uint8List.fromList(utf8.encode("Spacemesh blockmesh")));

  Uint8List dummyMessage = Uint8List.fromList([0xFF, 0x00, 0xFF, 0x00]);

  Uint8List signature = await ed25519.sign(dummyMessage, privateKey);

  publicKey = await ed25519.extractPublicKey(dummyMessage, signature);
  publicKeyIntList = publicKey.toList();
  addressIntList = publicKey.toList().sublist(12);
  print("prv: " + (privateKey.toString()));
  print("pub: " + (publicKey.toString()));

  print("pub: " + (hex.encode(publicKey)));

  Future<bool> successful = ed25519.verify(publicKey, dummyMessage, signature);
  return successful;
}

Future<List<AccountMeshData>> getTxList() async {
  // Add your function code here!
  final apiChannel = ClientChannel(
    'ticktockbent.ddns.net',
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

Uint8List bigIntToUint8List(BigInt bigInt) =>
    bigIntToByteData(bigInt).buffer.asUint8List();

ByteData bigIntToByteData(BigInt bigInt) {
  final data = ByteData((bigInt.bitLength / 8).ceil());
  var _bigInt = bigInt;

  for (var i = 1; i <= data.lengthInBytes; i++) {
    data.setUint8(data.lengthInBytes - i, _bigInt.toUnsigned(8).toInt());
    _bigInt = _bigInt >> 8;
  }

  return data;
}
