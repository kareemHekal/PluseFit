// Mocks generated by Mockito 5.4.5 from annotations
// in fit_zone/test/domain/use_cases/register_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fit_zone/core/api/api_result.dart' as _i4;
import 'package:fit_zone/data/model/register_response/register_response.dart'
    as _i5;
import 'package:fit_zone/data/model/register_response/register_user_model.dart'
    as _i6;
import 'package:fit_zone/domain/repo_contract/register_repo.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [RegisterRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterRepo extends _i1.Mock implements _i2.RegisterRepo {
  MockRegisterRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ApiResult<_i5.RegisterResponse>> register(
          {required _i6.RegisterUserModel? userModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {#userModel: userModel},
        ),
        returnValue: _i3.Future<_i4.ApiResult<_i5.RegisterResponse>>.value(
            _i7.dummyValue<_i4.ApiResult<_i5.RegisterResponse>>(
          this,
          Invocation.method(
            #register,
            [],
            {#userModel: userModel},
          ),
        )),
      ) as _i3.Future<_i4.ApiResult<_i5.RegisterResponse>>);
}
