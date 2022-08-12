// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adopt_pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdoptPet _$AdoptPetFromJson(Map<String, dynamic> json) {
  return _AdoptPet.fromJson(json);
}

/// @nodoc
mixin _$AdoptPet {
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'entries')
  List<AdoptPetData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdoptPetCopyWith<AdoptPet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdoptPetCopyWith<$Res> {
  factory $AdoptPetCopyWith(AdoptPet value, $Res Function(AdoptPet) then) =
      _$AdoptPetCopyWithImpl<$Res>;
  $Res call({int count, @JsonKey(name: 'entries') List<AdoptPetData> data});
}

/// @nodoc
class _$AdoptPetCopyWithImpl<$Res> implements $AdoptPetCopyWith<$Res> {
  _$AdoptPetCopyWithImpl(this._value, this._then);

  final AdoptPet _value;
  // ignore: unused_field
  final $Res Function(AdoptPet) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AdoptPetData>,
    ));
  }
}

/// @nodoc
abstract class _$$_AdoptPetCopyWith<$Res> implements $AdoptPetCopyWith<$Res> {
  factory _$$_AdoptPetCopyWith(
          _$_AdoptPet value, $Res Function(_$_AdoptPet) then) =
      __$$_AdoptPetCopyWithImpl<$Res>;
  @override
  $Res call({int count, @JsonKey(name: 'entries') List<AdoptPetData> data});
}

/// @nodoc
class __$$_AdoptPetCopyWithImpl<$Res> extends _$AdoptPetCopyWithImpl<$Res>
    implements _$$_AdoptPetCopyWith<$Res> {
  __$$_AdoptPetCopyWithImpl(
      _$_AdoptPet _value, $Res Function(_$_AdoptPet) _then)
      : super(_value, (v) => _then(v as _$_AdoptPet));

  @override
  _$_AdoptPet get _value => super._value as _$_AdoptPet;

  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_AdoptPet(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AdoptPetData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdoptPet extends _AdoptPet {
  const _$_AdoptPet(
      {required this.count,
      @JsonKey(name: 'entries') required final List<AdoptPetData> data})
      : _data = data,
        super._();

  factory _$_AdoptPet.fromJson(Map<String, dynamic> json) =>
      _$$_AdoptPetFromJson(json);

  @override
  final int count;
  final List<AdoptPetData> _data;
  @override
  @JsonKey(name: 'entries')
  List<AdoptPetData> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AdoptPet(count: $count, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdoptPet &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_AdoptPetCopyWith<_$_AdoptPet> get copyWith =>
      __$$_AdoptPetCopyWithImpl<_$_AdoptPet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdoptPetToJson(
      this,
    );
  }
}

abstract class _AdoptPet extends AdoptPet {
  const factory _AdoptPet(
          {required final int count,
          @JsonKey(name: 'entries') required final List<AdoptPetData> data}) =
      _$_AdoptPet;
  const _AdoptPet._() : super._();

  factory _AdoptPet.fromJson(Map<String, dynamic> json) = _$_AdoptPet.fromJson;

  @override
  int get count;
  @override
  @JsonKey(name: 'entries')
  List<AdoptPetData> get data;
  @override
  @JsonKey(ignore: true)
  _$$_AdoptPetCopyWith<_$_AdoptPet> get copyWith =>
      throw _privateConstructorUsedError;
}
