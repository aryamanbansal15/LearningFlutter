import 'package:flutter/material.dart';
import 'package:fourth_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async
  {
    if (_formKey.currentState?.validate()??false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: Text("Welcome To Login Page"),
      ),
      body: Container(
      color:Colors.blue,
      child:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_page.png",
                fit: BoxFit.scaleDown,
                height:400 ,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Hello $name", style: TextStyle(
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
                  validator: (value) {
                    if(value==null || value.isEmpty)
                      {
                        return "Username cannot be empty !";
                      }
                    return null;
                  },
                  onChanged: (value){
                    name = value;
                    setState(() {

                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if(value==null || value.isEmpty)
                      {
                        return "Password cannot be empty !";
                      }
                      else if(value.length < 6)
                      {
                        return "Password cannot be less than 6 characters.";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height:20.0,
                ),
                Material(
                  color:Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton?1000:10),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds:1),
                      width:changeButton?100:350,
                      height:changeButton?100:60,
                      alignment: Alignment.center,
                      child: changeButton
                          ?Icon(Icons.done,color:Colors.white, size:40)
                          :Text("Login", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: (){
                //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                //     },
                //     style: TextButton.styleFrom(minimumSize: Size(250, 60)),
                //     child: Text("Login", style: TextStyle(
                //       fontSize: 30,
                //     )
                //     )),
              ],
            ),
          )
            ],
          ),
        ),
      )
    )
    );
  }
}
