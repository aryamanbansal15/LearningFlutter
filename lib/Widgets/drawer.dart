import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child:
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                accountName: Text("Aryaman Bansal"),
                accountEmail: Text("aryamanbansal88@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/aryaman_pic.jpg"),
                ),
            )
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.white,
              ),
              title: Text("Contact Us", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),),
            )
          ],
        ),
      )
    );
  }
}
