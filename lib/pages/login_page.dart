import 'package:fabric_app/components/my_button.dart';
import 'package:fabric_app/components/square_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

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
     } on FirebaseAuthException catch (e) {
       // pop the loading circle
       Navigator.pop(context);
       // show error message
       showErrorMessage(e.code);



     }
   }

   // error message to user
  void showErrorMessage(String message){
     showDialog(
         context: context,
         builder: (context) {
           return AlertDialog(
             backgroundColor: Colors.grey,
             title: Center(
               child: Text(
                 message,
                 style: const TextStyle(color: Colors.grey),
               ),
             ),
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
          child: SingleChildScrollView(
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
                  text: 'Sign up',
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
                Row(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 4.0),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Create one",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
