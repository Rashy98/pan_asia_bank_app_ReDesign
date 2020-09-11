import 'package:flutter/material.dart';
//import 'package:pan_asia_bank_app/screens/AdHocBillPaymentForm.dart';
import 'package:pan_asia_bank_app/screens/Login.dart';
import 'package:pan_asia_bank_app/screens/ManageAccount.dart';
import 'package:pan_asia_bank_app/screens/MyProfile.dart';
import 'package:pan_asia_bank_app/screens/RegisteredBillPayment.dart';
import 'package:pan_asia_bank_app/screens/AccountSummary.dart';


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
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard' , style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegisteredBill()));
            },
          ),

          ListTile(
            leading: Icon(Icons.input),
            title: Text('My Accounts' , style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AccountSummary()));
            },
          ),

            ListTile(
            leading: Icon(Icons.input),
            title: Text('Fund Transfer' , style: const TextStyle(
              color: Color(0xFFFFFFFF)
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => AccountSummary()));
            },

          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Pay Bills' , style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegisteredBill()));
            },

          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Standing orders',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Card Services',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyProfile()))
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ManageAccount()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Preferences',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('ATM and Branch Locator',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RegisteredBill())
              )},

          ),
          ListTile(
            leading: Icon(Icons.local_phone),
            title: Text('Contact Us',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login())
              )
            },
          ),
        ],
      )
      ),
    );
  }
}