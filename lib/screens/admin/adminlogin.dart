import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velmora_apk/providers/logic.dart';
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
  bool eye = true;
  void open() {
    setState(() {
      eye = !eye;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        actions: [Icon(Icons.help_outline_rounded)],
        title: Text(
          "Velmora",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        leading: CircleAvatar(child: Icon(Icons.abc)),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              MyWidget(
                controller: emailcontroller,
                obscureText: false,
                labeltext: "email",
                prefixicon: Icon(Icons.mail),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }

                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (!emailRegex.hasMatch(value.trim())) {
                    return "Enter a valid email address";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              MyWidget(
                controller: passwordcontroller,
                obscureText: !eye,
                labeltext: "password",
                prefixicon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    open();
                  },
                  icon: eye
                      ? Icon(Icons.remove_red_eye_outlined)
                      : Icon(Icons.remove_red_eye_sharp),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password is required";
                  }

                  if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }

                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return "Add at least one uppercase letter";
                  }

                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return "Add at least one number";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              // ?
              context.watch<AdminProvider>().isLoading
                  ? const CircularProgressIndicator()
                  : Coustombutton(
                      text: "Login",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AdminProvider>().loginAdmin(
                            emailAddress: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim(),
                            context: context,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("The Login credintial is seccuss"),
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
