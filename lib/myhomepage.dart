import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('api calling'),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getHttp,
      ),
    );
  }

  // void fechdata() async {
  //   print('hi budy');
  //   const url = "http://1277.0.0.0:8889/api/v1/users?page=1";
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   setState(() {
  //     users = json['result'];
  //   });
  //   print('complect');
  // }
  void getHttp() async {
    print('start');
    var response =
        await Dio().get("https://jsonplaceholder.typicode.com/todos/1");
    print(response);
    print('run');
  }

  // void _sendGetRequest() async {
  //   final _connect = GetConnect();
  //   final response =
  //       await _connect.get('https://jsonplaceholder.typicode.com/todos/1');
  //   final body = response;
  //   //final json = jsonDecode(body);
  //   List<dynamic> users = [body];

  //   print(response.body);
  // }
}
