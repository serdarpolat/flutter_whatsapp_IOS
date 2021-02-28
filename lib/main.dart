import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/res/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageStates()),
        ChangeNotifierProvider(create: (_) => ChatStates()),
        ChangeNotifierProvider(create: (_) => CallStates()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp',
        theme: ThemeData(
          fontFamily: "SF",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
