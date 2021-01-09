import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/pages/home.dart';
import 'package:band_names/pages/status.dart';
import 'package:band_names/services/socket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider (
          providers: [
            ChangeNotifierProvider(create: (_) => SocketService())
          ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material app',
        initialRoute: 'home',
        routes: {
          'home':(_) => HomePage(),
          'status':(_) => StatusPage()
        },
      ),
    );
  }
}
