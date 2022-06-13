import 'dart:convert';

import 'package:flutter/services.dart';

class Languages {
  static var value = "";
  static Future ReadJsonData(location) async {
    //read json file

    final jsondata = await rootBundle.loadString(location);
    //decode json data as list
    //print(jsondata);
    //print(jsonDecode(jsondata));
    value = jsondata;

    print(value);

    //map json and initialize using DataModel
    //return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  Languages._create(location) {
    print("_create() (private constructor)");

    // Do most of your initialization here, that's what a constructor is for
    //...
  }

  /// Public factory
  static Future<Languages> create(location) async {
    print("create() (public factory)");

    // Call the private constructor
    var component = Languages._create(location);

    await ReadJsonData(location);
    // Do initialization that requires async
    //await component._complexAsyncInit();

    // Return the fully initialized object
    return component;
  }

  //Future<dynamic> justy(location) async => await ReadJsonData(location);
  //var value = '''{
  // "language": ["en", "hi","bg","pnj"],
  // "hi": ["hi", "नमस्ते","ওহে","ਹੈਲੋ"]
  //}''';

  getRankofLanguage(lang) {
    print(lang);
    var details = jsonDecode(value);
    return details["language"].indexOf(lang);
  }

  getValue() {
    return value;
  }

  getENGLanguage(words, language) {
    try {
      var details = jsonDecode(value);
      return details[words.toString().toLowerCase()]
          [getRankofLanguage(language)];
    } catch (e) {
      print(e);
      return words;
    }
    //final translator = GoogleTranslator();
    //final input = words;

    // Using the Future API

    // Passing the translation to a variable

    // For countries that default base URL doesn't work

    //prints 这意味着用中文'测试'
  }
}
