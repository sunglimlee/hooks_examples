import 'package:flutter/material.dart';
import 'package:hooks_examples/freezed/data/freezed_classes.dart';

class FreezedClassesScreen extends StatelessWidget {
  const FreezedClassesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 항상 final 로 데이터를 정의하는 습관을 들이는게 좋다.
    const user = User(name: '이성림', age: 52);
    // user.age = 53; // 이건 안된다. 왜냐하면 setter 가 정해져 있지 않기 때문이다.
    final user2 = user.copyWith(age: 52); // copyWith 도 잘되고. 바로 이걸 원했던 거거든..
    final serialized = user.toJson(); // 이름봐라. 직렬화. 그래서 toJson
    final deserialized = User.fromJson(serialized); // 이거봐라.... fromJson 은 static 이니깐 User 를 사용해야지.. 이런 깨알같은 실수.. 깨알도 아니지..

    return Column(children: [
      () {
        print(user2.toString());
        print(user == user2); // 같다고 나온다
        return Text(user2.age.toString());
      }(),
      () {
        return Text('user\'s json :  $serialized');
      }(),
      Text(deserialized.toString()),
    ]);
  }
}
