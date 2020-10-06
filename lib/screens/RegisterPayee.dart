import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class RegisterPay extends StatefulWidget {
  @override
  RegisterPay({Key key, this.title}) : super(key: key);
  final String title;
  RegistePayee createState() => RegistePayee();


}

// ignore: must_be_immutable
class RegistePayee extends State {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final myController = TextEditingController();
  final payeeNameController = TextEditingController();
  String radioItem = 'Immediate';
  var catItems = ['Select Merchant','Dialog Broadband', 'SLT Broadband'];
  String dropdownValue = 'Select category';
  String _selectedCat = "Select category";
  String _selectedMerch = "Select Merchant";
  String payeeName = "Payee name";
  String serviceProName = "Service Provider Name";
  String servicePrefNo = "Payment Reference Number";
  String AmountP = "Amount(LKR)";
  String payType = "Immediate";
  int _radioValue = 0;
  int id = 1;
  bool _PRvalidate = false;
  bool _PNvalidate = false;
  bool catVal = false;
  bool mecVal = false;
  List<DropdownMenuItem<String>> PayeeList= [];



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

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();
    formWidget.add(new DropdownButton(
      hint: new Text('Select Gender'),
      items: PayeeList,
      value: _selectedCat,
      onChanged: (value) {
        setState(() {
          _selectedCat = value;
        });
      },
      isExpanded: true,
    ));

    return formWidget;
  }
  void _ResetButton(){
    setState(() {
      _selectedCat = "Select category";
//      serviceProCat = "Service Provider Category";
      serviceProName = "Service Provider Name";
      servicePrefNo = "Payment Reference Number";
      myController.text="";
      payeeName = "Payee name";
      _selectedMerch = "Select Merchant";
      payeeNameController.text="";
    });
  }


  _displayDialogBoxSec(BuildContext context) async {

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height:200,
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
                            child:Text('Register Payee',style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,)
                        )
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 40,top: 30),
                        child:
                        Text(payeeNameController.text+ " added as a payee!",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),

                    Container(
                        margin: EdgeInsets.only(left: 90,top: 20),
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
    AddPayee();
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
                child: new Text('ADD'),
                onPressed: () {
                  setState(() {
                    _selectedCat == "Select category"? catVal=true :catVal=false;
                    _selectedMerch == "Select Merchant"? mecVal=true :mecVal=false;
                    myController.text.isEmpty ? _PRvalidate = true : _PRvalidate = false;
                    payeeNameController.text.isEmpty ? _PNvalidate = true : _PNvalidate = false;
                  });
                  if (_PRvalidate == false && _PNvalidate == false && _selectedCat != "Select category" && _selectedMerch != "Select Merchant") {
                    _displayDialogBoxSec(context);
                  }
                },
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



  Widget dropDown(){

  }

  void _OnChangeDrop(String value){

    setState(() {
      _selectedCat = value;
    });

    switch(value){
      case 'Broadband': setState(() {
        catItems = ['Select Merchant','Dialog Broadband', 'SLT Broadband'];
      });
      break;
      case 'Communication': setState(() {
        catItems = ['Select Merchant','Airtel', 'Dialog CDMA', 'Dialog Mobile', 'Hutch','Mobitel','SLT'];
      });
      break;

    }

  }
  void _OnChangeDropMerch(String value){

    setState(() {
      _selectedMerch = value;
    });

  }


  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          payType = "Immediate";
          break;
        case 1:

          payType = "Future";

          break;
      }
    });
  }


  Future<http.Response> AddPayee() async {
    String url =
        'https://uee-pan-backend.herokuapp.com/user/pushRegisteredPayeesBill/';
    Map map = {
      '_id':'5f7094ced1c8261f4f9b756f',
      'RegisteredPayeesBill':[{"name":payeeNameController.text,"category":_selectedCat,"merchant":_selectedMerch,"refNo":myController.text}]
    };
    print(await apiRequest(url, map));
  }


    Future<String> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
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
                        child: HtmlWidget("""<h2 style='color:red;'>Register Payee</h2>"""),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Payee Name")
                      ),
                      TextField(
                        controller:payeeNameController,
                        decoration: InputDecoration(
                          hintText: payeeName,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorText: _PNvalidate ? 'Value Can\'t Be Empty' : null,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Service provider Category")
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        width:380,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color:  CupertinoColors.quaternarySystemFill)
                            ]
                        ),
                        child: DropdownButton<String>(
                          hint: Text('Select Merchant',style:TextStyle(color: Colors.black87)),
                          isExpanded: true,
//                style: TextStyle(color: Colors.red),
                          underline: Container(),
                          value: _selectedCat,// this remo
//                value: _selectedPayee,
                          icon: Icon(Icons.keyboard_arrow_right),
                          iconEnabledColor: Colors.red,
                          items: <String>['Select category','Broadband', 'Communication', 'Electricity', 'Financial Entities', 'Television','Top ups', 'Water supply']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),

                            );
                          }).toList(),
                          onChanged: _OnChangeDrop,
                        ),
                      ),
                     catVal? Text("Please select a category",style: TextStyle(color: Colors.red)):Text(""),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Service Merchant")
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        width:380,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color:  CupertinoColors.quaternarySystemFill)
                            ]
                        ),
                        child: DropdownButton<String>(
                          hint: Text('Select Merchant',style:TextStyle(color: Colors.black87)),
                          isExpanded: true,
//                style: TextStyle(color: Colors.red),
                          underline: Container(),
                          value: _selectedMerch,// this remo
//                value: _selectedPayee,
                          icon: Icon(Icons.keyboard_arrow_right),
                          iconEnabledColor: Colors.red,
                          items: catItems
//                          ['Select Merchant','Broadband', 'Communication', 'Electricity', 'Financial Entities', 'Television','Top ups', 'Water supply']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),

                            );
                          }).toList(),
                          onChanged: _OnChangeDropMerch,
                        ),
                      ),
                      mecVal? Text("Please select a merchant",style: TextStyle(color: Colors.red)):Text(""),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller:myController,
                        decoration: InputDecoration(
                          hintText: "Payment Reference Number",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          errorText: _PRvalidate ? 'Value Can\'t Be Empty' : null,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      _buttons(),


                    ])
            )
        )
    );
  }

}
