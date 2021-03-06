import 'package:flutter/material.dart';
import 'package:internative/core/base/base_state.dart';
import 'package:internative/core/component/elevated_button.dart';
import 'package:internative/core/component/outlined_button.dart';
import 'package:internative/core/shared/costum_shared.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends BaseState<Profile> {
  String appbarTitle = "My Profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appbarTitle)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              imageMethod(context),
              locationMethod(),
              saveBtnMethod(context),
              logOutBtnMethod(context),
            ],
          ),
        ),
      ),
    );
  }

  TextButton imageMethod(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          useRootNavigator: true,
          builder: (context) => Column(
            children: [
              Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: dynamicWidth(0.45),
                    height: dynamicHeight(0.065),
                    child: ElevatedButtonDesign(
                      context,
                      "Select",
                      () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actions: [
                              Column(
                                children: [
                                  const Text('Select a Picture'),
                                  SizedBox(
                                    height: dynamicHeight(0.065),
                                    child: ElevatedButtonDesign(context, "Camera", () {}),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 32, bottom: 12),
                                    child: SizedBox(
                                      //padding: const EdgeInsets.only(top: 32, bottom: 12),
                                      height: dynamicHeight(0.065),
                                      child: OutlinedButtonDesign(context, "Gallery", () {}),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: dynamicWidth(0.05),
                  ),
                  SizedBox(
                    width: dynamicWidth(0.45),
                    height: dynamicHeight(0.065),
                    child: OutlinedButtonDesign(context, "Remove", () {}),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      child: const CircleAvatar(
        backgroundColor: primaryColor,
        radius: 80,
      ),
    );
  }

  SizedBox logOutBtnMethod(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: dynamicHeight(0.065),
      child: ElevatedButtonDesign(context, "Log Out", () {}),
    );
  }

  Padding saveBtnMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: dynamicHeight(0.065),
        child: OutlinedButtonDesign(context, "Save", () {}),
      ),
    );
  }

  Container locationMethod() {
    return Container(
      color: Colors.grey,
      height: 200,
    );
  }
}
