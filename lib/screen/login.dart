import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email'
            ),
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                labelText: 'Password'
            ),
          ),
          ElevatedButton(
            onPressed: (){print('login clicked');},
            child: Text('login'),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,36)
            ),

          )
        ],
      ),
    );
  }
}
