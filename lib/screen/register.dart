import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            onPressed: (){Navigator.pushNamed(context, '/categories');},
            child: Text('register'),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,36)
            ),

          )
        ],
      ),
    );
  }
}
