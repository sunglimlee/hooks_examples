import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'random_number_hook_user_defined_class.dart';

class BlueSquareWithHook extends HookWidget {
  final double size;
  const BlueSquareWithHook({Key? key, required this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final clicks = useState(0);
    final scale = useState(3.0);
    // 기억해라. build 안에서 사용해라.. 그리고 항상 final 이어야 한다고 했다.
    final randomNumber = useRandomNumber(context);

    final controller1 = useAnimationController(
      duration: const Duration(seconds: 1),
      lowerBound: 0.8,
      upperBound: 1.0,
    );

    // build 가 함수라는 건 알고 있지? 이런걸 헷갈려하면 안되지...그래서 HookWidget 은 build 안에다가 넣어주면 된다.
/*
    controller1.addListener(() {
      scale.value = controller1.value;
    });
*/

    return AnimatedBuilder(
      animation: controller1,
      builder: (context, child) {
        return Transform.scale(
          scale: controller1.value, // scale.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          clicks.value++;
          controller1.reverse(from: 1.0);
        },
        child: Container(
          height: size,
          width: size,
          color: Colors.pink,
          child: Center(
            child: Text('${clicks.value} 그리고 ${randomNumber.toString()}'),
          ),
        ),
      ),
    );
  }
}