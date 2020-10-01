import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ContactUs extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Image.asset("assets/logo.png", fit: BoxFit.cover),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(height: 20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: HtmlWidget("""<h2 style='color:red;'>Contact Us</h2>"""),
                      ),
                      Container(height: 40),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Color(0xFFB42827),
                          child: Column(
                              children: <Widget>[
                              Container(
                              height: 50.0,
                              ),
                                ListTile(
                                  leading: new IconTheme(
                                    data: new IconThemeData(
                                        color: Colors.white),
                                    child: new Icon(Icons.mail),
                                  ),
                                  title: Text('customerservice@pcbcbank.com',style: const TextStyle(
                                      color: Color(0xFFFFFFFF)
                                  ),),
                                  onTap: () => {Navigator.of(context).pop()},
                                ),
                                ListTile(
                                  leading: new IconTheme(
                                    data: new IconThemeData(
                                        color: Colors.white),
                                    child: new Icon(Icons.public),
                                  ),

                                  title: Text('www.pabcbank.com',style: const TextStyle(
                                      color: Color(0xFFFFFFFF)
                                  ),),
                                  onTap: () => {Navigator.of(context).pop()},
                                ),
                                ListTile(
                                  leading: new IconTheme(
                                    data: new IconThemeData(
                                        color: Colors.white),
                                    child: new Icon(Icons.phone),
                                  ),
                                  title: Text('+94114667222',style: const TextStyle(
                                      color: Color(0xFFFFFFFF)
                                  ),),
                                  onTap: () => {Navigator.of(context).pop()},
                                ),
                                ListTile(
                                  leading: new IconTheme(
                                    data: new IconThemeData(
                                        color: Colors.white),
                                    child: new Icon(Icons.local_printshop),
                                  ),
                                  title: Text('+94112565565',style: const TextStyle(
                                      color: Color(0xFFFFFFFF)
                                  ),),
                                  onTap: () => {Navigator.of(context).pop()},
                                ),
                                ListTile(
                                  leading: new IconTheme(
                                    data: new IconThemeData(
                                        color: Colors.white),
                                    child: new Icon(Icons.place),
                                  ),
                                  title: Text('Pan Asia Banking Corporation PLC, No 450, Galle Road, Colombo 03, Sri Lanka.',style: const TextStyle(
                                      color: Color(0xFFFFFFFF)
                                  ),),
                                  onTap: () => {Navigator.of(context).pop()},
                                ),
                                ListTile(),
                              ]
                          ),
                        )),
                    ])
            )
        )
    );
  }

}