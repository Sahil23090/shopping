
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Screens/signup.dart';

import '../Controller/login.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Login to get all the product on low price',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: ctrl.nameTextEditController,
                  decoration: const InputDecoration(
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.alternate_email_outlined)),
                  onChanged: (value) {
                    ctrl.name.value = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.passTextEditController,
                  decoration: const InputDecoration(
                      hintText: "Enter Password", prefixIcon: Icon(Icons.lock)),
                  onChanged: (value) {
                    ctrl.pass.value = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (ctrl.name.value == "" || ctrl.pass.value == "") {
                        Get.snackbar("OOPs!..", "fill all required fields to login succesfully",
                            duration: const Duration(seconds: 2),
                            snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.grey);
                        return;
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create an Account..',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Sign()));
                },
                child: const Text(
                  'sign up',
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.w300),
                ))
          ],
        ),
      ]),
    );
  }
}
