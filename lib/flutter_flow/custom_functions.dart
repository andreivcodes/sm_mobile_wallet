import 'dart:convert';
import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter/services.dart';

import 'package:ed25519spacemesh/spacemesh_ed25519.dart';

Ed25519Spacemesh ed25519 = new Ed25519Spacemesh();

String userSeedPhrase = "";
var seed = "";
Uint8List privateKey;
Uint8List publicKey;

double getBalance() {
  // Add your function code here!
  var balance;
  return balance;
}

double getTxAmount() {
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
  getKeypairFromSeedPhrase(inputSeedPhrase);
  return true;
}

bool copySeedPhraseToClipboard() {
  // Add your function code here!
  Clipboard.setData(ClipboardData(text: userSeedPhrase));
  return true;
}

Future<double> getKeypairFromSeedPhrase(String inputSeedPhrase) async {
  // Add your function code here!
  var seed = bip39.mnemonicToSeed(inputSeedPhrase).sublist(32);

  privateKey = await ed25519.newDerivedKeyFromSeed(
      Uint8List.fromList(seed),
      Uint8List.fromList([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]),
      Uint8List.fromList(utf8.encode("Spacemesh blockmesh")));

  Uint8List dummyMessage = Uint8List.fromList([0xFF, 0x00, 0xFF, 0x00]);

  Uint8List signature = await ed25519.sign(dummyMessage, privateKey);

  publicKey = await ed25519.extractPublicKey(dummyMessage, signature);

  print("prv: " + privateKey.toString());
  print("pub: " + publicKey.toString());

  bool? successful = await ed.verify(publicKey, dummyMessage, signature);
  return successful;
}
