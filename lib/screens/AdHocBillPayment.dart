import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class AdHocBill extends StatefulWidget {
  @override
  AdHocBill({Key key, this.title}) : super(key: key);
  final String title;
  AdHocBillPayment createState() => AdHocBillPayment();


}

// ignore: must_be_immutable
class AdHocBillPayment extends State {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final myController = TextEditingController();
  final payeeNameController = TextEditingController();
  final servicePrefNoController = TextEditingController();
  var catItems = ['Select Merchant','Dialog Broadband', 'SLT Broadband'];
  String radioItem = 'Immediate';
  String dropdownValue = 'Select Payee';
  String _selectedPayee = "Select Payee";
  String serviceProCat = "Service Provider Category";
  String _selectedCat = "Select category";
  String _selectedMerch = "Select Merchant";
  String serviceProName = "Service Provider Name";
  String servicePrefNo = "Payment Reference Number";
  String AmountP = "Amount(LKR)";
  String payType = "Immediate";
  int _radioValue = 0;
  int id = 1;
  bool _value1 = false;
  List<DropdownMenuItem<String>> PayeeList= [];


  void _value1Changed(bool value) => setState(() => _value1 = value);

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
      value: _selectedPayee,
      onChanged: (value) {
        setState(() {
          _selectedPayee = value;
        });
      },
      isExpanded: true,
    ));

    return formWidget;
  }
  void _ResetButton(){
    setState(() {
      _selectedPayee = "Select Payee";
      serviceProCat = "Service Provider Category";
      serviceProName = "Service Provider Name";
      servicePrefNo="Payment Reference Number";
      _selectedCat = "Select category";
      _selectedMerch = "Select Merchant";
      myController.text="";
      payeeNameController.text="";
      servicePrefNoController.text="";
      _value1 = false;
    });
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
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 480,
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
                            child:Text("Bill Payment",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center)
                        )
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 16),
                              hintText: 'Account Number'),
                        )),

                    Container(
                      margin: EdgeInsets.only(left: 25, right: 50),
                      child:Text("201023910239402",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Provider category & Merchant'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:Text(_selectedCat+"-"+_selectedMerch,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),

                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Payment Reference Number'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:
                        Text(servicePrefNoController.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                        Text("Rs. "+myController.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                        Text(formatted,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ButtonTheme(
                                minWidth: 130,
                                child:RaisedButton(
                                  child: new Text('CANCEL'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    side: BorderSide(color: Colors.red),

                                  ),
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  onPressed: ()=>Navigator.pop(context),
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
                                child: new Text('PROCEED'),
                                onPressed: ()=>_displayDialogBoxSec(context),
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
              height: 650,
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
                            child:Text("Bill Payment",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,)
                        )
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 16),
                              hintText: 'Account Number'),
                        )),

                    Container(
                      margin: EdgeInsets.only(left: 25, right: 50),
                      child:Text("201023910239402",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Provider category & Merchant'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:Text(_selectedCat+"-"+_selectedMerch,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Transaction Reference Number'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:
                        Text("RB1001200301032",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                        Text("Rs. "+myController.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                        Text(formatted,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                        Text("SUCCESS",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green))),
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
                        Text("Transaction successfully completed",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),

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

  _AddPayee(BuildContext context) async {
    Navigator.pop(context);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height:230,
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
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child:Text('Enter name to register payee',style: TextStyle(color: Colors.black87,fontSize: 17),textAlign: TextAlign.center),
                        )
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:TextField(
                        controller:payeeNameController,
                        decoration: InputDecoration(
                          hintText: "Payee Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 90,top: 10),
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
                                onPressed: ()=>_Asuccess(context),
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

  _AddedPayee(BuildContext context) async {
    Navigator.pop(context);
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
                                onPressed: ()=>_fSuccess(context),
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

  _fSuccess(BuildContext context) async{
    Navigator.pop(context);
    PayBill();
    _ResetButton();
  }
  _Asuccess(BuildContext context) async{
    _AddedPayee(context);
  }
  _success(BuildContext context) async{
    if(_value1 == true){
      _AddPayee(context);
    }
    else{
      Navigator.pop(context);
      PayBill();
      _ResetButton();
    }

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
                child: new Text('PAY'),
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
          payType = "Immediate";
          break;
        case 1:

          payType = "Future";

          break;
      }
    });
  }


  Future<http.Response> PayBill() async {
    String url =
        'https://uee-pan-backend.herokuapp.com/user/pushBillPaymentHistory/';
    Map map = {
      '_id':'5f7094ced1c8261f4f9b756f',
      'BillPaymentHistory':[{"category":_selectedCat,"merchant":_selectedMerch,"refNo":servicePrefNoController.text,"Amount":myController.text,"type":"Ad-hoc"}]
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
                        child: HtmlWidget("""<h2 style='color:red;'>Ad-hoc Bill Payment</h2>"""),
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
                      SizedBox(
                        height: 10,
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
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller:servicePrefNoController,
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
                        ),
                      ),
                      TextField(
                        controller:myController,
                        decoration: InputDecoration(
                          hintText: "Amount (LKR)",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      new CheckboxListTile(
                        value: _value1,
                        onChanged: _value1Changed,
                        title: new Text('Save as a utility payee'),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.red,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Payment Type")
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
                                'Immediate',
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
                                'Future',
                                style: new TextStyle(fontSize: 16.0),
                              ),
                            ]
                        ),
                      ),
                      _buttons(),


                    ])
            )
        )
    );
  }

}
