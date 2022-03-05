import 'package:flutter/material.dart';
import 'package:internative/core/base/base_state.dart';
import 'package:internative/core/shared/costum_shared.dart';
import 'package:internative/view/homepage/homepage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends BaseState<Register> {
  String loginbtnText = "Login";
  String registerbtnText = "Register";

  final email = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: SizedBox.square(
                dimension: dynamicWidth(0.5),
                child: const Placeholder(),
              ),
            ),
            methodInput(email, "Email", Icons.mail, null),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: methodInput(password, "Password", Icons.lock, Icons.remove_red_eye),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: methodInput(rePassword, "Re-Password", Icons.lock, Icons.remove_red_eye),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 12),
              child: SizedBox(
                width: double.infinity,
                height: dynamicHeight(0.065),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.exit_to_app),
                      Text(
                        registerbtnText,
                        style: themeData.textTheme.subtitle2?.copyWith(color: whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: dynamicHeight(0.065),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                },
                child: Row(
                  children: [
                    const Icon(Icons.exit_to_app),
                    Text(
                      loginbtnText,
                      style: themeData.textTheme.subtitle2!,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget methodInput(cont, hintTxt, icon, suffixIcon) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        suffixIcon: Icon(suffixIcon),
        hintText: hintTxt,
        hintStyle: const TextStyle(fontSize: 14),
      ),
      controller: cont,
    );
  }
}
