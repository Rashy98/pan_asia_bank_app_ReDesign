import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;



class ChequeBookReq extends StatefulWidget {
  @override
  ChequeBookReq({Key key, this.title}) : super(key: key);
  final String title;
  _ChequeBookReq createState() => _ChequeBookReq();


}

// ignore: must_be_immutable
class _ChequeBookReq extends State {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final myController = TextEditingController();
  String radioItem = 'Immediate';
  String dropdownValue = 'Select Branch';
  String _selectedPayee = "Select Branch";
  String serviceProCat = "Service Provider Category";
  String serviceProName = "Service Provider Name";
  String servicePrefNo = "Payment Reference Number";
  String AmountP = "Amount(LKR)";
  String payType = "Immediate";
  int _radioValue = 0;
  int _radioValue2 = 0;
  int id = 1;
  bool _validate = false;
  bool mecVal = false;
  bool _value1 = false;
  List<DropdownMenuItem<String>> PayeeList= [];

  @override
  void initState() {
    _fetchUser();
  }


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
      _selectedPayee = "Select Branch";
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
              height: 250,
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
                            child:Text("Cheque Book Request",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center)
                        )
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 85, right: 50,top: 50),
                      child:Text("Request submitted!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
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
                onPressed:(){
                  setState(() {
                    _selectedPayee == "Select Branch"? mecVal=true :mecVal=false;
                  });
                  if(mecVal == false ) {
                    _displayDialog(context);
                  }
                },
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


  List users = List();
  var isLoading = true;

  void _fetchUser() async{
    final response =  await http.get("https://uee-pan-backend.herokuapp.com/user/");
    if (response.statusCode == 200) {
      users = json.decode(response.body) as List;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  List DDitems = [];
  populateDrop(){
    if(users.length != 0 && users.length != null) {
      print("users:" + users.length.toString());
//      for (var x = 0; x <= users.length; x++) {
      users.map((e) => {
        if(e['id'] =="5f7094ced1c8261f4f9b756f" ){
          print("userss:" +e['RegisteredPayeesBill'].length.toString()),
          for (var y = 0; y < e['RegisteredPayeesBill'].length; y++) {
            DDitems.add(e['RegisteredPayeesBill'][y]['name'])
          }
        }
      });
//        if (users[x]['_id'] == "5f7094ced1c8261f4f9b756f") {

//        }
    }
  }

  void _OnChangeDrop(String value){

    setState(() {
      _selectedPayee = value;
    });

    switch(value){
      case 'RashiniPhone': setState(() {
        serviceProCat = "Telecommunication";
        serviceProName = "Dialog";
        servicePrefNo="0776487176";
      });
      break;
      case 'HirumiPhone': setState(() {
        serviceProCat = "Telecommunication";
        serviceProName = "Mobitel";
        servicePrefNo="0712243527";
      });
      break;
      case 'Electricity Bill':setState(() {
        serviceProCat = "Electricity Bill";
        serviceProName = "CEB";
        servicePrefNo="CE99120378182";
      });
      break;
      case 'Peo Tv':
        setState(() {
          serviceProCat = "Communication";
          serviceProName = "SLT";
          servicePrefNo="SLT9918293812";
        });
        break;

    }

  }
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          payType = "10";
          break;
        case 1:
          payType = "25";
          break;
        case 2:
          payType = "50";
          break;
      }
    });
  }
  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          payType = "Branch";
          break;
        case 1:

          payType = "3rd party person";

          break;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    populateDrop();
    print(DDitems);
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
                        child: HtmlWidget("""<h2 style='color:red;'>Check Book Request</h2>"""),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Account")
                      ),
                      _SavingsAccount(),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("No of Cheque Leaves")
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
                                '10',
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
                                '25',
                                style: new TextStyle(fontSize: 16.0),
                              ),

                              new Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                                focusColor: Colors.red,
                                activeColor: Colors.red,
                                hoverColor: Colors.red,
                              ),
                              Text(
                                '50',
                                style: new TextStyle(fontSize: 16.0),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Dispatch Method")
                      ),
                      Theme(
                        data:Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.red,

                        ) ,
                        child:Row(
                            children:<Widget>[

                              new Radio(
                                value: 0,
                                groupValue: _radioValue2,
                                onChanged: _handleRadioValueChange2,
                                focusColor: Colors.red,
                                activeColor: Colors.red,
                                hoverColor: Colors.red,
                              ),
                              Text(
                                'Collect from branch',
                                style: new TextStyle(fontSize: 16.0),
                              ),

                              new Radio(
                                value: 1,
                                groupValue: _radioValue2,
                                onChanged: _handleRadioValueChange2,
                                focusColor: Colors.red,
                                activeColor: Colors.red,
                                hoverColor: Colors.red,
                              ),
                              Text(
                                '3rd party person',
                                style: new TextStyle(fontSize: 16.0),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Select branch")
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
                          hint: Text('Select Branch',style:TextStyle(color: Colors.black87)),
                          isExpanded: true,
//                style: TextStyle(color: Colors.red),
                          underline: Container(),
                          value: _selectedPayee,// this remo
//                value: _selectedPayee,
                          icon: Icon(Icons.keyboard_arrow_right),
                          iconEnabledColor: Colors.red,
                          items:
//                DDitems
                          <String>['Select Branch','Akuressa', 'Ambalangoda', 'Anuradhapura', 'Badulla','Bambalapitiya','Battaramulla','Borella','Chillaw','Colombo','Dambulla']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),

                            );
                          }).toList(),
                          onChanged: _OnChangeDrop,
                        ),
                      ),
                      mecVal? Text("Please select a branch",style: TextStyle(color: Colors.red)):Text(""),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child :  new CheckboxListTile(
                            value: _value1,
                            onChanged: _value1Changed,
                            title: new Text('I have read and agreed to the terms and conditions'),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.red,
                          ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      _buttons(),


                    ])
            )
        )
    );
  }

}
