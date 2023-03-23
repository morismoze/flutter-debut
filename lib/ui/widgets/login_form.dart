import 'package:debutapp/ui/widgets/styled_button.dart';
import 'package:debutapp/ui/widgets/styled_text_form_field.dart';
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
          StyledTextFormField(
            icon: Icons.email_outlined,
            hint: "E-mail",
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          StyledTextFormField(
            hint: "Password",
            inputType: TextInputType.visiblePassword,
            isObscure: true,
          ),
          const SizedBox(height: 25),
          StyledButton(onPressed: () => print("log"), text: "Login"),
        ],
      ),
    );
  }
}
