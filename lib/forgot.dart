import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_dairy_farm/signin.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 350, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            Image.asset(
              'assets/images/forgot.png',
              width: double.infinity,
              height: 350,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      color: Color.fromARGB(255, 87, 51, 83),
                      fontSize: 24,
                      fontFamily: 'Klasik'),
                  children: <TextSpan>[
                    TextSpan(text: 'Forgot your password?'),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(500, 255, 243, 233)),
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(10),
              // color: const Color.fromARGB(255, 255, 243, 233),
              child: Column(
                children: <Widget>[
                  const Text('Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 51, 83),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope')),
                  const Text(
                      'Enter your registered email below to receive password reset instruction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 51, 83),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Manrope')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 253, 169, 91),
                          fontFamily: 'Manrope',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email ID",
                        hintText: 'Enter Email ID',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 253, 167, 88),
                    ),
                    child: const Text(
                      'Send Reset Link',
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 51, 83),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                            color: Color.fromARGB(180, 87, 51, 83),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Monrope'),
                        children: <TextSpan>[
                          const TextSpan(text: ' Remember password?'),
                          TextSpan(
                              text: '  Login',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 87, 51, 83),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignIn(),
                                    ),
                                  );
                                }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
