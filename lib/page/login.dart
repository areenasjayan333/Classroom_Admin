import 'package:classroom/page/home.dart';
import 'package:flutter/material.dart';


import '../widget/reusable.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

 return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 0, 14),
            Color.fromARGB(255, 2, 32, 57),
            Color.fromARGB(255, 6, 63, 109),
            Color.fromARGB(255, 14, 92, 156),
            Colors.blue
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter your email",
                    Icons.mail_outline_rounded, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                  firebaseUIButton(context, "Sign In", () {

                    if(_emailTextController.text== 'admin' && _passwordTextController.text == 'admin'){
                        Navigator.pushNamed(context,HomePage.routeName);
                    }
                  }),
             
             
              
              ],
            ),
          ),
        ),
      ),
    );


    
  }
}

