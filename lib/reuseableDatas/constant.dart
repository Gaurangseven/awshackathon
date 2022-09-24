import 'package:flutter/material.dart';

const Color inactiveCard = Color(0xff082032);
const Color activeCard = Color(0xff39A2DB);
const Color cardColor = Color(0xff27496D);
const Color kbgcolorscaffold =Color(0xff1b1b2f);


const kmaintitle = TextStyle(
  fontFamily: 'Banger',
  fontSize: 30.0,
  wordSpacing: 1,
  color: Color(0xffDFDFDE),
  letterSpacing: 3.0,
  fontWeight: FontWeight.bold,
);
const ktitle = TextStyle(
  fontFamily: 'B612',
  color: Colors.white,
  fontSize: 18.0,
  letterSpacing: 3.0,
  fontWeight: FontWeight.bold,

);
const kcatetitle=TextStyle(
  fontFamily: 'B612',
  color: Color(0xffFFD24C),
  fontSize: 25.0,
  fontWeight: FontWeight.bold
);
const ktext = TextStyle(
  fontFamily: 'Banger',
  color: Colors.white,
  fontSize: 30.0,
  letterSpacing: 2.0,
  fontWeight: FontWeight.normal,
);

const koption = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  letterSpacing: 1.0,
  fontWeight: FontWeight.w900,

);

const ktestnormal= TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  fontFamily: 'Questionfont',
);

const kfancy = TextStyle(
  fontFamily: 'Banger',
  color: Colors.black,
  fontSize: 20.0,
  letterSpacing: 1.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
);

const kscore = TextStyle(
  fontFamily: 'Banger',
  color: Colors.white,
  fontSize: 35.0,
  letterSpacing: 1.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
);
const kresulthead = TextStyle(
  fontFamily: 'Banger',
  color: Colors.yellow,
  fontSize: 35.0,
  letterSpacing: 1.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
);

const koptionBox=BoxDecoration(
  gradient: LinearGradient(
      colors: [Color(0xff242F9B), Color(0xff293462)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight),
  boxShadow: [
    BoxShadow(
        blurRadius: 3,
        color: Color(0xffFC9918),
        offset: Offset(4, 4))
  ],
  border: Border(
    left: BorderSide(color: Colors.black, width: 5),
    right: BorderSide(color: Colors.black, width: 5),
    top: BorderSide(color: Colors.black, width: 5),
    bottom: BorderSide(color: Colors.black, width: 5),
  ),
);

const kbuttontext=TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
const kquote=TextStyle(
  fontSize: 20.0,
  height: 2,
  fontFamily: 'quote',
  color: Colors.white60,
  fontWeight: FontWeight.bold,
);
const kresulttiles = TextStyle(
  fontFamily: 'amar',
  color: Colors.yellow,
  fontSize: 35.0,
  letterSpacing: 1.0,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w500,
);




//
// const kbuttontext=TextStyle(
//   letterSpacing: 5,
//   color: Colors.black,
//   fontSize: 15,
//   fontWeight: FontWeight.w400,
// );
const kTextFieldDecoration =InputDecoration(
  hintText: 'Enter your value',
  hintStyle: TextStyle(
      color: Colors.black
  ),
  labelStyle: TextStyle(color: Colors.black),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blue, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.indigo, width: 5.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kheading=TextStyle(
    color: Color(0xffF4F6FF),
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic
);



















const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
