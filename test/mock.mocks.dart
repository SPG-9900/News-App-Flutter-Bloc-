// Mocks generated by Mockito 5.4.4 from annotations
// in news/test/mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_bloc/flutter_bloc.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:news/blocs/article/article_bloc.dart' as _i8;
import 'package:news/blocs/article/article_event.dart' as _i9;
import 'package:news/blocs/article/article_state.dart' as _i3;
import 'package:news/blocs/category/category_bloc.dart' as _i11;
import 'package:news/blocs/category/category_event.dart' as _i12;
import 'package:news/blocs/category/category_state.dart' as _i4;
import 'package:news/models/article.dart' as _i6;
import 'package:news/repositories/news_repository.dart' as _i2;
import 'package:shared_preferences/src/shared_preferences_legacy.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNewsRepository_0 extends _i1.SmartFake
    implements _i2.NewsRepository {
  _FakeNewsRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeArticleState_1 extends _i1.SmartFake implements _i3.ArticleState {
  _FakeArticleState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCategoryState_2 extends _i1.SmartFake implements _i4.CategoryState {
  _FakeCategoryState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NewsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRepository extends _i1.Mock implements _i2.NewsRepository {
  MockNewsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i6.Article>> getArticles() => (super.noSuchMethod(
        Invocation.method(
          #getArticles,
          [],
        ),
        returnValue: _i5.Future<List<_i6.Article>>.value(<_i6.Article>[]),
      ) as _i5.Future<List<_i6.Article>>);

  @override
  _i5.Future<List<_i6.Article>> getArticlesByCategory(String? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArticlesByCategory,
          [category],
        ),
        returnValue: _i5.Future<List<_i6.Article>>.value(<_i6.Article>[]),
      ) as _i5.Future<List<_i6.Article>>);

  @override
  _i5.Future<_i6.Article?> getArticleById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getArticleById,
          [id],
        ),
        returnValue: _i5.Future<_i6.Article?>.value(),
      ) as _i5.Future<_i6.Article?>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i7.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(
          #getKeys,
          [],
        ),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) => (super.noSuchMethod(Invocation.method(
        #get,
        [key],
      )) as Object?);

  @override
  bool? getBool(String? key) => (super.noSuchMethod(Invocation.method(
        #getBool,
        [key],
      )) as bool?);

  @override
  int? getInt(String? key) => (super.noSuchMethod(Invocation.method(
        #getInt,
        [key],
      )) as int?);

  @override
  double? getDouble(String? key) => (super.noSuchMethod(Invocation.method(
        #getDouble,
        [key],
      )) as double?);

  @override
  String? getString(String? key) => (super.noSuchMethod(Invocation.method(
        #getString,
        [key],
      )) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getStringList,
        [key],
      )) as List<String>?);

  @override
  _i5.Future<bool> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> setStringList(
    String? key,
    List<String>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStringList,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [key],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(
          #commit,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(
          #reload,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [ArticleBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticleBloc extends _i1.Mock implements _i8.ArticleBloc {
  MockArticleBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NewsRepository get newsRepository => (super.noSuchMethod(
        Invocation.getter(#newsRepository),
        returnValue: _FakeNewsRepository_0(
          this,
          Invocation.getter(#newsRepository),
        ),
      ) as _i2.NewsRepository);

  @override
  _i3.ArticleState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeArticleState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.ArticleState);

  @override
  _i5.Stream<_i3.ArticleState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i3.ArticleState>.empty(),
      ) as _i5.Stream<_i3.ArticleState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i9.ArticleEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i9.ArticleEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i3.ArticleState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i9.ArticleEvent>(
    _i10.EventHandler<E, _i3.ArticleState>? handler, {
    _i10.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i10.Transition<_i9.ArticleEvent, _i3.ArticleState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void onChange(_i10.Change<_i3.ArticleState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [CategoryBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoryBloc extends _i1.Mock implements _i11.CategoryBloc {
  MockCategoryBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NewsRepository get newsRepository => (super.noSuchMethod(
        Invocation.getter(#newsRepository),
        returnValue: _FakeNewsRepository_0(
          this,
          Invocation.getter(#newsRepository),
        ),
      ) as _i2.NewsRepository);

  @override
  _i4.CategoryState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeCategoryState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.CategoryState);

  @override
  _i5.Stream<_i4.CategoryState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i5.Stream<_i4.CategoryState>.empty(),
      ) as _i5.Stream<_i4.CategoryState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void add(_i12.CategoryEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i12.CategoryEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i4.CategoryState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i12.CategoryEvent>(
    _i10.EventHandler<E, _i4.CategoryState>? handler, {
    _i10.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i10.Transition<_i12.CategoryEvent, _i4.CategoryState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void onChange(_i10.Change<_i4.CategoryState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
