import 'dart:math' as math;
import 'package:flutter/material.dart';

class BlueSqueareWithStatefulNoClickRepeat extends StatefulWidget {
  const BlueSqueareWithStatefulNoClickRepeat({super.key});

  @override
  State<BlueSqueareWithStatefulNoClickRepeat> createState() => _BlueSqueareWithStatefulNoClickRepeatState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _BlueSqueareWithStatefulNoClickRepeatState extends State<BlueSqueareWithStatefulNoClickRepeat>
    with TickerProviderStateMixin {

  int clicks = 0;
  double scale = 1.0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat(); // cascade notation 을 사용하면 변수뿐만 아니라 함수까지도 사용할 수 있다. 여기서 강력한게 발휘되네... 이걸로 이게 바로 실행되네..


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: GestureDetector(
        onTap: () {
          setState(() {
            clicks++;
          });

          //_controller.reverse(from: 1.0);
        },
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(
            child: Text('$clicks'),
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
