import 'package:coin_master/views/dahboard_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text('Sign in using Google'),
            onPressed: () {
              //TODO SIGN IN AND REDIRECT TO DASHBOARD
              Navigator.push(context, MaterialPageRoute(builder: (_)=>DashboardView()));
            }),
      ),
    );
  }
}
