import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Translator'),
        ),
        body: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  GoogleTranslator translator =
      new GoogleTranslator(); //using google translator

  String out;
  final lang = TextEditingController(); //getting text
  final myController = TextEditingController();
  void trans(String so) {
    translator.translate(lang.text, to: '$so') //translating to hi = hindi
        .then((output) {
      print(output);
      setState(() {
        out = output
            .toString(); //placing the translated text to the String to be used
      });
      print(out);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Wrap(
            children: <Widget>[
              SafeArea(
                child: Text(
                  'Check the language code given below',
                  style: TextStyle(fontSize: 23),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Image(
                image: AssetImage('assets/Language-Codes.png'),
              ),
              SafeArea(
                child: Text(
                  'Enter the Language code in small letters below in the text box',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              TextField(
                controller: myController,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 90,
              ),
              SafeArea(
                child: Text(
                  'Enter the Text below to translate',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              TextField(
                controller: lang,
                style: TextStyle(fontSize: 35),
              ),
              RaisedButton(
                color: Colors.blueGrey,
                child: Text(
                    "Translate"), //on press to translate the language using function
                onPressed: () {
                  trans(myController.text);
                },
              ),
              SizedBox(
                width: 35,
              ),
              Text(
                out.toString(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ) //translated string
            ],
          ),
        ),
      ),
    );
  }
}
