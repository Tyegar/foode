import 'package:flutter/material.dart';
import 'package:foode/components/my_textfield.dart';

import '../components/my_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  //login method
  void login (){
    /*
  
    fill the auth

    */

    //navigate to home
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(
            height: 25,
          ),
          //message,app slogan
          Text(
            "Food Delivery App",
            style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(
            height: 25,
          ),
          //email textfield
          MyTextField(
              controller: emailTextController,
              obscureText: false,
              hintText: "Email"),
          const SizedBox(
            height: 10,
          ),
          //pass textfield
          MyTextField(
              controller: passwordTextController,
              obscureText: true,
              hintText: "Password"),
          const SizedBox(
            height: 10,
          ),
          //sign in button
          MyButton(
          text: "Sign in", 
          onTap: login
          ),
          const SizedBox(
            height: 25,
          ),
          //not a memeber?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member?",
                style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap:widget.onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
