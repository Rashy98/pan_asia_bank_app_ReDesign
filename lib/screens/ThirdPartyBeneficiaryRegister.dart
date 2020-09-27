import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';



class ThirdPartBeneficiary extends StatefulWidget {
  @override
  ThirdPartBeneficiary({Key key, this.title}) : super(key: key);
  final String title;
  ThirdPartBeneficiaryRegister createState() => ThirdPartBeneficiaryRegister();


}

// ignore: must_be_immutable
class ThirdPartBeneficiaryRegister extends State {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final myController = TextEditingController();
  String radioItem = 'Account';
  String beneName = "Beneficiary Name";
  String beneAccNo = "Beneficiary Account/Card Number";
  String bankName = "Beneficiary Bank Name";
  String beneEmail = "Beneficiary Email";
  String Type = "Account";
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

  Widget _radioButtons(String text) {
    return RadioListTile(
      groupValue: radioItem,
      title: Text(text),
      value:text,
      onChanged: (val) {
        setState(() {
          radioItem = val;
        });
      },
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


  void _ResetButton(){
    setState(() {

      beneName = "Beneficiary Name";
      beneAccNo = "Beneficiary Account/Card Number";
      bankName = "Beneficiary Bank Name";
      beneEmail = "Beneficiary Email";

    });
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
                            child:Text("Beneficiary Register",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center)
                        )
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 30, top: 30),
                        child:
                        Text("Beneficiary Registered Successfully",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green))),

                    Container(
                        margin: EdgeInsets.only(left: 90, top: 20),
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
                                child: new Text('Close'),
                                onPressed: ()=>_success(context),
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


  _success(BuildContext context) async{
    Navigator.pop(context);
    _ResetButton();
  }
  Widget _buttons(){
    return Container(

        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
                minWidth: 130,
                child:RaisedButton(
                  child: new Text('RESET'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(color: Colors.red),

                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: _ResetButton,
                )),
            ButtonTheme(
              minWidth: 130,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(color: Colors.teal),
                ),
                color: Colors.teal,
                textColor: Colors.white,
                child: new Text('Submit'),
                onPressed: ()=>_displayDialog(context),
              ),
            )
          ],
        )
    );
  }

  Widget _date(){

  }
  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Username"),
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }



  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          Type = "Account";
          break;
        case 1:

          Type = "Card";

          break;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: HtmlWidget("""<h2 style='color:red;'>Third Party Beneficiary Register</h2>"""),
                      ),
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
                                'Account',
                                style: new TextStyle(fontSize: 16.0),
                              ),

                              new Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                focusColor: Colors.red,
                                activeColor: Colors.red,
                                hoverColor: Colors.red,
                              ),
                              Text(
                                'Card',
                                style: new TextStyle(fontSize: 16.0),
                              ),
                            ]
                        ),
                      ),

                      _inputField(beneName,Colors.grey),
                      _inputField(beneAccNo,Colors.grey),
                      _inputField(bankName,Colors.grey),
                      _inputField(beneEmail,Colors.grey),


                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),


                      _buttons(),


                    ])
            )
        )
    );
  }

}
