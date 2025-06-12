// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestResult {

 String get id; String get categoryId; int get correctAnswers; int get incorrectAnswers; DateTime get date;
/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestResultCopyWith<TestResult> get copyWith => _$TestResultCopyWithImpl<TestResult>(this as TestResult, _$identity);

  /// Serializes this TestResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestResult&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,correctAnswers,incorrectAnswers,date);

@override
String toString() {
  return 'TestResult(id: $id, categoryId: $categoryId, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, date: $date)';
}


}

/// @nodoc
abstract mixin class $TestResultCopyWith<$Res>  {
  factory $TestResultCopyWith(TestResult value, $Res Function(TestResult) _then) = _$TestResultCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, int correctAnswers, int incorrectAnswers, DateTime date
});




}
/// @nodoc
class _$TestResultCopyWithImpl<$Res>
    implements $TestResultCopyWith<$Res> {
  _$TestResultCopyWithImpl(this._self, this._then);

  final TestResult _self;
  final $Res Function(TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TestResult implements TestResult {
  const _TestResult({required this.id, required this.categoryId, required this.correctAnswers, required this.incorrectAnswers, required this.date});
  factory _TestResult.fromJson(Map<String, dynamic> json) => _$TestResultFromJson(json);

@override final  String id;
@override final  String categoryId;
@override final  int correctAnswers;
@override final  int incorrectAnswers;
@override final  DateTime date;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestResultCopyWith<_TestResult> get copyWith => __$TestResultCopyWithImpl<_TestResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestResult&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.incorrectAnswers, incorrectAnswers) || other.incorrectAnswers == incorrectAnswers)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,correctAnswers,incorrectAnswers,date);

@override
String toString() {
  return 'TestResult(id: $id, categoryId: $categoryId, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TestResultCopyWith<$Res> implements $TestResultCopyWith<$Res> {
  factory _$TestResultCopyWith(_TestResult value, $Res Function(_TestResult) _then) = __$TestResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, int correctAnswers, int incorrectAnswers, DateTime date
});




}
/// @nodoc
class __$TestResultCopyWithImpl<$Res>
    implements _$TestResultCopyWith<$Res> {
  __$TestResultCopyWithImpl(this._self, this._then);

  final _TestResult _self;
  final $Res Function(_TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? correctAnswers = null,Object? incorrectAnswers = null,Object? date = null,}) {
  return _then(_TestResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,incorrectAnswers: null == incorrectAnswers ? _self.incorrectAnswers : incorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
