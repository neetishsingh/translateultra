import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Languages.dart';

class TranslateUltra extends StatefulWidget {
  final text, language, location;

  final textstyle;
  const TranslateUltra(
      {Key? key, this.text, this.textstyle, this.language, this.location})
      : super(key: key);

  @override
  State<TranslateUltra> createState() => _TranslateUltraState();
}

class _TranslateUltraState extends State<TranslateUltra> {
  getText(location) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Languages>(
        future: Languages.create(
            location), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Languages> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Text(snapshot.data?.getENGLanguage(widget.text, widget.language))
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[Text(widget.text)];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
    //widget.mylang.then((value) => {return value.getValue()});
  }

  @override
  Widget build(BuildContext context) {
    return getText(widget.location);
  }
}
