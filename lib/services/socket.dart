import 'package:band_names/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier {

IO.Socket _socket;

ServerStatus _serverStatus = ServerStatus.Connecting;

ServerStatus get serverStatus => this._serverStatus;

IO.Socket get socket => _socket; 

SocketService(){
  this._initConfig();
}

void _initConfig() {

// Dart client
    _socket = IO.io('http://localhost:3000/',{
    'transports': ['websocket'],
    'autoConnect': true 
    });
    _socket.onConnect((_) {
     this._serverStatus = ServerStatus.Online;
     notifyListeners();
    });
    
    _socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

   /*_socket.on('nuevo-mensaje', ( payload ) {
      print('nuevo-mensaje: ');
      print('nombre: ' + payload['nombre']);
      print('mensaje: ' + payload['mensaje']);
      print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'no hay');

    });*/

}


}
