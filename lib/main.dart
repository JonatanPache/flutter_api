import 'package:flutter/material.dart';
import 'package:flutter_api/screen/categories.dart';
import 'package:flutter_api/screen/login.dart';
import 'package:flutter_api/screen/register.dart';
import 'package:flutter_api/providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider())
      ],
      child: MaterialApp(
        title: 'Flutter API',
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/categories': (context) => Categories(),
        },
      ),
    );
  }
}
