import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_test_1/homepage.dart';
import 'package:project_test_1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _phonenumberController = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  final purpleColor = const Color(0xff6688ff);
  final darkTextColor = const Color(0xff1F1A3D);
  final lightTextColor = const Color(0xff999999);
  final textFieldColor = const Color(0xffF5F6FA);
  final borderColor = const Color(0xffD9D9D9);

  Widget getTextField(
      {required hint,
      required labeltext,
      required controllerText,
      required icon}) {
    return TextField(
      controller: controllerText,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          fillColor: textFieldColor,
          filled: true,
          prefixIcon: icon,
          labelText: labeltext,
          labelStyle: const TextStyle(fontSize: 14),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Page'),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: lightTextColor),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Login..',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: purpleColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              getTextField(
                labeltext: 'Name',
                hint: 'Enter the Name',
                controllerText: _nameController,
                icon: const Icon(Icons.person_4_outlined),
              ),
              const SizedBox(
                height: 14,
              ),
              getTextField(
                labeltext: 'Email',
                hint: 'Enter the Email',
                controllerText: _emailController,
                icon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(
                height: 10,
              ),
              getTextField(
                labeltext: 'Password',
                hint: 'Enter the Password',
                controllerText: _passwordController,
                icon: const Icon(Icons.password),
              ),
              const SizedBox(
                height: 10,
              ),
              getTextField(
                labeltext: 'PhoneNumber',
                hint: 'Enter the PhoneNumber',
                controllerText: _phonenumberController,
                icon: const Icon(Icons.phone_android),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    _signup(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(purpleColor),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 14))),
                  child: const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) async {
    String name = _nameController.text.trim();
    String username = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String phonenumber = _phonenumberController.text.trim();

    Map<String, dynamic> signUpData = {
      'name': name,
      'email': username,
      'password': password,
      'phonenumber': phonenumber,
    };

    if (name.isNotEmpty &
        username.isNotEmpty &
        password.isNotEmpty &
        phonenumber.isNotEmpty) {
      try {
        Response response = await Dio().post(
          'https://9b0b-2409-408d-3d9c-f5e5-598b-da27-9f87-73de.ngrok-free.app/user',
          data: signUpData,
        );

        // Check if the request was successful
        if (response.statusCode == 201) {
          // Parse the response JSON
          print('enter');
          Map<String, dynamic> responseData = json.decode(response.toString());
          print('enter1');
          print(responseData);
          print(responseData['user']['id']);
          // Extract user ID from the response
          var userId = responseData['user']['id'];
          var username = responseData['user']['email'];
          print(responseData);
          print('entery3');
          print(userId.toString());

          // Save the user ID to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('username', username.toString());
          print('entery4');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                userData: signUpData,
              ),
            ),
          );
        } else {
          // Handle errors or display appropriate messages
          print('Sign-up failed: ${response.statusCode}');
        }
      } catch (error) {
        // Handle Dio errors
        print('Dio error: $error');
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please enter a valid username.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
