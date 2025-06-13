// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Statistics {

 int get totalCardsReviewed; int get correctAnswers; int get wrongAnswers; DateTime get lastReviewed;
/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsCopyWith<Statistics> get copyWith => _$StatisticsCopyWithImpl<Statistics>(this as Statistics, _$identity);

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Statistics&&(identical(other.totalCardsReviewed, totalCardsReviewed) || other.totalCardsReviewed == totalCardsReviewed)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.wrongAnswers, wrongAnswers) || other.wrongAnswers == wrongAnswers)&&(identical(other.lastReviewed, lastReviewed) || other.lastReviewed == lastReviewed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCardsReviewed,correctAnswers,wrongAnswers,lastReviewed);

@override
String toString() {
  return 'Statistics(totalCardsReviewed: $totalCardsReviewed, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, lastReviewed: $lastReviewed)';
}


}

/// @nodoc
abstract mixin class $StatisticsCopyWith<$Res>  {
  factory $StatisticsCopyWith(Statistics value, $Res Function(Statistics) _then) = _$StatisticsCopyWithImpl;
@useResult
$Res call({
 int totalCardsReviewed, int correctAnswers, int wrongAnswers, DateTime lastReviewed
});




}
/// @nodoc
class _$StatisticsCopyWithImpl<$Res>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._self, this._then);

  final Statistics _self;
  final $Res Function(Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCardsReviewed = null,Object? correctAnswers = null,Object? wrongAnswers = null,Object? lastReviewed = null,}) {
  return _then(_self.copyWith(
totalCardsReviewed: null == totalCardsReviewed ? _self.totalCardsReviewed : totalCardsReviewed // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,wrongAnswers: null == wrongAnswers ? _self.wrongAnswers : wrongAnswers // ignore: cast_nullable_to_non_nullable
as int,lastReviewed: null == lastReviewed ? _self.lastReviewed : lastReviewed // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Statistics implements Statistics {
  const _Statistics({required this.totalCardsReviewed, required this.correctAnswers, required this.wrongAnswers, required this.lastReviewed});
  factory _Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

@override final  int totalCardsReviewed;
@override final  int correctAnswers;
@override final  int wrongAnswers;
@override final  DateTime lastReviewed;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsCopyWith<_Statistics> get copyWith => __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Statistics&&(identical(other.totalCardsReviewed, totalCardsReviewed) || other.totalCardsReviewed == totalCardsReviewed)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.wrongAnswers, wrongAnswers) || other.wrongAnswers == wrongAnswers)&&(identical(other.lastReviewed, lastReviewed) || other.lastReviewed == lastReviewed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCardsReviewed,correctAnswers,wrongAnswers,lastReviewed);

@override
String toString() {
  return 'Statistics(totalCardsReviewed: $totalCardsReviewed, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, lastReviewed: $lastReviewed)';
}


}

/// @nodoc
abstract mixin class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(_Statistics value, $Res Function(_Statistics) _then) = __$StatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalCardsReviewed, int correctAnswers, int wrongAnswers, DateTime lastReviewed
});




}
/// @nodoc
class __$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(this._self, this._then);

  final _Statistics _self;
  final $Res Function(_Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCardsReviewed = null,Object? correctAnswers = null,Object? wrongAnswers = null,Object? lastReviewed = null,}) {
  return _then(_Statistics(
totalCardsReviewed: null == totalCardsReviewed ? _self.totalCardsReviewed : totalCardsReviewed // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,wrongAnswers: null == wrongAnswers ? _self.wrongAnswers : wrongAnswers // ignore: cast_nullable_to_non_nullable
as int,lastReviewed: null == lastReviewed ? _self.lastReviewed : lastReviewed // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
