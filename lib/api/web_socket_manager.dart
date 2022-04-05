import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const webSocketURL = 'wss://socket.polygon.io/crypto';

class WebSocketManager {
  static WebSocketManager? _instance;
  WebSocketChannel? channel;
  WebSocketManager._();
  static WebSocketManager get instance => _instance ??= WebSocketManager._();

  void connect() {
    channel = WebSocketChannel.connect(
      Uri.parse(webSocketURL),
    );

    channel!.sink.add(jsonEncode(
        {"action": "auth", "params": "HMbSNDroKcx2AEKAeG38LKUPwC3SaEWq"}));

    channel!.stream.listen((event) {
      debugPrint(event.toString());
    });
  }
}
