import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text("Stateful widget buttons")),
      body: Center(
        child: Column(
          children: [
            SelectableButton(),
            const SizedBox(height: 20),
            SelectableButton(),
            const SizedBox(height: 20),
            SelectableButton(),
            const SizedBox(height: 20),
            SelectableButton()
          ], 
        ),
    )
  )
    );
  }
}
class SelectableButton extends StatefulWidget {
  const SelectableButton({Key? key}) : super(key: key);

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get buttonText { return isSelected ? "Selected" : "Not selected";}
  Color get textColor { return isSelected ? Colors.white : Colors.black;}
  Color get backgroundColor { return isSelected ? Colors.blue[500]! : Colors.blue[50]!;}
  void toSelect() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: toSelect,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor),
          child: Center(child: Text(buttonText, style: TextStyle(color: textColor,fontSize: 18))),
        ),
      );
  }
}