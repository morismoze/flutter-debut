import 'package:debutapp/ui/widgets/button.dart';
import 'package:debutapp/ui/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFieldWidget(
            hint: "E-mail",
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          TextFieldWidget(
            hint: "Password",
            inputType: TextInputType.visiblePassword,
            isObscure: true,
          ),
          const SizedBox(height: 25),
          Button(onPressed: () => print("log"), text: "Login"),
        ],
      ),
    );
  }
}
