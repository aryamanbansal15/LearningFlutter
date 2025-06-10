import 'package:flutter/material.dart';
import 'package:fourth_app/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.blue,
      child:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_page.png",
              fit: BoxFit.scaleDown,
              height:400 ,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Welcome To Login Page", style: TextStyle(
              fontSize: 27,
              fontWeight:FontWeight.bold,
            ),
            ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:16.0, horizontal: 8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height:20.0,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  style: TextButton.styleFrom(minimumSize: Size(250, 60)),
                  child: Text("Login", style: TextStyle(
                    fontSize: 30,
                  )
                  )),
            ],
          ),
        )
          ],
        ),
      )
    );
  }
}
