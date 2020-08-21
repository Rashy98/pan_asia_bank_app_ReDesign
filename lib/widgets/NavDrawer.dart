import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/screens/RegisteredBillPayment.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color(0xFFB42827),
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
          child: DrawerHeader(

            child: Text(
              'MANUJAYA'+"\n" + "manujayapremathilaka@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
//            decoration: BoxDecoration(
//                color: Colors.green,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    )),
          ),

          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome' , style: const TextStyle(
              color: Color(0xFFFFFFFF)
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisteredBillPayment()));
            },

          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      )
      ),
    );
  }
}