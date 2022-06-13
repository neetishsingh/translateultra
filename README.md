

## Features

TranslateUltra provides multiple custom translation methodolgy through which you 
can define how to deal with words or paragraph in different language.

## Getting started

Step 1: Install the package using
```
flutter pub add translateultra
```

## Usage

TODO: Include shorte and useful examples for pacwqkage users. Add longerw examples
to `/example` folder. 
Step 1- Create a JSON file in the below format and add as many details you need.

```json
{
    "language": ["en", "hi","bg","pnj"],
    "hi": ["hi", "नमस्ते","ওহে","ਹੈਲੋ"]
}
```

Step 2- Use TranslateUltra instead of Text widget to use your custom language.
```dart
 @override
Widget build(BuildContext context) {
  //getText();
  //print(widget.choosenLanguage);
  return Scaffold(
    body: TranslateUltra(
      text: "Hi",//Text 
      language: "en",//language you want to convert mentioned @ "location" of JSON
      location: "asset/custom.json",//asset location
    ),
  );
}
```

## Additional information

We will love you contribution to
<a herf="https://neetishsingh.com"></a>
