// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudyProgress {

 String get id; String get categoryId; int get totalCards; int get knownCards; int get unknownCards; DateTime get studiedAt;
/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyProgressCopyWith<StudyProgress> get copyWith => _$StudyProgressCopyWithImpl<StudyProgress>(this as StudyProgress, _$identity);

  /// Serializes this StudyProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.totalCards, totalCards) || other.totalCards == totalCards)&&(identical(other.knownCards, knownCards) || other.knownCards == knownCards)&&(identical(other.unknownCards, unknownCards) || other.unknownCards == unknownCards)&&(identical(other.studiedAt, studiedAt) || other.studiedAt == studiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,totalCards,knownCards,unknownCards,studiedAt);

@override
String toString() {
  return 'StudyProgress(id: $id, categoryId: $categoryId, totalCards: $totalCards, knownCards: $knownCards, unknownCards: $unknownCards, studiedAt: $studiedAt)';
}


}

/// @nodoc
abstract mixin class $StudyProgressCopyWith<$Res>  {
  factory $StudyProgressCopyWith(StudyProgress value, $Res Function(StudyProgress) _then) = _$StudyProgressCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, int totalCards, int knownCards, int unknownCards, DateTime studiedAt
});




}
/// @nodoc
class _$StudyProgressCopyWithImpl<$Res>
    implements $StudyProgressCopyWith<$Res> {
  _$StudyProgressCopyWithImpl(this._self, this._then);

  final StudyProgress _self;
  final $Res Function(StudyProgress) _then;

/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? totalCards = null,Object? knownCards = null,Object? unknownCards = null,Object? studiedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,totalCards: null == totalCards ? _self.totalCards : totalCards // ignore: cast_nullable_to_non_nullable
as int,knownCards: null == knownCards ? _self.knownCards : knownCards // ignore: cast_nullable_to_non_nullable
as int,unknownCards: null == unknownCards ? _self.unknownCards : unknownCards // ignore: cast_nullable_to_non_nullable
as int,studiedAt: null == studiedAt ? _self.studiedAt : studiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StudyProgress implements StudyProgress {
  const _StudyProgress({required this.id, required this.categoryId, required this.totalCards, required this.knownCards, required this.unknownCards, required this.studiedAt});
  factory _StudyProgress.fromJson(Map<String, dynamic> json) => _$StudyProgressFromJson(json);

@override final  String id;
@override final  String categoryId;
@override final  int totalCards;
@override final  int knownCards;
@override final  int unknownCards;
@override final  DateTime studiedAt;

/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyProgressCopyWith<_StudyProgress> get copyWith => __$StudyProgressCopyWithImpl<_StudyProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudyProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.totalCards, totalCards) || other.totalCards == totalCards)&&(identical(other.knownCards, knownCards) || other.knownCards == knownCards)&&(identical(other.unknownCards, unknownCards) || other.unknownCards == unknownCards)&&(identical(other.studiedAt, studiedAt) || other.studiedAt == studiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,totalCards,knownCards,unknownCards,studiedAt);

@override
String toString() {
  return 'StudyProgress(id: $id, categoryId: $categoryId, totalCards: $totalCards, knownCards: $knownCards, unknownCards: $unknownCards, studiedAt: $studiedAt)';
}


}

/// @nodoc
abstract mixin class _$StudyProgressCopyWith<$Res> implements $StudyProgressCopyWith<$Res> {
  factory _$StudyProgressCopyWith(_StudyProgress value, $Res Function(_StudyProgress) _then) = __$StudyProgressCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, int totalCards, int knownCards, int unknownCards, DateTime studiedAt
});




}
/// @nodoc
class __$StudyProgressCopyWithImpl<$Res>
    implements _$StudyProgressCopyWith<$Res> {
  __$StudyProgressCopyWithImpl(this._self, this._then);

  final _StudyProgress _self;
  final $Res Function(_StudyProgress) _then;

/// Create a copy of StudyProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? totalCards = null,Object? knownCards = null,Object? unknownCards = null,Object? studiedAt = null,}) {
  return _then(_StudyProgress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,totalCards: null == totalCards ? _self.totalCards : totalCards // ignore: cast_nullable_to_non_nullable
as int,knownCards: null == knownCards ? _self.knownCards : knownCards // ignore: cast_nullable_to_non_nullable
as int,unknownCards: null == unknownCards ? _self.unknownCards : unknownCards // ignore: cast_nullable_to_non_nullable
as int,studiedAt: null == studiedAt ? _self.studiedAt : studiedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
