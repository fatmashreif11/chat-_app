import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'chat_screen.dart';class LoginScreen extends StatefulWidget {
  String? fullname;
  String? email;
  String? phonenumber;
  String? password;
  LoginScreen(
  {
    this.fullname,
    this.email,
    this.phonenumber,
    this.password,
});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        centerTitle: true,
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  labelText: 'Enter your password',

                ),
              ),
              ElevatedButton(
                onPressed: () {
                  const SpinKitThreeInOut(
                    color: Colors.indigo,
                    size: 50.0,
                  );


                  if (key.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          email: emailController.text,
                          password: passwordController.text,

                        ),
                      ),
                    );
                  }
                },
                child:
                const Text('Sign In')
              ),
            ],
          ),
        ),
      ),
    );
  }
}










