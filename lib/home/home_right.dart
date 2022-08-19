import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/dart.dart';

class HomeRightWidget extends StatefulWidget {
  HomeRightWidget({Key? key}) : super(key: key);

  @override
  State<HomeRightWidget> createState() => _HomeRightWidgetState();
}

class _HomeRightWidgetState extends State<HomeRightWidget> {
  late CodeController? _codeController;

  @override
  void initState() {
    const source = "void main() {\n    print(\"Hello, world!\");\n}";
    _codeController = CodeController(
      text: source,
      language: dart,
      theme: monokaiSublimeTheme,
    );
    super.initState();
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: CodeField(
          controller: _codeController!,
          textStyle: TextStyle(fontFamily: 'SourceCode'),
          background: Colors.black,
        ),
      ),
    );
  }
}
