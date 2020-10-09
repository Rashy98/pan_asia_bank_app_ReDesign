import 'package:flutter/material.dart';
import 'package:pan_asia_bank_app/screens/ATMLocator.dart';
import 'package:pan_asia_bank_app/screens/AccountHistory.dart';
import 'package:pan_asia_bank_app/screens/AdHocBillPayment.dart';
import 'package:pan_asia_bank_app/screens/CheckBookRequest.dart';
import 'package:pan_asia_bank_app/screens/ContactUs.dart';
import 'package:pan_asia_bank_app/screens/CreditCardPayments.dart';
//import 'package:pan_asia_bank_app/screens/AdHocBillPaymentForm.dart';
import 'package:pan_asia_bank_app/screens/Login.dart';
import 'package:pan_asia_bank_app/screens/ManageAccount.dart';
import 'package:pan_asia_bank_app/screens/MyProfile.dart';
import 'package:pan_asia_bank_app/screens/PaymentHistory.dart';
import 'package:pan_asia_bank_app/screens/RegisterPayee.dart';
import 'package:pan_asia_bank_app/screens/RegisteredBillPayment.dart';
import 'package:pan_asia_bank_app/screens/AccountSummary.dart';
import 'package:pan_asia_bank_app/screens/OwnAccountTransfer.dart';
import 'package:pan_asia_bank_app/screens/ThirdPartyAdHocTransfer.dart';
import 'package:pan_asia_bank_app/screens/ThirdPartyBeneficiaryRegister.dart';
import 'package:pan_asia_bank_app/screens/ThirdPartyRegisteredTransfer.dart';
import 'package:pan_asia_bank_app/screens/FundTransferTransactionHistory.dart';
import 'package:pan_asia_bank_app/screens/StandingOrderRequest.dart';



class NavDrawer extends StatefulWidget {
  @override
  NavDrawer({Key key, this.title}) : super(key: key);
  final String title;
  _NavDrawerD createState() => _NavDrawerD();


}
class _NavDrawerD extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color(0xFFB42827),
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
          child: DrawerHeader(

            child: Text(
              'MANUJAYA'+"\n" + "manujayapremathilaka@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
//            decoration: BoxDecoration(
//                color: Colors.green,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    )),
          ),

          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard' , style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AccountSummary()));
            },
          ),

          ExpansionTile(
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('My Account' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),
            ),
            children: <Widget>[
              new ListTile(
                title: const Text('Account History',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ViewAccountHistory()));
                },
              ),

              new ListTile(
                title: const Text('Balance Enquiry',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AccountSummary()));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.input),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Fund Transfer' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),
            ),
            children: <Widget>[
              new ListTile(
               title: const Text('Own Account',
                style: const TextStyle(

                 color: Color(0xFFFFFFFF)
                 ),
                 ),

                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OwnAccount()));
               },
                ),

              new ListTile(
                title: const Text('Third Party Registered',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ThirdPartyRegistered()));
                },
              ),
              new ListTile(
                title: const Text('Third Party Ad-Hoc',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ThirdPartyAdHoc()));
                },
              ),
              new ListTile(
                title: const Text('Register Beneficiary',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ThirdPartBeneficiary()));
                },
              ),
              new ListTile(
                title: const Text('Fund Transfer History',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FundTransferTransactionHistory()));
                },
              )
            ],


          ),
          ExpansionTile(
            leading: Icon(Icons.receipt),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Pay Bills' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),

            ),
            children: <Widget>[
              new ListTile(
                title: const Text('Registered Bill Payment',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RegisteredBill()));
                },
              ),

              new ListTile(
                title: const Text('Ad-hoc Bill payment',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AdHocBill()));
                },
              ),
              new ListTile(
                title: const Text('Register Payee',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RegisterPay()));
                },
              ),
              new ListTile(
                title: const Text('Payment History',
                  style: const TextStyle(

                      color: Color(0xFFFFFFFF)
                  ),
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PaymentHistory()));
                },
              ),

            ],


          ),

          ExpansionTile(
            leading: Icon(Icons.calendar_today),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Standing Orders' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),

            ),
            children: <Widget>[
              ListTile(
                title: Text('Standing Order Requests',style: const TextStyle(
                    color: Color(0xFFFFFFFF)
                ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => OrderRequest()));
                },
              ),
            ],
          ),



          ExpansionTile(
            leading: Icon(Icons.payment),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Card Services' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),

            ),
            children: <Widget>[
              ListTile(
                title: Text('Card Payment' , style: const TextStyle(
                    color: Color(0xFFFFFFFF)
                ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CardPayment()));
                },

              ),
    ],
          ),
          ExpansionTile(
            leading: Icon(Icons.library_books),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Requests' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),

            ),
            children: <Widget>[
              ListTile(
                title: Text('Cheque Book Request' , style: const TextStyle(
                    color: Color(0xFFFFFFFF)
                ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ChequeBookReq()));
                },

              ),

              ListTile(
                title: Text('Cheque Book History' , style: const TextStyle(
                    color: Color(0xFFFFFFFF)
                ),
                ),
                onTap: () {
                  Navigator.pop(context);
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => CardPayment()));
                },

              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.map),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Other Services' , style: const TextStyle(

                color: Color(0xFFFFFFFF)
            ),

            ),
            children: <Widget>[
              ListTile(
                title: Text('View Interest rate' , style: const TextStyle(
                    color: Color(0xFFFFFFFF)
                ),
                ),
                onTap: () {
                  Navigator.pop(context);

                },

              ),

              ListTile(
                title: Text('View Forex Rate' , style: const TextStyle(
                    color: Color(0xFFFFFFFF)
                ),
                ),
                onTap: () {
                  Navigator.pop(context);
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => CardPayment()));
                },

              ),
            ],
          ),
       ListTile(
            leading: Icon(Icons.settings),
            title: Text('Preferences',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => { Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ManageAccount()))},
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('ATM and Branch Locator',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ATMLocator())
              )},

          ),

          ListTile(
            leading: Icon(Icons.local_phone),
            title: Text('Contact Us' , style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ContactUs()));
            },

          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout',style: const TextStyle(
                color: Color(0xFFFFFFFF)
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login())
              )
            },
          ),
        ],
      )
      ),
    );
  }
}