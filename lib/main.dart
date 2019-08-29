import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentStep = 0;
  List<Step> mySteps = [
    new Step(title: Text("Paso 1"), content: Text("Aprender Flutter")),
    new Step(title: Text("Paso 2"), content: Text("Desarrollar App")),
    new Step(title: Text("Paso 3"), content: Text("Publicar App")),

    
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Stepper(
          currentStep: this._currentStep,
          steps: mySteps,
          type: StepperType.vertical,
          onStepContinue: () {
            setState(() {
              if (_currentStep < mySteps.length - 1) {
                _currentStep = _currentStep + 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          onStepTapped: (stape) {
            setState(() {
              _currentStep = stape;
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep = _currentStep - 1;
              }
            });
          },
        ),
      ),
    );
  }
}
