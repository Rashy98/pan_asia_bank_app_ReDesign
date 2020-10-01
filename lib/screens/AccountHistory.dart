import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';


class ViewAccountHistory extends StatefulWidget {
  @override
  ViewAccountHistory({Key key, this.title}) : super(key: key);
  final String title;
  AccountHistory createState() => AccountHistory();

}
class AccountHistory extends State{
  static BuildContext buildContext;
  DateTime _StartDate;
  DateTime _EndDate;

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Widget _SavingsAccount(){
    return Container(
        height: 120,
        width: 400,
        margin: const EdgeInsets.all(8.0),

        child:Center(
          child: Card(

            child: Column(
                children: <Widget>[
                  new Container(
                      decoration: new BoxDecoration (
                          color:  CupertinoColors.quaternarySystemFill
                      ),
                      child: ListTile(
                        leading: Icon(Icons.account_balance_wallet, color: Colors.red),
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
    );

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: HtmlWidget(
                            """<h2 style='color:red;'>Account History</h2>"""),
                      ),
//                      Container(child: ConstrainedBox(
//                          constraints: BoxConstraints.expand(),
//                          child: FlatButton(
//                              onPressed: () {
//                                showDialog1(context);
//                                },
//                              padding: EdgeInsets.all(0.0),
//                              child: Image.asset("assets/search.png")))),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Source Account")
                      ),
                      _SavingsAccount(),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            color: Color(0xFFB42827),
                            child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                  ),
                                  Container(
                                      height: 120,
                                      width: 400,
                                      margin: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            showDialog2(context);
                                          },
                                          child: Card(
                                            child: Column(children: <Widget>[
                                              Align(
                                                  alignment: Alignment(0.9, 10),
                                                  child: Text("2020-AUG-18",
                                                      style: TextStyle(
                                                          color: Colors.grey, fontSize: 12))),
                                              new Container(
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      CupertinoColors.quaternarySystemFill),
                                                  child: ListTile(

                                                    title: Text("Cash Deposit",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold)),
                                                    trailing: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: Colors.red,
                                                    ),
                                                  )),
                                              Align(
                                                  alignment: Alignment(0.9, 10),
                                                  child: Text("LKR     10000.00",
                                                      style: TextStyle(

                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15))),

                                            ]),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 120,
                                      width: 400,
                                      margin: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            showDialog2(context);
                                          },
                                          child: Card(
                                            child: Column(children: <Widget>[
                                              Align(
                                                  alignment: Alignment(0.9, 10),
                                                  child: Text("2020-Jul-01",
                                                      style: TextStyle(
                                                          color: Colors.grey, fontSize: 12))),
                                              new Container(
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      CupertinoColors.quaternarySystemFill),
                                                  child: ListTile(

                                                    title: Text("Cash Withdrawal",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold)),
                                                    trailing: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: Colors.red,
                                                    ),
                                                  )),
                                              Align(
                                                  alignment: Alignment(0.9, 10),
                                                  child: Text("LKR     3000.00",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15))),

                                            ]),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 120,
                                      width: 400,
                                      margin: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            showDialog2(context);
                                          },
                                          child: Card(
                                            child: Column(children: <Widget>[
                                              Align(
                                                  alignment: Alignment(0.9, 10),
                                                  child: Text("2020-Jun-19",
                                                      style: TextStyle(
                                                          color: Colors.grey, fontSize: 12))),
                                              new Container(
                                                  decoration: new BoxDecoration(
                                                      color:
                                                      CupertinoColors.quaternarySystemFill),
                                                  child: ListTile(

                                                    title: Text("Utility Pay - 0771213234",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold)),
                                                    trailing: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: Colors.red,
                                                    ),
                                                  )),
                                              Align(
                                                  alignment: Alignment(0.9, 10),
                                                  child: Text("LKR     11000.00",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15))),

                                            ]),
                                          ),
                                        ),
                                      ))
                                ]
                            ),
                          ),
                      ),
                    ])))
    );
  }

  Future showDialog2(context) {
    return showDialog(
      context: context,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 400,
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
                        boxShadow: [BoxShadow(color: Colors.red)]),
                    child: Center(
                        child: Text(
                          "Summary",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ))),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 50),
                  child: Text("2020-Jul-01",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),

                Container(
                  margin: EdgeInsets.only(left: 25, right: 50),
                  child: Text("P45G7",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Amount'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("LKR.3000",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("Credit",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Action'),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 50),
                    child: Text("Cash Withdrawal",
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
                            onPressed: ()=> Navigator.of(context).pop(),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showDialog1(context) {
    return showDialog(
        context: context,
        child: Dialog(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 300,
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
                          boxShadow: [BoxShadow(color: Colors.red)]),
                      child: Center(
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ))),
                Align(
                    child: Row(
                        children: <Widget>[
                          RaisedButton(
                              child: Text(_StartDate == null ?"     Start Date   " : convertDateTimeDisplay(_StartDate.toString())),
                              onPressed: (){
                                showDatePicker(context: context,
                                  initialDate: (_StartDate == null ?  DateTime.now() : _StartDate),
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2222),
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.dark(), // This will change to light theme.
                                      child: child,
                                    );
                                  },
                                ).then((date) {
                                  setState(() {
                                    _StartDate = date;
                                  });
                                });
                              }
                          ),
                        ]
                    )
                ),
                Align(
                  child: Row(
                      children: <Widget>[
                        RaisedButton(
                            child: Text(
                                _EndDate == null ?"     End Date     " : convertDateTimeDisplay(_EndDate.toString())),
                            onPressed: (){
                              showDatePicker(context: context,
                                initialDate: (_EndDate == null ?  DateTime.now() : _EndDate),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2222),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.dark(), // This will change to light theme.
                                    child: child,
                                  );
                                },
                              ).then((date) {
                                setState(() {
                                  _EndDate = date;
                                });
                              });
                            }
                        ),
                        ]
                      )
                  ),
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
                              child: new Text('Search'),
                              onPressed: ()=> Navigator.of(context).pop(),
                            ),
                          )
                        ],
                      )),
                ]

              )
            )
          )
        )
    );
  }
}