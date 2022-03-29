// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productDetail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailStore on _ProductDetailStoreBase, Store {
  final _$colorBlendAtom = Atom(name: '_ProductDetailStoreBase.colorBlend');

  @override
  Color get colorBlend {
    _$colorBlendAtom.reportRead();
    return super.colorBlend;
  }

  @override
  set colorBlend(Color value) {
    _$colorBlendAtom.reportWrite(value, super.colorBlend, () {
      super.colorBlend = value;
    });
  }

  final _$animatedAtom = Atom(name: '_ProductDetailStoreBase.animated');

  @override
  bool get animated {
    _$animatedAtom.reportRead();
    return super.animated;
  }

  @override
  set animated(bool value) {
    _$animatedAtom.reportWrite(value, super.animated, () {
      super.animated = value;
    });
  }

  @override
  String toString() {
    return '''
colorBlend: ${colorBlend},
animated: ${animated}
    ''';
  }
}
