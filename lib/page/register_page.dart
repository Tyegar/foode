import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controller
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmpasswordTextController =
      TextEditingController();

  //register method
  void register() async {
    //get auth service
    final _authService = AuthService();
    //check if the password match
    if (passwordTextController.text == confirmpasswordTextController.text) {
      try {
        await _authService.signUpWithEmailPassword(
            emailTextController.text, passwordTextController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }else{
      showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text("Password don't match!"),
                ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //logo
          Icon(
            Icons.delivery_dining,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(
            height: 25,
          ),

          //message,app slogan
          Text(
            "Create New Account",
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

          //confrimpass textfield
          MyTextField(
              controller: confirmpasswordTextController,
              obscureText: true,
              hintText: " Confirm Password"),
          const SizedBox(
            height: 10,
          ),

          //sign in button
          MyButton(text: "Sign up", onTap: register),
          const SizedBox(
            height: 25,
          ),
          //alreadey have an acc
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
