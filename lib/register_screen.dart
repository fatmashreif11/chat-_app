import 'package:flutter/material.dart';
import 'package:untitled26/login-screen.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: fullnameController,
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                hintText: 'FullName',
              )
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
            controller:emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            )
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller:phonenumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'PhoneNumber',
                )
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller:passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',

                )
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(
                fullname:fullnameController.text,
                email:emailController.text,
                phonenumber:phonenumberController.text,
                password:passwordController.text,
              )
              )
              );
            }, child: Text('Sign Up'))



          ],
        ),
      ),
    );
  }
}
