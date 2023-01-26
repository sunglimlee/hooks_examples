import 'package:flutter/material.dart';

/// [애니메이션 작동 순서]
/// * Click 으로 애니메이션 실행 (_controller.reverse(from: 1.0);)
/// * 애니메이션이 (여기서는 AnimationController 가 값을 쏟아내기 시작
/// * 변경되는 값이 나올 때 마다 Listener 를 통해서 값을 알아낼 수 있다. controller.value
///   그 값이 나올 때 마다 setState 를 이용해서 나의 state 에 넣어주고
/// * setState 를 이용해서 나의 state 를 변경시켜서 그 값이 Transform 위젯이 반영하도록 rebuild 가 되도록 한다.
/// * 위의 연결 작업은 initState 에서 controller 를 초기화 할 때 하면 된다. addListener 도 같이 초기화 해준다.
/// * 이제 애니메이션이 화면에 보여진다.
/// *** 결론을 얘기하면 애니메이션은 그냥 값만 쏟아낼 뿐이고 Listener 가 있어서 변경되는 값을 Listener 를 통해서 알 수 있고 그래서 setState 로 변경된 값을 나의 state 에 넣으면
///     그 값을 이제 build 함수안에서 적용시키면 화면의 변화 즉 애니메이션이 일어나게 된다.
class BlueSquareWithStateful extends StatefulWidget {
  final double size;
  const BlueSquareWithStateful({Key? key, required this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlueSquareWithStatefulState();
}

class _BlueSquareWithStatefulState extends State<BlueSquareWithStateful> with TickerProviderStateMixin {
  int clicks = 0;
  double scale = 1.0;

  late final AnimationController _controller1;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      lowerBound: 0.2,
      upperBound: 1.0,
    );

    // 위의 onPressed 와는 아무 관계도 없는 거였어.. 이건 순전히 변경되는 값을 듣고 있다는 뜻이고 그때 콜백함수를 적용할 수 있다는 뜻이라는 거지..
    _controller1.addListener(() {
      setState(() {
        scale = _controller1.value;
      });
    });
  }

  // dispose 함수 아주 중요하다. 반드시 해주어야한다. 안그러면 메모리 누수가 일어난다.
  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 애니메이션 빌더를 이용해서 나의 콘트롤러와 변경될 위젯을 정해줄 수 있다. 여기서는 Transform.scale 위젯을 사용했고 알겠지만 named Constructor 이다.
    return AnimatedBuilder(
      animation: _controller1,
      builder: (context, child) {
        return Transform.scale(
          scale: scale, // listener 가 있기때문에 setState 가 있기 때문에 이런 연결고리로 인해서 이값이 바뀌어서 rebuild 가 일어난다.
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            clicks++;
          });

          // 클릭하니깐 여기서 부터 1로 커진상태에서 시작한다.
          _controller1.reverse(from: 1.0);
          //_controller1.repeat();
        },
        child: Container(
          height: widget.size,
          width: widget.size,
          color: Colors.blue,
          child: Center(
            child: Text('$clicks'),
          ),
        ),
      ),
    );
  }
}