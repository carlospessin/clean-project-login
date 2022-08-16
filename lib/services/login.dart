import 'package:clean_project_login/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "https://reqres.in/api";

Future<void> login(context, emailController, passwordController) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var response = await http.post(Uri.parse('$BASE_URL/login'),
        body: ({
          'email': emailController.text,
          'password': passwordController.text
        }));
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid credentials")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Blank field not allowed")));
  }
}
