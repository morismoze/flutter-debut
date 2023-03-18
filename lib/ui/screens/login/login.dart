import 'package:debutapp/ui/widgets/horizontal_or_line.dart';
import 'package:debutapp/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back 👋",
                      style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: 15),
                  Text(
                      "We are happy to see you again. To continue using your account, please sign in.",
                      style: TextStyle(
                          fontSize: 14, color: Color(0xFF797979), height: 1.5)),
                  SizedBox(height: 40),
                  LoginForm(),
                  SizedBox(height: 50),
                  HorizontalOrLine(label: "Or continue with")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
