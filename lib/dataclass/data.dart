import 'package:csiq_quiz/reuseableDatas/questionmodel.dart';

import '../reuseableDatas/questionmodel.dart';

// String questionbook="Coding";

List<QuestionModel> Coding = [
  QuestionModel(
    "This header file contains definitions of objects like cin, cout, cerr, etc.",
    {
      "icecream": false,
      "iomanip": false,
      "iostream": true,
      "fstream": false,
    },
  ),
  QuestionModel(
      "When one object acquires all the properties and behaviors of a parent object, it is known as ",
      {
        "Abstraction ": false,
        "Polymorphism": false,
        "Encapsulation": false,
        "Inheritance": true,
      }),
  QuestionModel("What is the exetencion of C file ?", {
    ".cpp": false,
    ".c": true,
    ".html": false,
    ".py": false,
  }),
  QuestionModel("Choose a valid identifer/variable name", {
    "1age": false,
    "age_*": false,
    "_age": true,
    "+age": false,
  }),
  QuestionModel("Which character is used to indicate the end of the string?", {
    "NULL": true,
    "Any alphabet": false,
    "FULL STOP(.)": false,
    "None of these": false,
  }),
  QuestionModel("Which character is used to indicate the end of the string?", {
    "NULL": true,
    "Any alphabet": false,
    "FULL STOP(.)": false,
    "None of these": false,
  }),
];

List<QuestionModel> Network = [
  QuestionModel("What is length of ip4 address ? ",
      {"16 bit": false, "128 bit": false, "64 bit": false, "32 bit": true}),
  QuestionModel(
      "Which command will display the assigned IP address of network adpater ?",
      {
        "Ipconfig-all": false,
        "configip": false,
        "ipconfig": true,
        "winip-all": false,
      }),
  QuestionModel("Which is the example of wireless encryption?", {
    "VPN": false,
    "WPA2": true,
    "DCHP": false,
    "IEEE": false,
  }),
  QuestionModel("Bluetooth is an example of _______", {
    "Wide area network": false,
    "Virtual private network": false,
    " Personal area network": true,
    "Local area network": false,
  }),
  QuestionModel("Encryption takes place at which layer?", {
    "Presentation": true,
    "Physical": false,
    "Application": false,
    "Session": false
  }),
  QuestionModel("Encryption takes place at which layer?", {
    "Presentation": true,
    "Physical": false,
    "Application": false,
    "Session": false
  }),
];

List<QuestionModel> Web_Dev = [
  QuestionModel(
      "CSS to a Html document can be added by which of the following methods ?",
      {
        "Internal CSS": false,
        "External CSS": false,
        "Inline CSS": false,
        "All of the above": true
      }),
  QuestionModel("DOM in Web Development stands for ?", {
    "Document Object Model": true,
    "Data Object Manipulation": false,
    "Data of metadata": false,
    "Data Object MediaQuery": false,
  }),
  QuestionModel("Which is the correct code for a relative hyperlink?", {
    '< a href= " index.html " <Link> /a >': false,
    '< a href= " ..index.com " >Link< a >': false,
    '< a href= " index/html.com " >< a/ >': false,
    '<a href="www.genius.com">Genius</a>': true,
  }),
  QuestionModel('What are props in React ?', {
    'arguments': true,
    'colors': false,
    'music element': false,
    'functions': false,
  }),
  QuestionModel('What is the correct command to create a new React project?', {
    'npm create-react-app': false,
    'npx create-react-app': false,
    'npx create-react-app myReactapp': true,
    'npm create-react-app myReactapp': false,
  }),
  QuestionModel('What is the correct command to create a new React project?', {
    'npm create-react-app': false,
    'npx create-react-app': false,
    'npx create-react-app myReactapp': true,
    'npm create-react-app myReactapp': false,
  }),
];
List<QuestionModel> IT_Tools = [
  QuestionModel("Word wrap means :", {
    'Inserting space between text': false,
    'Aligning text with the right margin': false,
    'Moving text automatically to the next line': true,
    'None of the above': false,
  }),
  QuestionModel('Ctrl+I is the shortcut for ', {
    'Backspace': false,
    'Italics': true,
    'Ribbon toolbar': false,
    'Indent': false,
  }),
  QuestionModel(
      'In Word 2007,if you will press a tab within a table cell moves you to:',
      {
        'Next Row': false,
        'Next column': false,
        'Next cell': true,
        'Next table': false,
      }),
  QuestionModel('Choose the correct option :', {
    'Mail Merge can be used to print the email letter ': false,
    'Mail Merge can be used to print the form letters and mailing labels':
        false,
    'Mail Merge can be used to print envelopes ': false,
    'All of the above': true,
  }),
  QuestionModel('The usage of of=ROUND(AVERAGE(G5,G12),0) will yield:', {
    'average of range G5:G12': false,
    'rounding of range': false,
    'Error condition': false,
    'First averaging of range G5:G12 followed by rounding to the nearest decimal place':
        true,
  }),
  QuestionModel('The usage of of=ROUND(AVERAGE(G5,G12),0) will yield:', {
    'average of range G5:G12': false,
    'rounding of range': false,
    'Error condition': false,
    'First averaging of range G5:G12 followed by rounding to the nearest decimal place':
        true,
  }),
];

List<QuestionModel> Hardware = [
  QuestionModel(
      'Permanent instructions that the computer uses when it is turned on and that cannot be changed by other instructions are contained in ___',
      {
        'ROM': true,
        'RAM': false,
        'ALU': false,
        'CPU': false,
      }),
  QuestionModel(
      'A device for changing the connection on a connector to a different configuration is ___',
      {
        'A converter': false,
        'An attachment': false,
        'A componen': false,
        'A adapter': true,
      }),
  QuestionModel('Laser printer resolution is specified in terms of ', {
    'CPI': false,
    'DPI': true,
    'LSI': false,
    'API': false,
  }),
  QuestionModel(
      'What type of connector is used to plug a telephone line into a modem?', {
    'COM1': false,
    'RJ-45': false,
    'RJ-11': true,
    'RJ-10': false,
  }),
  QuestionModel('When the system shuts down...... content is lost .', {
    'RAM': true,
    'INPUT': false,
    'ROM': false,
    'Storage': false,
  }),
  QuestionModel('When the system shuts down...... content is lost .', {
    'RAM': true,
    'INPUT': false,
    'ROM': false,
    'Storage': false,
  })
];
List<QuestionModel> Hacking = [
  QuestionModel('What in ENC in airodump-ng command stands for ?', {
    'Embedded Network Copy': false,
    'Encrption': true,
    'Engine Network Card': false,
    'Encodded Data': false,
  }),
  QuestionModel('Which technology is used in wifi having WEP as encrption?', {
    'RC4': true,
    'AL4': false,
    'IEEE': false,
    'GTX607': false,
  }),
  QuestionModel('What is HASHCAT ?', {
    'Network Jammer': false,
    'MAC Changer': false,
    'Password Cracker': true,
    'VPN Service': false,
  }),
  QuestionModel(
      '_________ is a complete suite of tools to assess WiFi network security.',
      {
        'Aircrack-ng': true,
        'Airodump-ng': false,
        'Aironull-ng': false,
        'tcpdump': false,
      }),
  QuestionModel('How is a brute-force attack performed?', {
    'By trying all possible combination': true,
    'Dictionary attack': false,
    'By comparing hashes': false,
    'By capturing hashes': false,
  }),
  QuestionModel('How is a brute-force attack performed?', {
    'By trying all possible combination': true,
    'Dictionary attack': false,
    'By comparing hashes': false,
    'By capturing hashes': false,
  }),
];
