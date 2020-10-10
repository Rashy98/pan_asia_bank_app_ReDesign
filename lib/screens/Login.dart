import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/screens/AccountSummary.dart';

class Login extends StatelessWidget{

  Widget _inputField(String title, Color border) {
    return TextField(
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: border),
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

  Widget _buttons(name, BuildContext context){
    return Center(
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
                minWidth: 200,
                child:RaisedButton(
                  child: new Text(name),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.white)
                  ),
                  color: Colors.white,
                  textColor: Colors.red,
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSummary()));},
                )
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
//            title: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//
//              children: <Widget>[
//                Image.asset("assets/logo.png", fit: BoxFit.cover,),
//              ]
//            )
            title: Container(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width),
              child: Image.asset("assets/logo.png", fit: BoxFit.cover, ),
            ),

//            Image.asset("assets/logo.png", fit: BoxFit.cover, ),
            centerTitle: true,
          ),
        ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 30, right: 25),
                          child:_inputField('UserName', Colors.white),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                          child: _inputField('Password', Colors.white),
                        ),
                        Container(
                          margin: const EdgeInsets.only( top: 15),
                          child: Text('Forgot Password?', style: TextStyle(color: Colors.white),),
                        ),
                        Container(
                          margin: const EdgeInsets.only( top: 5),
                          child: _buttons('Login', context),
                        ),
                      ],
                    )
                )
            ),
            Container(
            margin: const EdgeInsets.only(top: 80),
//            child: Table(
//              border: TableBorder(top: BorderSide(color: Colors.white, width: 4),
//                                  verticalInside: BorderSide(color: Colors.white, width: 4),
//                                  horizontalInside: BorderSide(color: Colors.white, width: 4)
//              ),
//              children: [
//                TableRow(
//                  children: [
//                    Icon(Icons.account_circle),
//                    Icon(Icons.access_alarm)
//                  ]
//                ),
//                TableRow(
//                  children: [
////                    Container(
////                      margin: EdgeInsets.all(10),
////                      child: Text('Hello'),
////                    ),
//                    Icon(Icons.account_circle),
//                    Icon(Icons.access_alarm)
//                  ]
//                )
//              ],
                child: Image.asset("assets/HomeFunc.png",
                    width: 350,
                    height: 340,
                    fit:BoxFit.fill   ),
//            ),
            )
          ],
        ),
      )

      )
    );
  }

}