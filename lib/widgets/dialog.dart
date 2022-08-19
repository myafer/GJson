import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GDialog {
  static showDailog({
    String title = '',
    String? contentText,
    Widget? contentWidget,
    double contentFontSize = 18,
    void Function()? onCancel,
    List<Widget>? actions,
    bool isVertical = false,
  }) {
    /// 处理传入的title,content内容
    Widget getChildren(
      String? contentText,
      Widget? contentWidget,
      String title,
    ) {
      List<Widget> children = [];
      if (title.isNotEmpty) {
        children.add(Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1C1F2A),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ));
      }
      children.add(
        contentText != null
            ? Text(
                contentText,
                style: TextStyle(
                  color: const Color(0xFF293045),
                  fontSize: contentFontSize,
                  height: 1.35,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              )
            : (contentWidget ?? const SizedBox()),
      );

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }

    List<Widget>? actionWidgets = <Widget>[];
    if (isVertical) {
      if (null != actions) {
        for (var action in actions) {
          actionWidgets.add(Container(
            height: 0.5,
            color: const Color(0xFFDFDFDF),
          ));
          actionWidgets.add(action);
        }
      }
    } else {
      actionWidgets = actions != null && actions.length == 2
          ? <Widget>[
              Container(
                height: 0.5,
                color: const Color(0xFFDFDFDF),
              ),
              Row(children: [
                Expanded(child: actions[0]),
                Container(
                  width: 0.5,
                  height: 49.5,
                  color: const Color(0xFFDFDFDF),
                ),
                Expanded(child: actions[1]),
              ])
            ]
          : actions;
    }

    Get.generalDialog(
      pageBuilder: (context, a, b) {
        Widget baseAlertDialog = AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 24,
                    left: 30,
                    right: 30,
                  ),
                  child: getChildren(contentText, contentWidget, title),
                ),
              ],
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowDirection: VerticalDirection.up,
          actions: actionWidgets,
          buttonPadding: EdgeInsets.zero,
        );
        return baseAlertDialog;
      },
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: const Color(0x9A000000),
    );
  }
}

class GDialogAction extends StatefulWidget {
  const GDialogAction(
    this.title, {
    Key? key,
    this.action,
    this.style = const TextStyle(
      fontSize: 16,
      color: Color(0xFF00CC7A),
    ),
  }) : super(key: key);
  final String title;
  final TextStyle style;
  final void Function()? action;

  @override
  State<GDialogAction> createState() => _GDialogActionState();
}

class _GDialogActionState extends State<GDialogAction> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 0.5,
            color: const Color(0xFFDFDFDF),
          ),
          Container(
            alignment: Alignment.center,
            height: 49.5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Text(
              widget.title,
              style: widget.style,
            ),
          )
        ],
      ),
    );
  }
}
