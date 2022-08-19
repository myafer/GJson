import 'package:flutter/material.dart';
import 'package:gjson/widgets/dialog.dart';

class SettingDialog extends StatefulWidget {
  SettingDialog({Key? key}) : super(key: key);

  static show() {
    GDialog.showDailog(title: '', contentText: '', actions: [
      GDialogAction(
        '保存',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        action: () async {},
      ),
    ]);
  }

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
