import 'package:flutter/material.dart';
import 'package:project_test_1/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final Map<String, dynamic>? userData;
  const HomePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: const Color.fromARGB(255, 122, 107, 161),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color: Color.fromARGB(255, 169, 239, 210)),
              child: Text(userData?['name'], textAlign: TextAlign.start),
            ),
            ListTile(
              title: TextButton.icon(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('username');
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout_outlined),
                label: const Text('LogOut'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: const Color.fromARGB(31, 195, 229, 140),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    'Welcome, ${userData?['name']}!'), // Assuming 'name' is a key in the user data
                Text('Email: ${userData?['email']}'),
                Text('Phone Number: ${userData?['phonenumber']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
