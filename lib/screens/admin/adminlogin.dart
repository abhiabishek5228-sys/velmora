import 'package:flutter/material.dart';
import 'package:velmora_apk/widgets/coustombutton.dart';
import 'package:velmora_apk/widgets/reusable_textfieldwidget.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            MyWidget(
              controller: emailcontroller,
              obscureText: false,
              labeltext: "email",
              prefixicon: Icon(Icons.mail),
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "please enter the E-mail";
                }
                if (!p0.contains("@")) {
                  return "please enter a valid email address";
                }
                return null;
              },

              suffixIcon: null,
            ),
            SizedBox(height: 20),
            MyWidget(
              controller: passwordcontroller,
              obscureText: true,
              labeltext: "password",
              prefixicon: Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye_outlined),
              ),
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "please enter the password";
                }
                if (p0.length > 8) {
                  return "minimum eight charectors needed";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Coustombutton(
              text: "Login",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
