import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:momzy/profilePhone.dart';

import 'addBaby.dart';
import 'main.dart';

String Ucode, codeA, codeB, codeC, codeD, codeE, codeF;

class checkPhoneCodePage extends StatefulWidget {
  @override
  _checkPhoneCodePageState createState() => _checkPhoneCodePageState();
}

class _checkPhoneCodePageState extends State<checkPhoneCodePage> {
  TextEditingController  _controllerCode;
  //var maskFormatterPhone = new MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });

  @override
  void initState() {
   // _controllerCode = TextEditingController(text: Ucode);
    super.initState();
  }//initState

  void dispose() {
    // Clean up the focus node when the Form is disposed
    //widget.node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
        backgroundColor: Color(backGround),
        appBar:AppBar(
          elevation: 0.0,
          title:Text("", style: TextStyle(fontSize: 18.0, color: Color(backGround), fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Color(backGround),
          brightness: Brightness.light,
          leading: Container(
            child: Material(
              color: Color(backGround), // button color
              child: InkWell(
                splashColor: Color(buttonBackGround), // splash color
                onTap: () {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => profilePhonePage()));
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_back_ios, size: 20.0, color: Color(buttonBackGround)), // icon
                    Text("", style: TextStyle(color: Color(backGround),fontSize: 9.0)), // text
                  ],
                ),
              ),
            ),
          ),
        ),

        body:GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },

          child: Container(
            height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.transparent,),
            child: Stack(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text('Введите код\nпришедший по смс', style: TextStyle(fontSize: 24.0, color: Color(bodyTextMajor), fontFamily: 'Roboto',fontWeight: FontWeight.w700, height: 1.5),textAlign: TextAlign.left,)
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(20,10,0,10),
                            child: Text('Мы выслали код на номер $Uphone', style: TextStyle(fontSize: 15.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(0,10,0,10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(10,1,0,1),
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    width: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6 ,
                                    height: (MediaQuery.of(context).size.width  - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6*1.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:TextFormField(
                                      textAlign: TextAlign.center,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2*1.23, color: Color(textFieldText)),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6  / 2 / 2 * 1.23, 0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2 / 2*1.23),
                                        fillColor: Color(textFieldBackGround),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                        onChanged: (_) => node.nextFocus(),
                                      validator: (value) {
                                        if (value.length > 0){
                                          codeA = value;
                                          //node.nextFocus();
                                        }
                                        return null;
                                      },
                                      // ignore: deprecated_member_use
                                      autovalidate: true,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10,1,0,1),
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    width: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6 ,
                                    height: (MediaQuery.of(context).size.width  - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6*1.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:TextFormField(
                                      textAlign: TextAlign.center,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2*1.23, color: Color(textFieldText)),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6  / 2 / 2 * 1.23, 0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2 / 2*1.23),
                                        fillColor: Color(textFieldBackGround),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onChanged:  (_) => node.nextFocus(),
                                      validator: (value) {
                                        if (value.length > 0){
                                          codeB = value;
                                          //node.nextFocus();
                                        }
                                        return null;
                                      },
                                      // ignore: deprecated_member_use
                                      autovalidate: true,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10,1,0,1),
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    width: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6 ,
                                    height: (MediaQuery.of(context).size.width  - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6*1.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:TextFormField(
                                      textAlign: TextAlign.center,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2*1.23, color: Color(textFieldText)),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6  / 2 / 2 * 1.23, 0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2 / 2*1.23),
                                        fillColor: Color(textFieldBackGround),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onChanged: (_) => node.nextFocus(),
                                      validator: (value) {
                                        if (value.length > 0){
                                          codeC = value;
                                          //node.nextFocus();
                                        }
                                        return null;
                                      },
                                      // ignore: deprecated_member_use
                                      autovalidate: true,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10,1,0,1),
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    width: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6 ,
                                    height: (MediaQuery.of(context).size.width  - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6*1.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:TextFormField(
                                      textAlign: TextAlign.center,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2*1.23, color: Color(textFieldText)),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6  / 2 / 2 * 1.23, 0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2 / 2*1.23),
                                        fillColor: Color(textFieldBackGround),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onChanged: (_) => node.nextFocus(),
                                      validator: (value) {
                                        if (value.length > 0){
                                          codeD = value;
                                          //node.nextFocus();
                                        }
                                        return null;
                                      },
                                      // ignore: deprecated_member_use
                                      autovalidate: true,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10,1,0,1),
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    width: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6 ,
                                    height: (MediaQuery.of(context).size.width  - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6*1.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:TextFormField(
                                      textAlign: TextAlign.center,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2*1.23, color: Color(textFieldText)),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6  / 2 / 2 * 1.23, 0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2 / 2*1.23),
                                        fillColor: Color(textFieldBackGround),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onChanged: (_) => node.nextFocus(),
                                      validator: (value) {
                                        if (value.length > 0){
                                          codeE = value;
                                          //node.nextFocus();
                                        }
                                        return null;
                                      },
                                      // ignore: deprecated_member_use
                                      autovalidate: true,
                                    )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10,1,0,1),
                                    padding: EdgeInsets.fromLTRB(0,0,0,0),
                                    width: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6 ,
                                    height: (MediaQuery.of(context).size.width  - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6*1.23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(textFieldBorder).withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          offset: Offset(0, 0.5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child:TextFormField(
                                      textAlign: TextAlign.center,
                                      enabled: true,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2*1.23, color: Color(textFieldText)),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10)/ 6  / 2 / 2 * 1.23, 0, (MediaQuery.of(context).size.width - 20 - 20 - 10 - 10 - 10- 10 - 10) / 6 / 2 / 2*1.23),
                                        fillColor: Color(textFieldBackGround),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.done,
                                      //textInputAction: TextInputAction.done,
                                      onChanged: (_) {
                                        node.unfocus();
                                        node.dispose();
                                        //перейти на другую страницу
                                        SchedulerBinding.instance.addPostFrameCallback((_) {
                                          Navigator.push(context,
                                              CupertinoPageRoute(builder: (context) => addBabyPage()));
                                        });
                                        } ,
                                      validator: (value) {
                                        if (value.length > 0){
                                          codeF = value;
                                          //node.dispose();

                                          print('$codeA$codeB$codeC$codeD$codeE$codeF'); //проверочный код
                                          //написать получившийся код

                                          //addBabyPage();
                                        }
                                        return null;
                                      },
                                      // ignore: deprecated_member_use
                                      autovalidate: true,
                                    )),
                              ]
                            )
                          ),

                      ]),

                ]),
          ),
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:Container(
          height: 55,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(20,0,20,10),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(text: 'Не пришел код? ',
                style: TextStyle(fontSize: 15.0, color: Color(textFieldText), fontFamily: 'Roboto', ),
                children: <TextSpan>[
                  TextSpan(text: 'Переслать', style: TextStyle(fontSize: 15.0, color: Color(buttonBackGround), fontFamily: 'Roboto',decoration: TextDecoration.underline, decorationColor: Color(buttonBackGround), decorationThickness: 1,)),
                ]
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
