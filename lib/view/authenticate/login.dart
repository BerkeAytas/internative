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
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  padding: const EdgeInsets.only(top: 32, bottom: 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: dynamicHeight(0.065),
                    child: ElevatedButtonDesign(
                      context,
                      loginbtnText,
                      () async {
                        /*pushNewScreen(
                          context,
                          screen: CustomWidgetExample(
                            menuScreenContext: context,
                          ),
                        );*/
                        Api api = Api();
                        var result = await api.login({
                          "Email": email.text,
                          "Password": password.text,
                        });
                        /*if (_formKey.currentState!.validate()) {
                          bool result = await Api().login(
                            email.text,
                            password.text,
                          );
                          if (result) {
                            print("Giriş Yapıldı");
                            _formKey.currentState!.reset(); //Login olduktan sonra state sıfırlamak için kullanılıyor.
                            pushNewScreen(
                              context,
                              screen: CustomWidgetExample(
                                menuScreenContext: context,
                              ),
                            );
                          } else {
                            print("Giriş başarısız");
                          }
                        }*/
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBar()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: dynamicHeight(0.065),
                  child: OutlinedButtonDesign(
                    context,
                    registerbtnText,
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                    },
                  ),
                ),
              ],
            ),
          ),
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
