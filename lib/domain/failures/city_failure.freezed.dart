// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CityFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() noCityReported,
    required TResult Function() noInternetAccess,
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? noCityReported,
    TResult? Function()? noInternetAccess,
    TResult? Function()? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? noCityReported,
    TResult Function()? noInternetAccess,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NoCityReported value) noCityReported,
    required TResult Function(_NoInternetAccess value) noInternetAccess,
    required TResult Function(_Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NoCityReported value)? noCityReported,
    TResult? Function(_NoInternetAccess value)? noInternetAccess,
    TResult? Function(_Unexpected value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NoCityReported value)? noCityReported,
    TResult Function(_NoInternetAccess value)? noInternetAccess,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityFailureCopyWith<$Res> {
  factory $CityFailureCopyWith(
          CityFailure value, $Res Function(CityFailure) then) =
      _$CityFailureCopyWithImpl<$Res, CityFailure>;
}

/// @nodoc
class _$CityFailureCopyWithImpl<$Res, $Val extends CityFailure>
    implements $CityFailureCopyWith<$Res> {
  _$CityFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$CityFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'CityFailure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() noCityReported,
    required TResult Function() noInternetAccess,
    required TResult Function() unexpected,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? noCityReported,
    TResult? Function()? noInternetAccess,
    TResult? Function()? unexpected,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? noCityReported,
    TResult Function()? noInternetAccess,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NoCityReported value) noCityReported,
    required TResult Function(_NoInternetAccess value) noInternetAccess,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NoCityReported value)? noCityReported,
    TResult? Function(_NoInternetAccess value)? noInternetAccess,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NoCityReported value)? noCityReported,
    TResult Function(_NoInternetAccess value)? noInternetAccess,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends CityFailure {
  const factory _NotFound() = _$NotFoundImpl;
  const _NotFound._() : super._();
}

/// @nodoc
abstract class _$$NoCityReportedImplCopyWith<$Res> {
  factory _$$NoCityReportedImplCopyWith(_$NoCityReportedImpl value,
          $Res Function(_$NoCityReportedImpl) then) =
      __$$NoCityReportedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoCityReportedImplCopyWithImpl<$Res>
    extends _$CityFailureCopyWithImpl<$Res, _$NoCityReportedImpl>
    implements _$$NoCityReportedImplCopyWith<$Res> {
  __$$NoCityReportedImplCopyWithImpl(
      _$NoCityReportedImpl _value, $Res Function(_$NoCityReportedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoCityReportedImpl extends _NoCityReported {
  const _$NoCityReportedImpl() : super._();

  @override
  String toString() {
    return 'CityFailure.noCityReported()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoCityReportedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() noCityReported,
    required TResult Function() noInternetAccess,
    required TResult Function() unexpected,
  }) {
    return noCityReported();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? noCityReported,
    TResult? Function()? noInternetAccess,
    TResult? Function()? unexpected,
  }) {
    return noCityReported?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? noCityReported,
    TResult Function()? noInternetAccess,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (noCityReported != null) {
      return noCityReported();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NoCityReported value) noCityReported,
    required TResult Function(_NoInternetAccess value) noInternetAccess,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return noCityReported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NoCityReported value)? noCityReported,
    TResult? Function(_NoInternetAccess value)? noInternetAccess,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return noCityReported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NoCityReported value)? noCityReported,
    TResult Function(_NoInternetAccess value)? noInternetAccess,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (noCityReported != null) {
      return noCityReported(this);
    }
    return orElse();
  }
}

abstract class _NoCityReported extends CityFailure {
  const factory _NoCityReported() = _$NoCityReportedImpl;
  const _NoCityReported._() : super._();
}

/// @nodoc
abstract class _$$NoInternetAccessImplCopyWith<$Res> {
  factory _$$NoInternetAccessImplCopyWith(_$NoInternetAccessImpl value,
          $Res Function(_$NoInternetAccessImpl) then) =
      __$$NoInternetAccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetAccessImplCopyWithImpl<$Res>
    extends _$CityFailureCopyWithImpl<$Res, _$NoInternetAccessImpl>
    implements _$$NoInternetAccessImplCopyWith<$Res> {
  __$$NoInternetAccessImplCopyWithImpl(_$NoInternetAccessImpl _value,
      $Res Function(_$NoInternetAccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoInternetAccessImpl extends _NoInternetAccess {
  const _$NoInternetAccessImpl() : super._();

  @override
  String toString() {
    return 'CityFailure.noInternetAccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetAccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() noCityReported,
    required TResult Function() noInternetAccess,
    required TResult Function() unexpected,
  }) {
    return noInternetAccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? noCityReported,
    TResult? Function()? noInternetAccess,
    TResult? Function()? unexpected,
  }) {
    return noInternetAccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? noCityReported,
    TResult Function()? noInternetAccess,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (noInternetAccess != null) {
      return noInternetAccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NoCityReported value) noCityReported,
    required TResult Function(_NoInternetAccess value) noInternetAccess,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return noInternetAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NoCityReported value)? noCityReported,
    TResult? Function(_NoInternetAccess value)? noInternetAccess,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return noInternetAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NoCityReported value)? noCityReported,
    TResult Function(_NoInternetAccess value)? noInternetAccess,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (noInternetAccess != null) {
      return noInternetAccess(this);
    }
    return orElse();
  }
}

abstract class _NoInternetAccess extends CityFailure {
  const factory _NoInternetAccess() = _$NoInternetAccessImpl;
  const _NoInternetAccess._() : super._();
}

/// @nodoc
abstract class _$$UnexpectedImplCopyWith<$Res> {
  factory _$$UnexpectedImplCopyWith(
          _$UnexpectedImpl value, $Res Function(_$UnexpectedImpl) then) =
      __$$UnexpectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnexpectedImplCopyWithImpl<$Res>
    extends _$CityFailureCopyWithImpl<$Res, _$UnexpectedImpl>
    implements _$$UnexpectedImplCopyWith<$Res> {
  __$$UnexpectedImplCopyWithImpl(
      _$UnexpectedImpl _value, $Res Function(_$UnexpectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnexpectedImpl extends _Unexpected {
  const _$UnexpectedImpl() : super._();

  @override
  String toString() {
    return 'CityFailure.unexpected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnexpectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() noCityReported,
    required TResult Function() noInternetAccess,
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? noCityReported,
    TResult? Function()? noInternetAccess,
    TResult? Function()? unexpected,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? noCityReported,
    TResult Function()? noInternetAccess,
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_NoCityReported value) noCityReported,
    required TResult Function(_NoInternetAccess value) noInternetAccess,
    required TResult Function(_Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_NoCityReported value)? noCityReported,
    TResult? Function(_NoInternetAccess value)? noInternetAccess,
    TResult? Function(_Unexpected value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotFound value)? notFound,
    TResult Function(_NoCityReported value)? noCityReported,
    TResult Function(_NoInternetAccess value)? noInternetAccess,
    TResult Function(_Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected extends CityFailure {
  const factory _Unexpected() = _$UnexpectedImpl;
  const _Unexpected._() : super._();
}
