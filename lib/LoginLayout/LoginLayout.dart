// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/HomeLayout/HomeLayout.dart';

import 'Components.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();

  var idcontroller = TextEditingController();

  var password = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: defultformfield(
                      Texcolor: const TextStyle(color: Colors.black),
                      validator: (value) =>
                          value!.isEmpty ? 'Id is required' : null,
                      controller: idcontroller,
                      type: TextInputType.phone,
                      label: 'ID',
                      prefix: Icons.numbers),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defultformfield(
                  Texcolor: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: password,
                  type: TextInputType.visiblePassword,
                  label: 'Password',
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  suffixpressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  validator: (value) =>
                      value!.isEmpty ? 'Password is required' : null,
                  prefix: Icons.lock,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Selectedport(changed: (value) {
                      setState(() {
                        Available = value;
                      });
                    })),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: defultbutton(
                      text: 'Login',
                      function: () {
                        final form = formkey.currentState;

                        if (form != null && form.validate()) {
                          Navigateto(context, const HomeLayout());
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
