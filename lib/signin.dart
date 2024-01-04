import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_dairy_farm/forgot.dart';
import 'package:my_dairy_farm/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              'assets/images/signIn.png',
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
                    TextSpan(text: 'Welcome back to EMBARK'),
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
                  const Text('Log in with email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 51, 83),
                          fontSize: 16,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
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
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        hintText: 'Enter The Password',
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
                      'Login',
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
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Forgot Password?',
                              style: const TextStyle(
                                fontFamily: 'Monrope',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 87, 51, 83),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Forgot(),
                                    ),
                                  );
                                }),
                        ],
                      ),
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
                          const TextSpan(text: ' Don’t have an account?'),
                          TextSpan(
                              text: ' Sign up?',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 87, 51, 83),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
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
