import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 89, 116),
        title: Text("N&A Consultores - Gestão"),
        titleTextStyle: TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            spacing: 10,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 400,
                height: 400,
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Usuário...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  icon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => print("click"),
                      label: Text("Login"),
                      icon: Icon(Icons.arrow_forward),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
