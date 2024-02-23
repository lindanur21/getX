import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Halaman Login",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onUsernameChanged,
                              decoration: InputDecoration(
                                hintText: "username",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Input username';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18),
                            TextFormField(
                              onChanged: controller.onPasswordChanged,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Input Password';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 18),
                            SizedBox(
                              // width: displayWidth(context) * 0.8,
                              // height: displayHeight(context) * 0.075,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tidak mempunyai akun? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.goToRegister();
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 118, 228),
                                      fontSize: 16.0,
                                      decoration: TextDecoration.none,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
