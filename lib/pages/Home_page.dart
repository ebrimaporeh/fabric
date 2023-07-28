import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // choose a design
                GestureDetector(
                  child: Row(
                    children: [
                      // choose a design icon
                      const Icon(
                        Icons.lock,
                        size: 50,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 7.0),
                      // choose a design text
                      const Text(
                        '',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 7.0),
                      // choose a design -  sample image of a design
                      Image(
                          image: Image.asset(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                // take measurement
                GestureDetector(
                  child: Row(
                    children: [
                      // choose a design icon
                      const Icon(
                        Icons.lock,
                        size: 50,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 7.0),
                      // choose a design text
                      const Text(
                        '',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 7.0),
                      // choose a design -  sample image of a design
                      Image(
                        image: Image.asset(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),

                //  place order
                GestureDetector(
                  child: Row(
                    children: [
                      // choose a design icon
                      const Icon(
                        Icons.lock,
                        size: 50,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 7.0),
                      // choose a design text
                      const Text(
                        '',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 7.0),
                      // choose a design -  sample image of a design
                      Image(
                        image: Image.asset(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
