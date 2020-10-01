import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/widgets/NavDrawer.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class OrderRequest extends StatefulWidget {
  @override
  OrderRequest({Key key, this.title}) : super(key: key);
  final String title;
  StandingOrderRequest createState() => StandingOrderRequest();

}
class StandingOrderRequest extends State {
//  static final DateTime now = DateTime.now();
  //static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //final String formatted = formatter.format(now);
  DateTime _StartDate;
  DateTime _EndDate;
  String dropdownValue = 'Select Fund Transfer Type';
  String _selectedFundTransferType = 'Select Fund Transfer Type';
  String _selectedBankName = 'Select Bank Name';
  final myController = TextEditingController();
  String dropdownValueTransfer = 'Select Transfer Type';
  String dropdownValueFrequency = 'Select Frequency';
  String SelectedOwnAccount = "Service Provider Category";
  String SelectedPanAisaBankAccount = "Service Provider Name";
  String servicePrefNo = "Payment Reference Number";
  bool _isChecked = false;
  bool _isCheckedValue = false;
  List<DropdownMenuItem<String>> PayeeListTransfer= [];
  List<DropdownMenuItem<String>> PayeeListFrequency= [];

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
                child: new Text('SUBMIT'),
                onPressed: (){},
              ),
            )
          ],
        )
    );
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
                        child: HtmlWidget("""<h2 style='color:red;'>Standing Order Request</h2>"""),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child : Text("Source Account")
                      ),
                      Container(height: 20),
                      _SavingsAccount(),
                      SizedBox(
                        height: 5,
                      ),
                      _inputField("Standing Order Name",Colors.grey),

                      Container(height: 20),

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
                              hint: Text('Select Fund Transfer Type',style:TextStyle(color: Colors.black87)),
                              isExpanded: true,
                              underline: Container(),
                              value: _selectedFundTransferType,
                              icon: Icon(Icons.keyboard_arrow_right),
                              iconEnabledColor: Colors.red,
                              items: <String>['Select Fund Transfer Type','Own Account', 'Pan Asia Bank Account ', 'Slips']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),

                                );
                              }).toList(),
                              onChanged: _OnChangeDrop,
                            ),
                          ),
                      Container(height: 20),

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
                              Container(width: 20,),
                              Align(

                                  child : Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: _isCheckedValue,
                                        activeColor: Colors.red,
                                        onChanged: (bool value){
                                          print(value);
                                          setState(() {
                                            _isCheckedValue = value;
                                          });
                                        },
                                      ),
                                      Text("Until Further Notice." ,
                                          style: const TextStyle(color: Colors.black))
                                    ],
                                  )
                              ),
                            ]
                        )
                      ),

                      Container(height: 20),

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
                      Container(height: 20),

                      Align(

                          child : Row(
                            children: <Widget>[
                              Checkbox(
                                value: _isChecked,
                                activeColor: Colors.red,
                                onChanged: (bool value){
                                  print(value);
                                  setState(() {
                                    _isChecked = value;
                                  });
                                },
                              ),
                              Text("I have read and agreed to the terms \n and conditions." ,
                                  style: const TextStyle(color: Colors.black))
                            ],
                          )
                      ),

                      Container(height: 20),

                      _inputField("Order Remark",Colors.grey),

                      Container(height: 20),

                      Align(

                          child : Text("Note : If you wish to cancel or edit a standing order, please submit a written request to the bank." ,
                              style: const TextStyle(color: Colors.red))
                      ),
                      Container(height: 20),
                      
                      _buttons(),

                      SizedBox(
                        height: 20,
                      ),
                    ])
            )
        )
    );
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
  void _OnChangeDrop(String value){

    setState(() {
      _selectedFundTransferType = value;
    });

    switch(value){
      case 'Own Account': setState(() {

      });
      break;
      case 'Pan Asia Bank Account': setState(() {
        _inputField("Destination Account",Colors.grey);
      });
      break;
      case 'Slips':setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Bank Name','Alliance Finance Company PLC', 'Central Bank', 'Kanrich Finance Limited',
            'Mercantile Investment And Finance PLC', 'Mercantile Bank Of Sri Lanka & Finance PLC', 'Siyapatha Finance PLC',
            'State Mortgage & Investment Bank', 'Vallibel Finance PLC']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),

            );
          }).toList(),
          onChanged: _OnChangeBankDrop,
        );
      });
      break;
    }
  }
  void _OnChangeBankDrop(String value){
    setState(() {
      _selectedBankName = value;
    });

    switch(value){
      case 'Alliance Finance Company PLC': setState(() {

        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Aluthgama - 036', 'Ambalanthota - 022', 'Ampara - 034',
            'Anuradhapura - 025', 'Batticola - 007', 'Dambulla - 029', 'Galle - 004', 'Ja-Ela - 008']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()
        );

      });
      break;
      case 'Central Bank': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Central Bank Of Sri Lanka - 999', 'Colombo - 001', 'Senior Citizen - 998']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()
        );
      });
      break;
      case 'Kanrich Finance Limited': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Head Office - 001']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()
        );
      });
      break;
      case 'Mercantile Investment And Finance PLC': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Head Office - 001']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()
        );
      });
      break;
      case 'Mercantile Bank Of Sri Lanka & Finance PLC': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Ambalangoda - 114', 'Ampara - 115', 'Bandarawela - 118', 'Chilaw - 120', 'City Office - 121',
            'galle - 107','Hatton - 128', 'Ja-Ela - 129', 'Jaffna - 130']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()
        );
      });
      break;
      case 'Siyapatha Finance PLC': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Ambalangoda - 114', 'Ampara - 115', 'Bandarawela - 118', 'Chilaw - 120', 'City Office - 121',
            'galle - 107','Hatton - 128', 'Ja-Ela - 129', 'Jaffna - 130']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value)
            );
          }).toList(),
        );
      });
      break;
      case 'State Mortgage & Investment Bank': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Ambalangoda - 114', 'Ampara - 115', 'Bandarawela - 118', 'Chilaw - 120', 'City Office - 121',
            'galle - 107','Hatton - 128', 'Ja-Ela - 129', 'Jaffna - 130']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value)
            );
          }).toList(),
        );
      });
      break;
      case 'Vallibel Finance PLC': setState(() {
        DropdownButton<String>(
          hint: Text('Beneficiary Bank Name',style:TextStyle(color: Colors.black87)),
          isExpanded: true,
          underline: Container(),
          value: _selectedBankName,
          icon: Icon(Icons.keyboard_arrow_right),
          iconEnabledColor: Colors.red,
          items: <String>['Select Branch Name','Ambalangoda - 114', 'Ampara - 115', 'Bandarawela - 118', 'Chilaw - 120', 'City Office - 121',
            'galle - 107','Hatton - 128', 'Ja-Ela - 129', 'Jaffna - 130']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value)
            );
          }).toList(),
        );
      });
      break;
    }
  }
}