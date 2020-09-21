import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fancy_dialog/fancy_dialog.dart';

class FundTransferTransactionHistory extends StatelessWidget {

  static BuildContext buildContext;

  List<Widget> containers = [
    Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: InkWell(
                splashColor: Colors.redAccent.withAlpha(30),
                onTap: (){
                  showDialog();
                },
                child: Container(
                  width: 400,
                  height: 120,
                    child:Center(
                      child: Card(

                        child: Column(
                            children: <Widget>[
                              new Container(
                                  decoration: new BoxDecoration (
                                      color:  CupertinoColors.quaternarySystemFill
                                  ),
                                  child: ListTile(
                                    title: Text("Saving Account",style: TextStyle(fontWeight: FontWeight.bold)),
                                    subtitle: Text("201023910239402"),
                                    trailing: Icon(Icons.keyboard_arrow_right,color: Colors.red,),
                                  )),

                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      "LKR     15000.00",
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                                  )
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      "Available balance",
                                      style: TextStyle(color: Colors.grey,fontSize: 12)
                                  )
                              )
                            ]
                        ),
                      ),
                    )
                ),
              ),
            ),
          ),
        )
    ),
    Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: InkWell(
                splashColor: Colors.redAccent.withAlpha(30),
                onTap: (){
                  print('Card Tapped');
                },
                child: Container(
                  width: 380,
                  height: 140,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: new Column(
                      children : <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 25, right: 25),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Account Number',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),
                              ),
                              Text('12345678',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.redAccent),)
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Available Amount',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Text('LKR 1500.00',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.blueAccent),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 25, top: 15),
                          alignment: Alignment.centerRight,
                          child: Text('Inactive',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    )
  ];

//  void _ResetButton(){
//    setState(() {
//      myController.text="";
//    });
//  }
//  _success(BuildContext context) async{
//    Navigator.pop(context);
//    _ResetButton();
//  }

  static dialog() {
//    return showDialog(
//        context: buildContext,
//        builder: (BuildContext context) => FancyDialog(
//          gifPath: FancyGif.SUBMIT,
//          title: "Fancy Gif Dialog",
//          descreption: "This is descreption for fancy gif,you can load any image or gif to be displayed :), and you can choose between two themes Fancy and Flat",
//        )
//    );

    _displayDialogBoxSec(BuildContext context) async {
      Navigator.pop(context);
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                          height: 60,
                          width: 350,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(color: Colors.red)
                              ]
                          ),
                          child: Center(
                              child: Text("Own Account", style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,)
                          )
                      ),

                      Container(
                          margin: EdgeInsets.only(left: 20, right: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: 'Account Number'),
                          )),

                      Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child: Text("201023910239402", style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Amount'),
                        ),),
                      Container(
                          margin: EdgeInsets.only(left: 25, right: 50),
                          child:
                          Text("LKR.", style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Date'),
                        ),),
                      Container(
                          margin: EdgeInsets.only(left: 25, right: 50),
                          child:
                          Text("", style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Status'),
                        ),),
                      Container(
                          margin: EdgeInsets.only(left: 25, right: 50),
                          child:
                          Text("SUCCESS", style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.green))),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:
                        TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Core Bank Response'),
                        ),),
                      Container(
                          margin: EdgeInsets.only(left: 25, right: 50),
                          child:
                          Text("Transaction successfully completed",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold))),

                      Container(
                          margin: EdgeInsets.only(left: 90),
                          child: ButtonBar(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ButtonTheme(
                                minWidth: 130,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.teal),
                                  ),
                                  color: Colors.teal,
                                  textColor: Colors.white,
                                  child: new Text('OK'),
                                  onPressed: () => (context),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {

    buildContext = context;
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
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
                  Align(
                    alignment: Alignment.bottomLeft,
                  child: HtmlWidget("""<h2 style='color:red;'>Registered Bill Payment</h2>"""),
                ),
                SizedBox(
                  height: 5,
                ),
                  Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.redAccent.withAlpha(30),
                              onTap: (){
                                dialog();
                              },
                              child: Container(

                                  width: 400,
                                  height: 120,
                                  child:Center(
                                    child: Card(

                                      child: Column(
                                          children: <Widget>[

                                            new Container(
                                                decoration: new BoxDecoration (
                                                    color:  CupertinoColors.quaternarySystemFill
                                                ),
                                                child: ListTile(
                                                  title: Text("73468829",style: TextStyle(fontWeight: FontWeight.bold)),
                                                  subtitle: Text("Kasun Perera"),
                                                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.red,),
                                                )),

                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                    "LKR     15000.00",
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                                                )
                                            ),
                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                    "2020-AUG-18",
                                                    style: TextStyle(color: Colors.grey,fontSize: 12)
                                                )
                                            )
                                          ]
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.redAccent.withAlpha(30),
                              onTap: (){
                                dialog();
                              },
                              child: Container(
                                  width: 400,
                                  height: 120,
                                  child:Center(
                                    child: Card(

                                      child: Column(
                                          children: <Widget>[
                                            new Container(
                                                decoration: new BoxDecoration (
                                                    color:  CupertinoColors.quaternarySystemFill
                                                ),
                                                child: ListTile(
                                                  title: Text("87376694",style: TextStyle(fontWeight: FontWeight.bold)),
                                                  subtitle: Text("Mahendra Alwis"),
                                                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.red,),
                                                )),

                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                    "LKR     3000.00",
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                                                )
                                            ),
                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                    "2020-JUL-29",
                                                    style: TextStyle(color: Colors.grey,fontSize: 12)
                                                )
                                            )
                                          ]
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Center(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.redAccent.withAlpha(30),
                              onTap: (){
                                dialog();
                              },
                              child: Container(
                                  width: 400,
                                  height: 120,
                                  child:Center(
                                    child: Card(

                                      child: Column(
                                          children: <Widget>[
                                            new Container(
                                                decoration: new BoxDecoration (
                                                    color:  CupertinoColors.quaternarySystemFill
                                                ),
                                                child: ListTile(
                                                  title: Text("54763382t",style: TextStyle(fontWeight: FontWeight.bold)),
                                                  subtitle: Text("Nuwan Zoyza"),
                                                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.red,),
                                                )),

                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                    "LKR     19000.00",
                                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                                                )
                                            ),
                                            Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                    "2020-JUL-13",
                                                    style: TextStyle(color: Colors.grey,fontSize: 12)
                                                )
                                            )
                                          ]
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
          ]
      ),
    ))));
  }


}