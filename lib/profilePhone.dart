import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'checkPhoneCode.dart';
import 'main.dart';

String Uphone='';

class profilePhonePage extends StatefulWidget {
  @override
  _profilePhonePageState createState() => _profilePhonePageState();
}

class _profilePhonePageState extends State<profilePhonePage> {
  TextEditingController _controllerName, _controllerPhone, _controllerAddress, _controllerPartnerCode ;
  var maskFormatterPhone = new MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });

  @override
  void initState() {
    _controllerPhone = TextEditingController(text: Uphone);
    super.initState();
  }//initState

  @override
  Widget build(BuildContext context) {

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
                    CupertinoPageRoute(builder: (context) => momzyHomePage()));
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

          body:SingleChildScrollView(
              physics: ScrollPhysics(),
              child:GestureDetector(
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
                              child: Text('Введите номер\nмобильного телефона', style: TextStyle(fontSize: 24.0, color: Color(bodyTextMajor), fontFamily: 'Roboto',fontWeight: FontWeight.bold, height: 1.5),textAlign: TextAlign.left,)
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(20,10,0,10),
                                child: Text('Мы вышлем код для подтверждения номера', style: TextStyle(fontSize: 15.0, color: Color(bodyTextInstruction), fontFamily: 'Roboto', height: 1.5),textAlign: TextAlign.left,)
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(20,20,20,0),
                                padding: EdgeInsets.fromLTRB(0,0,0,0),
                                width: MediaQuery.of(context).size.width - 40,
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
                                  inputFormatters: [maskFormatterPhone],
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true,
                                      signed: false),
                                  style: TextStyle(fontSize: 19.0, color: Color(textFieldText),fontFamily: 'Roboto', fontWeight: FontWeight.w600),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 19.0, color: Color(textFieldHint),fontFamily: 'Roboto', fontWeight: FontWeight.w600),
                                    hintText: "+7",
                                    fillColor: Color(textFieldBackGround),
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () => _controllerPhone.clear(),
                                      icon: Icon(Icons.clear, color: Color(textFieldHint)),
                                    ),
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
                                        //width: 1.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Поле не должно быть пустым';
                                  }
                                  return null;
                                },
                                  onChanged: (value){ Uphone = value;
                                  if(value.length == 18) {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                  }
                                  },
                                  // ignore: deprecated_member_use
                                  autovalidate: false,
                                  controller: _controllerPhone,
                                )),
                          ]),
                          ]),
                    ),
              ),

          ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:Container(
          height: 55,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(20,0,20,10),
          child: FlatButton(
            onPressed:(){
              Uphone.length > 10 ?
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => checkPhoneCodePage())) : null;
            } ,
            minWidth: MediaQuery.of(context).size.width - 40,
            height: 55,
            child: Text('Готово', style: TextStyle(fontSize: 14.0, color: Color(buttonTextWhite), fontFamily: 'Roboto',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            color: Color(buttonBackGround),
            textColor: Color(buttonTextWhite),
            splashColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
