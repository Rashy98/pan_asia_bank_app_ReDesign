import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:pan_asia_bank_app/screens/ChangePassword.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';

class ManageAccount extends StatelessWidget{

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
                  onPressed: (){
                    if(name == 'Change Password'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                    }
                  },
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
        body: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                    child: HtmlWidget("""<h2 style='color:red;'>Manage Account</h2>"""),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        Column(
                          children: [

                            Container(
                              margin: const EdgeInsets.only( top: 200),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buttons('Change Username', context)
                                ],
                              ),
                            ),
                            Container(
//                        margin: const EdgeInsets.only(left: 110, top: 25, right: 25),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buttons('Change Password', context)
                                ],
                              ),
                            ),
                            Container(
//                        margin: const EdgeInsets.only(left: 110, top: 25, right: 25),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buttons('Change Contact No', context)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ],
              )

            ),
        )
    );
//    Container(
//      child: Align(
//        alignment: Alignment.center,
//          _buttons()
//      ),
//    );
  }

}