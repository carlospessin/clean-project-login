import 'package:clean_project_login/services/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email)),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: InkWell(
                      onTap: _toggle,
                      child: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.remove_red_eye))),
              obscureText: _obscureText,
            ),
            const SizedBox(height: 45),
            OutlinedButton.icon(
              onPressed: () {
                login(
                  context,
                  emailController,
                  passwordController,
                );
              },
              icon: const Icon(Icons.login, size: 18),
              label: const Text("Login"),
            )
          ],
        ))),
      ),
    );
  }
}
