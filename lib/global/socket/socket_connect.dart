import 'dart:io';

class SocketConnect {
  static final SocketConnect _singleton = SocketConnect._internal();

  factory SocketConnect() => _singleton;

  SocketConnect._internal();

  final connectKey = 'connect';
  final errorKey = 'error';
  final disconnectKey = 'disconnect';
  final reconnectAttemptKey = 'reconnect_attempt';
  final reconnectFailedKey = 'reconnect_failed';
  final listenStockKey = ''; // Cần cập nhật nếu có khóa sự kiện từ server

  WebSocket? _socket;
  bool _forceDisconnect = false;

  final Set<String> _stockSubscribedList = {};
  final Set<String> _exchangeSubscribedList = {};

  void connect() {
    _forceDisconnect = false;
    _initSocket();
  }

  void disconnect() {
    _forceDisconnect = true;
    _socket?.close();
    _socket = null;
  }

  void destroy() {
    _stockSubscribedList.clear();
    _exchangeSubscribedList.clear();
    disconnect();
  }

  void subscribeStock(String symbol) {
    _emitSubscribeStock(symbol, true);
  }

  void unsubscribeStock(String symbol) {
    _emitSubscribeStock(symbol, false);
  }

  void subscribeExchange(String id) {
    _emitSubscribeExchange(id, true);
  }

  void unsubscribeExchange(String id) {
    _emitSubscribeExchange(id, false);
  }

  void _initSocket() async {
    String url = 'ws://10.59.11.26:8800/BHTDSocket'; // URL của WebSocket Server

    try {
      _socket = await WebSocket.connect(url);
      print('❤️❤️❤️ SOCKET CONNECTED TO $url');
      _reSubscribeAfterSocketReconnect();

      _socket?.listen(
        (data) {
          print('📩 Data received from server: $data');
          _transformStockData(data);
        },
        onError: (error) {
          print('❌ SOCKET ERROR: $error');
        },
        onDone: () {
          print('⚠️ SOCKET DISCONNECTED');
          if (!_forceDisconnect) {
            print('🔄 Attempting to reconnect...');
            reconnect();
          }
        },
      );
    } catch (e) {
      print('Error connecting to WebSocket: $e');
    }
  }

  void reconnect() {
    if (_socket != null && !_forceDisconnect) {
      print('🔄 Attempting to reconnect...');
      disconnect();
      connect();
    }
  }

  void _reSubscribeAfterSocketReconnect() {
    for (var stock in _stockSubscribedList) {
      _emitSubscribeStock(stock, true);
    }
    for (var exchange in _exchangeSubscribedList) {
      _emitSubscribeExchange(exchange, true);
    }
  }

  void _emitSubscribeStock(String symbol, bool subscribe) {
    _sendMessage(subscribe ? 'subscribeStock' : 'unsubscribeStock', {'symbol': symbol});
    if (subscribe) {
      _stockSubscribedList.add(symbol);
    } else {
      _stockSubscribedList.remove(symbol);
    }
  }

  void _emitSubscribeExchange(String id, bool subscribe) {
    _sendMessage(subscribe ? 'subscribeExchange' : 'unsubscribeExchange', {'id': id});
    if (subscribe) {
      _exchangeSubscribedList.add(id);
    } else {
      _exchangeSubscribedList.remove(id);
    }
  }

  void _sendMessage(String event, Map<String, dynamic> data) {
    if (_socket != null) {
      _socket!.add({'event': event, 'data': data});
    }
  }

  void _transformStockData(dynamic data) {
    // Logic xử lý dữ liệu stock
  }
}
