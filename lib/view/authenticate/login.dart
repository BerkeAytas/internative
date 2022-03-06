import 'package:flutter/material.dart';
import 'package:internative/core/base/base_state.dart';
import 'package:internative/core/component/custom-widget-tabs.widget.dart';
import 'package:internative/core/component/elevated_button.dart';
import 'package:internative/core/component/outlined_button.dart';
import 'package:internative/core/services/login_api.dart';
import 'package:internative/view/authenticate/register.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends BaseState<Login> {
  String appBarText = "Login";
  String explanationText = "Giriş Yapmak İçin Tc Kimlik Numarınızı\n ve Cep Telefonu Numarınızı Giriniz";
  String loginbtnText = "Login";
  String registerbtnText = "Register";

  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appBarText),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                logoMethod(),
                methodInput(email, "Email", Icons.mail, null, false),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: methodInput(password, "Password", Icons.lock, Icons.remove_red_eye, true),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: dynamicHeight(0.065),
                    child: ElevatedButtonDesign(
                      context,
                      loginbtnText,
                      () async {
                        Api api = Api();
                        var result = await api.login({
                          "Email": email.text,
                          "Password": password.text,
                        });
                        if (result == true) {
                          pushNewScreen(
                            context,
                            screen: CustomWidgetExample(
                              menuScreenContext: context,
                            ),
                          );
                        } else {
                          AlertDialog(
                            actions: [
                              Column(
                                children: [Text("Email veya Şifreniz Hatalıdır.")],
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
                registerPageBtnMethod(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox registerPageBtnMethod(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: dynamicHeight(0.065),
      child: OutlinedButtonDesign(
        context,
        registerbtnText,
        () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
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
