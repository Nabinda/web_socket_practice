import 'dart:convert';

import 'package:binance_flutter/model/response_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final appRepo = Provider((ref) => AppRepo());

class AppRepo {
  final _socket = IOWebSocketChannel.connect(
      'wss://testnet.binance.vision/ws/btcusdt@aggTrade');
  void close() {
    _socket.sink.close();
  }

  Stream<ResponseModel> modelStream() {
    return _socket.stream.map((event) => ResponseModel.fromJson(jsonDecode(event)));
  }
}
