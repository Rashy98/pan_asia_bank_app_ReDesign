import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class CardPayment extends StatefulWidget {

  @override
  CardPayment({Key key, this.title}) : super(key: key);
  final String title;
  CreditCardPayments createState() => CreditCardPayments();
}

class CreditCardPayments extends State {

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final myController = TextEditingController();
  String radioItem = 'Name';
  String CardHolder = "Card Holder's Name";
  String AmountP = "Amount(LKR)";
  String HolderDetails = "Name";
  int _radioValue = 0;
  int id = 1;

  Widget _inputField(String title, Color border){
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
  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(

      margin: const EdgeInsets.all(8.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
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
                          color:  CupertinoColors.extraLightBackgroundGray
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

  void _ResetButton(){
    setState(() {
      CardHolder = "Card Holder's Name";
      myController.text="";
    });
  }

  _success(BuildContext context) async{
    Navigator.pop(context);
    _ResetButton();
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
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
                              BoxShadow(color:  Colors.red)
                            ]
                        ),
                        child:Center(
                            child:Text("DONE",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center)
                        )
                    ),
                    Container(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child: Text("Payment done by Successfully....", style: TextStyle(fontSize: 16))
                      ),
                    Container(
                        margin: EdgeInsets.only(left: 100),
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
                                onPressed: (){},
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

  Widget _buttons(){
    return Center(

        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
                child:RaisedButton(
                  child: new Text('RESET'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.red)
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: (){},
                )),
            ButtonTheme(

              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(color: Colors.teal)
                ),
                color: Colors.teal,
                textColor: Colors.white,
                child: new Text('TRANSFER'),
                onPressed: ()=>_displayDialog(context),
              ),
            )
          ],
        )
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          HolderDetails = "Name";
          CardHolder = "Card Holder's Name";
          break;
        case 1:
          HolderDetails = "Mobile No";
          CardHolder = "Card Holder's Mobile No";
          break;
      }
    });
  }

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
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: HtmlWidget("""<h2 style='color:red;'>Credit Card Payment</h2>"""),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Source Account")
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _SavingsAccount(),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Card Holder Details")
                      ),
                      Container(height: 20),
                      Theme(
                        data:Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.red,

                        ) ,
                        child:Row(
                            children:<Widget>[

                              new Radio(
                                value: 0,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                focusColor: Colors.red,
                                activeColor: Colors.red,
                                hoverColor: Colors.red,
                              ),
                              Text(
                                'Name',
                                style: new TextStyle(fontSize: 16.0),
                              ),

                              Container(height: 40),

                              new Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                focusColor: Colors.red,
                                activeColor: Colors.red,
                                hoverColor: Colors.red,
                              ),
                              Text(
                                'Mobile No',
                                style: new TextStyle(fontSize: 16.0),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _inputField(CardHolder,Colors.grey),
                      Container(height: 20),
                      _inputField("Amount (LKR)",Colors.grey),

                      Container(height: 50),

                      _buttons(),

                      SizedBox(
                        height: 20,
                      ),
                    ])
            )
        )
    );
  }



}