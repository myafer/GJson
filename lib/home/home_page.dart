import 'package:flutter/material.dart';
import 'package:gjson/home/home_left.dart';
import 'package:gjson/home/home_right.dart';
import 'package:gjson/widgets/dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: [
            const HomeTopWidget(),
            Expanded(
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: HomeLeftWidget(),
                  ),
                  Expanded(
                    child: HomeRightWidget(),
                  )
                ],
              ),
            ),
            const HomeBottomWidget(),
          ],
        ),
      ),
    );
  }
}

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: const Text('设置'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class HomeBottomWidget extends StatelessWidget {
  const HomeBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 160,
    );
  }
}
