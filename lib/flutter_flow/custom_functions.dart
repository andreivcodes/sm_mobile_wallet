import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:bip39/bip39.dart' as bip39;
import 'lat_lng.dart';
import 'place.dart';

var userPassPhrase;

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
  var seedPhrase = bip39.generateMnemonic();
  return seedPhrase;
}

bool checkSeedPhrase(String inputSeedPhrase) {
  // Add your function code here!
  var successful;
  return successful;
}

bool restoreFromSeedPhrase(String inputSeedPhrase) {
  // Add your function code here!
  var successful;
  return successful;
}
