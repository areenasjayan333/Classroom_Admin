
import 'package:classroom/page/class.dart';
import 'package:classroom/page/home.dart';
import 'package:classroom/page/login.dart';

import 'package:classroom/provider/subject_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
       

          ChangeNotifierProvider.value(
          value: SubjectProvider())],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        primarySwatch: Colors.teal,
      ),
      home:  const HomePage(),

      routes: {
        HomePage.routeName:((context) => const HomePage()),
        ClassPage.routeName:(context) =>  ClassPage()
      },
    )
     );
  }
}


