import 'package:fabric_app/components/my_button.dart';
import 'package:fabric_app/components/square_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../components/text_field.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
   void signUserIn() async {

     // show loading circle
     showDialog(
       context: context,
       builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
     },);

     // sign in
     try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailController.text,
         password: passwordController.text,
       );

       // pop the loading circle
       Navigator.pop(context);
     }

     } On FirebaseAuthException; catch (e) {
       // pop the loading circle
       Navigator.pop(context);


       // Wrong Email
       if (e.code == 'user-not-found') {
         // show error to user
         wrongEmailMessage();

         // Wrong Password
       } else if(e.code == 'wrong-password') {
         // show error to user
         wrongPasswordMessage();
       }
     }

   // wrong email message popup
  void wrongEmailMessage(){
     showDialog(
         context: context,
         builder: (context) {
           return const AlertDialog(
             title: Text('Incorrect Email'),
           );
         }
     );
  }
  void wrongPasswordMessage(){
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // logo
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.black,
              ),
              const SizedBox(height: 50),

              // welcome text
              const Text(
                "Welcome to Fabric design store",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 25),

              // email text field
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              // password text field
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // forgot password?
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // sign in button
              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(height: 50.0),


              // or continue with
              const Padding(
                padding:EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey)
                        ,

                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),

              // google + facebook + apple
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(imagePath: 'lib/assets/Google__G__Logo.svg.png'),
                  SizedBox(width: 7.0),

                  // apple button
                  SquareTile(imagePath: 'lib/assets/Apple_logo_black.svg.png'),
                  SizedBox(width: 7.0),

                  // facebook button
                  SquareTile(imagePath: 'lib/assets/facebook_logo.png'),
                ],
              ),
              const SizedBox(height: 50.0),

              // don't have an account? create
              const Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    "Create one",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

