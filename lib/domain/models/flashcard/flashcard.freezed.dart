// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Flashcard {

 String get id; String get categoryId; String get front; String get back; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of Flashcard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardCopyWith<Flashcard> get copyWith => _$FlashcardCopyWithImpl<Flashcard>(this as Flashcard, _$identity);

  /// Serializes this Flashcard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Flashcard&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.front, front) || other.front == front)&&(identical(other.back, back) || other.back == back)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,front,back,createdAt,updatedAt);

@override
String toString() {
  return 'Flashcard(id: $id, categoryId: $categoryId, front: $front, back: $back, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FlashcardCopyWith<$Res>  {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) _then) = _$FlashcardCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, String front, String back, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$FlashcardCopyWithImpl<$Res>
    implements $FlashcardCopyWith<$Res> {
  _$FlashcardCopyWithImpl(this._self, this._then);

  final Flashcard _self;
  final $Res Function(Flashcard) _then;

/// Create a copy of Flashcard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? front = null,Object? back = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,front: null == front ? _self.front : front // ignore: cast_nullable_to_non_nullable
as String,back: null == back ? _self.back : back // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Flashcard implements Flashcard {
  const _Flashcard({required this.id, required this.categoryId, required this.front, required this.back, required this.createdAt, this.updatedAt});
  factory _Flashcard.fromJson(Map<String, dynamic> json) => _$FlashcardFromJson(json);

@override final  String id;
@override final  String categoryId;
@override final  String front;
@override final  String back;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Flashcard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardCopyWith<_Flashcard> get copyWith => __$FlashcardCopyWithImpl<_Flashcard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashcardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flashcard&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.front, front) || other.front == front)&&(identical(other.back, back) || other.back == back)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,front,back,createdAt,updatedAt);

@override
String toString() {
  return 'Flashcard(id: $id, categoryId: $categoryId, front: $front, back: $back, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FlashcardCopyWith<$Res> implements $FlashcardCopyWith<$Res> {
  factory _$FlashcardCopyWith(_Flashcard value, $Res Function(_Flashcard) _then) = __$FlashcardCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, String front, String back, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$FlashcardCopyWithImpl<$Res>
    implements _$FlashcardCopyWith<$Res> {
  __$FlashcardCopyWithImpl(this._self, this._then);

  final _Flashcard _self;
  final $Res Function(_Flashcard) _then;

/// Create a copy of Flashcard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? front = null,Object? back = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_Flashcard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,front: null == front ? _self.front : front // ignore: cast_nullable_to_non_nullable
as String,back: null == back ? _self.back : back // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
