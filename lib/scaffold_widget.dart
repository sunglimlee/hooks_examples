import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget myWidget;
  const ScaffoldWidget({Key? key, required this.myWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myWidget,
          ],
        ),
      ),
    );
  }
}
