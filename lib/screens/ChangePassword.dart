import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';

class ChangePassword extends StatelessWidget{

   Widget _inputField(String title, Color border) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: border),
        ),
      ),
    );
  }

  Widget _buttons(name, BuildContext context){
    return Center(
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
                minWidth: 200,
                child:RaisedButton(
                  child: new Text(name),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.red)
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: (){},
                )
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Image.asset("assets/logo.png", fit: BoxFit.cover),
        ),
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                        child: HtmlWidget("""<h2 style='color:red;'>Change Password</h2>"""),
                      ),
                      Container(

                        child:
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: _inputField('Current Password', Colors.grey),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: _inputField('New Password', Colors.grey),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: _inputField('Re - New Password', Colors.grey),
                              ),
                              Container(
                                  child: _buttons('Change Password', context)
                              ),
                            ],
                          )
                      )



                    ],
                  ),
                )
            )
          ],
        )
    );
  }

}