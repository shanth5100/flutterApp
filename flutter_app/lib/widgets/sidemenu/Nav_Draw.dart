import 'package:flutter/material.dart';

class Nav_Draw extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              "Sidemenu",
              style: TextStyle(color: Colors.blue, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    // image: AssetImage('../assets/images/Tabs success.png'))),
                    image: AssetImage('../../assets/images/Tabs success.png'))),
          ),
          ListTile(
            leading: Icon(Icons.add_to_home_screen),
            title: Text("HomeScreen"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Add"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Cam"),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Contats"),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
