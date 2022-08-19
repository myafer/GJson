import 'package:flutter/material.dart';
import 'package:json_editor/json_editor.dart';

class HomeLeftWidget extends StatefulWidget {
  HomeLeftWidget({Key? key}) : super(key: key);

  @override
  State<HomeLeftWidget> createState() => _HomeLeftWidgetState();
}

class _HomeLeftWidgetState extends State<HomeLeftWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFEFEF),
      child: JsonEditor.string(
        jsonString: '',
        onValueChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
