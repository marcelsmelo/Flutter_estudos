import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_provider_example/login_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<LoginController>(context, listen: false).logout();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Text("Hello to Home Screen!"),
      ),
    );
  }
}
