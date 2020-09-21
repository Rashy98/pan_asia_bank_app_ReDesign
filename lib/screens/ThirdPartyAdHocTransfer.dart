import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';



class ThirdPartyAdHoc extends StatefulWidget {
  @override
  ThirdPartyAdHoc({Key key, this.title}) : super(key: key);
  final String title;
  ThirdPartyAdHocTransfer createState() => ThirdPartyAdHocTransfer();


}

// ignore: must_be_immutable
class ThirdPartyAdHocTransfer extends State {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  String radioItem = 'Immediate';
  String radioItem1 = 'Account';
  String dropdownValue = 'Fund Transfer Type';
  String _selectedType = "Fund Transfer Type";
  String beneName = "Beneficiary Name";
  String accountNo = "Beneficiary Account/Card Number";
  String beneEmail = "Beneficiary Email";
  String transferRemark = "Fund Transfer Remark";
  String AmountP = "Amount(LKR)";
  String payType = "Immediate";
  String accType = "Account";
  int _radioValue = 0;
  int _radioValue1 = 0;
  int id = 1;
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
  Widget _radioButtons1(String text) {
    return RadioListTile(
      groupValue: radioItem1,
      title: Text(text),
      value:text,
      onChanged: (val) {
        setState(() {
          radioItem1 = val;
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
      value: _selectedType,
      onChanged: (value) {
        setState(() {
          _selectedType = value;
        });
      },
      isExpanded: true,
    ));

    return formWidget;
  }
  void _ResetButton(){
    setState(() {
      _selectedType = "Fund Transfer Type";
      myController.text="";
      myController1.text="";
      myController2.text="";
      myController3.text="";
      myController4.text="";
      myController5.text="";


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
                            child:Text("Third Party AdHoc",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center)
                        )
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 20, right: 50),
                        child:TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 16),
                              hintText: 'Beneficiary Account Number'),
                        )),

                    Container(
                      margin: EdgeInsets.only(left: 25, right: 50),
                      child:Text(myController2.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Beneficiary Bank'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:
                        Text(myController5.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),

                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Beneficiary Name'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:Text(myController1.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),

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
                        Text("LKR."+myController.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                            child:Text("Summary",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,)
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
                      child:Text(myController2.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Beneficiary Bank'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:Text(myController5.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                        Text("LKR."+ myController.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 50),
                      child:
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Fund Transfer Remark'),
                      ),),
                    Container(
                        margin: EdgeInsets.only(left: 25, right: 50),
                        child:
                        Text(myController4.text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))),
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
                child: new Text('PAY'),
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



  Widget dropDown(){

  }

  void _OnChangeDrop(String value){

    setState(() {
      _selectedType = value;
    });

    switch(value){
      case 'A': setState(() {
        _selectedType = "A";

      });
      break;
      case 'B': setState(() {
        _selectedType = "B";

      });
      break;

      case 'C':
        setState(() {
          _selectedType = "c";

        });
        break;

    }

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
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          accType = "Account";
          break;
        case 1:

          accType = "Card";

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
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: HtmlWidget("""<h2 style='color:red;'>Third Part AdHoc</h2>"""),
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
                      Theme(
                        data:Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.red,

                        ) ,
                        child:Row(
                            children:<Widget>[

                              new Radio(
                                value: 0,
                                groupValue: _radioValue1,
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
                                groupValue: _radioValue1,
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
                          hint: Text('Fund Transfer Type',style:TextStyle(color: Colors.black87)),
                          isExpanded: true,
//                style: TextStyle(color: Colors.red),
                          underline: Container(),
                          value: _selectedType,// this remo
//                value: _selectedPayee,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconEnabledColor: Colors.red,
                          items: <String>['Fund Transfer Type','A', 'B', 'C']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),

                            );
                          }).toList(),
                          onChanged: _OnChangeDrop,
                        ),
                      ),
                      TextField(
                        controller:myController1,
                        decoration: InputDecoration(
                          hintText: "Beneficiary Name",
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
                      TextField(
                        controller:myController5,
                        decoration: InputDecoration(
                          hintText: "Beneficiary Bank Name",
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
                      TextField(
                        controller:myController2,
                        decoration: InputDecoration(
                          hintText: "Beneficiary Account/Card Number",
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
                      TextField(
                        controller:myController3,
                        decoration: InputDecoration(
                          hintText: "Beneficiary Email",
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
                      TextField(
                        controller:myController4,
                        decoration: InputDecoration(
                          hintText: "Fund Transfer Remark",
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
