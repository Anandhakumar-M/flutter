import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_test_1/homepage.dart';
import 'package:project_test_1/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final purpleColor = const Color(0xff6688ff);
  final darkTextColor = const Color(0xff1F1A3D);
  final lightTextColor = const Color(0xff999999);
  final textFieldColor = const Color(0xffF5F6FA);
  final borderColor = const Color(0xffD9D9D9);

  Widget getTextField(
      {required hint,
      required labeltext,
      required controllerText,
      required icon,
      required view}) {
    return TextField(
      obscureText: view,
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

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: purpleColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Text(
                  'Don`t have an account?',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: lightTextColor),
                ),
                RichText(
                  text: TextSpan(
                    text: 'SignUp..',
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
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            getTextField(
              labeltext: 'Email',
              hint: 'Enter the Email',
              controllerText: _emailController,
              icon: const Icon(Icons.email_outlined),
              view: false,
            ),
            const SizedBox(
              height: 10,
            ),
            getTextField(
              labeltext: 'Password',
              hint: 'Enter the Password',
              controllerText: _passwordController,
              icon: const Icon(Icons.password),
              view: true,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  _login(context);
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
    );
  }

  void _login(BuildContext context) async {
    String username = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty & password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FutureBuilder(
            future: _fetchUserData(username),
            builder: (context, userDataSnapshot) {
              print('entry0');
              if (userDataSnapshot.connectionState == ConnectionState.done) {
                print('entry1');
                return HomePage(userData: userDataSnapshot.data);
              } else if (userDataSnapshot.hasError) {
                print('Error fetching user data: ${userDataSnapshot.error}');
                return const Scaffold(
                  body: Center(
                    child: Text('Error fetching user data'),
                  ),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      );
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

  Future<Map<String, dynamic>> _fetchUserData(String? username) async {
    print(username);

    String apiUrl =
        'https://9b0b-2409-408d-3d9c-f5e5-598b-da27-9f87-73de.ngrok-free.app/user/email/$username';

    try {
      Response response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        print(response);
        return response.data;
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
        return {};
      }
    } catch (error) {
      print('Dio error: $error');
      return {};
    }
  }
}
