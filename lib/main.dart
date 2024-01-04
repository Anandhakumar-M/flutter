import 'package:flutter/material.dart';
import 'package:my_dairy_farm/signin.dart';
import 'package:my_dairy_farm/signup.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/welcome.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 250),
              child: Text(
                'WELCOME TO EMBARK',
                style: TextStyle(
                    fontFamily: 'Klasik',
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(250, 87, 51, 83)),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUp(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(85, 88, 225, 253),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                    color: Color.fromARGB(255, 87, 51, 83),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Manrope'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 88, 184, 253),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                    color: Color.fromARGB(255, 87, 51, 83),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Manrope'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
