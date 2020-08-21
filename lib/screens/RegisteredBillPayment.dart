import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class RegisteredBillPayment extends StatelessWidget {

  String dropdownValue = 'Select Payee';


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

  Widget _dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_right,color: Colors.red,),
      iconSize: 20,
      elevation: 16,
//      underline: Container(
//        height: 2,
//        color: Colors.deepPurpleAccent,
//      ),
//      onChanged: (String newValue) {
//        setState(() {
//          dropdownValue = newValue;
//        });
//      },
      items: <String>['RashiniPhone', 'NuwanaPhone', 'ManujayaPhone', 'HirumiPhone']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
              side: BorderSide(color: Colors.red)
          ),
          color: Colors.red,
          textColor: Colors.white,
          child: new Text('PAY'),
          onPressed: (){},
        ),
    )
      ],
    )
    );
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
                Align(
                  alignment: Alignment.bottomLeft,
                child: HtmlWidget("""<h2 style='color:red;'>Registered Bill Payment</h2>"""),
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
              Align(
                  alignment: Alignment.bottomLeft,
                  child : Text("Bill Payment Name")
              ),
              _inputField("Service Provider category",Colors.grey),
              _inputField("Service Provider name",Colors.grey),
              _inputField("Payment Reference number",Colors.grey),
              _inputField("Amount (LKR)",Colors.red),
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
