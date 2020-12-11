import 'package:flutter/material.dart';
import 'package:testapp/screens/form_screen.dart';
import 'package:testapp/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test_app',
      theme: ThemeData(
          primaryColor: Colors.grey[400],
          appBarTheme: AppBarTheme(centerTitle: true),
          scaffoldBackgroundColor: Colors.grey[400]),
      initialRoute: FormScreen.id,
      routes: {
        FormScreen.id: (ctx) => FormScreen(),
        ProfileScreen.id: (ctx) => ProfileScreen()
      },
    );
  }
}
