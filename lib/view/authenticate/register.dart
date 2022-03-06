import 'package:flutter/material.dart';
import 'package:internative/core/base/base_state.dart';
import 'package:internative/core/component/custom-widget-tabs.widget.dart';
import 'package:internative/core/component/elevated_button.dart';
import 'package:internative/core/component/outlined_button.dart';
import 'package:internative/core/services/login_api.dart';
import 'package:internative/view/authenticate/login.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends BaseState<Register> {
  String appBarText = "Sign Up";
  String loginbtnText = "Login";
  String registerbtnText = "Register";

  final email = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appBarText),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            logoMethod(),
            methodInput(email, "Email", Icons.mail, null, false),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: methodInput(password, "Password", Icons.lock, Icons.remove_red_eye, false),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: methodInput(rePassword, "Re-Password", Icons.lock, Icons.remove_red_eye, false),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 12),
              child: SizedBox(
                width: double.infinity,
                height: dynamicHeight(0.065),
                child: ElevatedButtonDesign(
                  context,
                  registerbtnText,
                  () async {
                    Api api = Api();
                    var result = await api.signUp({
                      "Email": email.text,
                      "Password": password.text,
                      "PasswordRetry": rePassword.text,
                    });
                    if (result == true) {
                      pushNewScreen(
                        context,
                        screen: CustomWidgetExample(
                          menuScreenContext: context,
                        ),
                      );
                    } else {
                      // buraya bar çıkacak
                      print("hatta");
                    }
                  },
                ),
              ),
            ),
            loginBtnMethod(context),
          ],
        ),
      ),
    );
  }

  SizedBox loginBtnMethod(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: dynamicHeight(0.065),
      child: OutlinedButtonDesign(
        context,
        loginbtnText,
        () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        },
      ),
    );
  }

  Padding logoMethod() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: SizedBox.square(
        dimension: dynamicWidth(0.5),
        child: const Placeholder(),
      ),
    );
  }

  Widget methodInput(cont, hintTxt, icon, suffixIcon, pass) {
    return TextFormField(
      obscureText: pass,
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
