import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_test_1/homepage.dart';
import 'package:project_test_1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            return FutureBuilder(
              future: _fetchUserData(snapshot.data),
              builder: (context, userDataSnapshot) {
                if (userDataSnapshot.connectionState == ConnectionState.done) {
                  return HomePage(userData: userDataSnapshot.data);
                } else {
                  return const Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('android/assets/images/logo.png'),
                        ),
                        Center(child: Text('LoadingData...')),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          } else {
            return LoginPage();
          }
        } else {
          return const Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('android/assets/images/logo.png'),
                ),
                Center(child: Text('LoadingData...')),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<String?> _initializeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('userId'));
    print(prefs.getString('username'));
    return prefs.getString('username');
  }

  Future<Map<String, dynamic>> _fetchUserData(String? username) async {
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
