import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_classes.freezed.dart'; // 반드시 있어야 하는 라인 왜냐면 이걸로 다음 파일로 나눠버리거든.
part 'freezed_classes.g.dart'; // json serializable 위해서 있어야 한다.

//part 'freezed_classes.g.dart';

@freezed
class User with _$User {
  const factory User({required String name, required int age}) = _User; // {} named optional argument 사용한 방법
  //const factory User({required String name}, [int age]) = _User; // 이렇게 [] 으로 optional argument 를 만들어 넣을 수 있다. 그럼 아무것도 안들어가도 된다.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json); // 마지막에 json 을 넘겨주어야지 그걸로 코드를 generate 하지..
}
