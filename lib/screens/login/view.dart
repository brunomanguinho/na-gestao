import 'package:flutter/material.dart';
import 'package:gestao/screens/index/view.dart';
import 'package:gestao/screens/login/components.dart';
import 'package:gestao/screens/login/model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get userName => _userController.text.trim();
  String get password => _passwordController.text.trim();

  Future<void> submit() async {
    AuthService auth = AuthService();

    await auth.login(userName, password);

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IndexScreen()),
    );
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              children: [
                LogoImageLarge(),
                UserNameTextField(controller: _userController),
                PasswordTextField(controller: _passwordController),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Expanded(
                      child: LoginButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            submit();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
