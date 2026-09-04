import 'package:flutter/material.dart';
import 'package:gestao/ui/components.dart';

class LogoImageLarge extends StatelessWidget {
  const LogoImageLarge({super.key, this.width = 400, this.height = 400});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LogoImage(width: width, height: width);
  }
}

class UserNameTextField extends StatefulWidget {
  const UserNameTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<UserNameTextField> createState() => _UserNameTextFieldState();
}

class _UserNameTextFieldState extends State<UserNameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Informe o usuário';
        }
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Usuário...',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Informe a senha';
        }
        return null;
      },
      controller: widget.controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha...',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(Icons.password),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text("Login"),
      icon: Icon(Icons.arrow_forward),
      iconAlignment: IconAlignment.end,
    );
  }
}
