import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// https://medium.com/flutter-community/flutter-hooks-7754df814995 참고
class _RandomNumberHook extends Hook<int> {
  const _RandomNumberHook(); // 그냥 일반 생성자로 만든다.

  @override
  __RandomNumberHookState createState() => __RandomNumberHookState();
}

class __RandomNumberHookState extends HookState<int, _RandomNumberHook> {
  late Timer timer;
  Random rand = Random();
  int randNumber = 0;


  @override
  void initHook() {
    // 타이머 때문에 무한정 돌아가네...
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {randNumber = rand.nextInt(9); });
    });
    super.initHook();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  int build(BuildContext context) {
    return randNumber;
  }
}

// 이제 이 클래스를 함수를 이용해서 등록해준다.
int useRandomNumber(BuildContext context) {
  return use(const _RandomNumberHook());
}