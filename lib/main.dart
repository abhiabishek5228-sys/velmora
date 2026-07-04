import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:velmora_apk/providers/logic.dart';
import 'package:velmora_apk/screens/admin/adminlogin.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';


void main()async {
 WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => AdminProvider(),
      child: MaterialApp(
       
        home: Adminlogin(),debugShowCheckedModeBanner: false,
      ),
    );
  }
}

