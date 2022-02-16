// Mocks generated by Mockito 5.0.16 from annotations
// in flutter_auth/test/features/email_auth/data/datasource/auth_remote_datasource_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i3;
import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i7;
import 'package:flutter_facebook_auth_platform_interface/flutter_facebook_auth_platform_interface.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFirebaseApp_0 extends _i1.Fake implements _i2.FirebaseApp {}

class _FakeActionCodeInfo_1 extends _i1.Fake implements _i3.ActionCodeInfo {}

class _FakeUserCredential_2 extends _i1.Fake implements _i4.UserCredential {}

class _FakeConfirmationResult_3 extends _i1.Fake
    implements _i4.ConfirmationResult {}

class _FakeLoginResult_4 extends _i1.Fake implements _i5.LoginResult {}

class _FakeUserMetadata_5 extends _i1.Fake implements _i3.UserMetadata {}

class _FakeIdTokenResult_6 extends _i1.Fake implements _i3.IdTokenResult {}

class _FakeUser_7 extends _i1.Fake implements _i4.User {}

/// A class which mocks [FirebaseAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuth extends _i1.Mock implements _i4.FirebaseAuth {
  MockFirebaseAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_0()) as _i2.FirebaseApp);
  @override
  set app(_i2.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  set tenantId(String? tenantId) =>
      super.noSuchMethod(Invocation.setter(#tenantId, tenantId),
          returnValueForMissingStub: null);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i6.Future<void> useEmulator(String? origin) =>
      (super.noSuchMethod(Invocation.method(#useEmulator, [origin]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> useAuthEmulator(String? host, int? port) =>
      (super.noSuchMethod(Invocation.method(#useAuthEmulator, [host, port]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> applyActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#applyActionCode, [code]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.ActionCodeInfo> checkActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#checkActionCode, [code]),
              returnValue:
                  Future<_i3.ActionCodeInfo>.value(_FakeActionCodeInfo_1()))
          as _i6.Future<_i3.ActionCodeInfo>);
  @override
  _i6.Future<void> confirmPasswordReset({String? code, String? newPassword}) =>
      (super.noSuchMethod(
          Invocation.method(#confirmPasswordReset, [],
              {#code: code, #newPassword: newPassword}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i4.UserCredential> createUserWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#createUserWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<List<String>> fetchSignInMethodsForEmail(String? email) => (super
          .noSuchMethod(Invocation.method(#fetchSignInMethodsForEmail, [email]),
              returnValue: Future<List<String>>.value(<String>[]))
      as _i6.Future<List<String>>);
  @override
  _i6.Future<_i4.UserCredential> getRedirectResult() =>
      (super.noSuchMethod(Invocation.method(#getRedirectResult, []),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  bool isSignInWithEmailLink(String? emailLink) => (super.noSuchMethod(
      Invocation.method(#isSignInWithEmailLink, [emailLink]),
      returnValue: false) as bool);
  @override
  _i6.Stream<_i4.User?> authStateChanges() =>
      (super.noSuchMethod(Invocation.method(#authStateChanges, []),
          returnValue: Stream<_i4.User?>.empty()) as _i6.Stream<_i4.User?>);
  @override
  _i6.Stream<_i4.User?> idTokenChanges() =>
      (super.noSuchMethod(Invocation.method(#idTokenChanges, []),
          returnValue: Stream<_i4.User?>.empty()) as _i6.Stream<_i4.User?>);
  @override
  _i6.Stream<_i4.User?> userChanges() =>
      (super.noSuchMethod(Invocation.method(#userChanges, []),
          returnValue: Stream<_i4.User?>.empty()) as _i6.Stream<_i4.User?>);
  @override
  _i6.Future<void> sendPasswordResetEmail(
          {String? email, _i3.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPasswordResetEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> sendSignInLinkToEmail(
          {String? email, _i3.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignInLinkToEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setLanguageCode(String? languageCode) =>
      (super.noSuchMethod(Invocation.method(#setLanguageCode, [languageCode]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setSettings(
          {bool? appVerificationDisabledForTesting,
          String? userAccessGroup,
          String? phoneNumber,
          String? smsCode,
          bool? forceRecaptchaFlow}) =>
      (super.noSuchMethod(
          Invocation.method(#setSettings, [], {
            #appVerificationDisabledForTesting:
                appVerificationDisabledForTesting,
            #userAccessGroup: userAccessGroup,
            #phoneNumber: phoneNumber,
            #smsCode: smsCode,
            #forceRecaptchaFlow: forceRecaptchaFlow
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setPersistence(_i3.Persistence? persistence) =>
      (super.noSuchMethod(Invocation.method(#setPersistence, [persistence]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i4.UserCredential> signInAnonymously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, []),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithCredential, [credential]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithCustomToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#signInWithCustomToken, [token]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithEmailLink(
          {String? email, String? emailLink}) =>
      (super.noSuchMethod(
          Invocation.method(
              #signInWithEmailLink, [], {#email: email, #emailLink: emailLink}),
          returnValue:
              Future<_i4.UserCredential>.value(_FakeUserCredential_2())) as _i6
          .Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.ConfirmationResult> signInWithPhoneNumber(String? phoneNumber,
          [_i4.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithPhoneNumber, [phoneNumber, verifier]),
          returnValue: Future<_i4.ConfirmationResult>.value(
              _FakeConfirmationResult_3())) as _i6
          .Future<_i4.ConfirmationResult>);
  @override
  _i6.Future<_i4.UserCredential> signInWithPopup(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithPopup, [provider]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<void> signInWithRedirect(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithRedirect, [provider]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> verifyPasswordResetCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#verifyPasswordResetCode, [code]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<void> verifyPhoneNumber(
          {String? phoneNumber,
          _i3.PhoneVerificationCompleted? verificationCompleted,
          _i3.PhoneVerificationFailed? verificationFailed,
          _i3.PhoneCodeSent? codeSent,
          _i3.PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout,
          String? autoRetrievedSmsCodeForTesting,
          Duration? timeout = const Duration(seconds: 30),
          int? forceResendingToken}) =>
      (super.noSuchMethod(
          Invocation.method(#verifyPhoneNumber, [], {
            #phoneNumber: phoneNumber,
            #verificationCompleted: verificationCompleted,
            #verificationFailed: verificationFailed,
            #codeSent: codeSent,
            #codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
            #autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
            #timeout: timeout,
            #forceResendingToken: forceResendingToken
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [FacebookAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFacebookAuth extends _i1.Mock implements _i7.FacebookAuth {
  MockFacebookAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i5.AccessToken?> get accessToken =>
      (super.noSuchMethod(Invocation.getter(#accessToken),
              returnValue: Future<_i5.AccessToken?>.value())
          as _i6.Future<_i5.AccessToken?>);
  @override
  _i6.Future<_i5.FacebookPermissions?> get permissions =>
      (super.noSuchMethod(Invocation.getter(#permissions),
              returnValue: Future<_i5.FacebookPermissions?>.value())
          as _i6.Future<_i5.FacebookPermissions?>);
  @override
  bool get isWebSdkInitialized =>
      (super.noSuchMethod(Invocation.getter(#isWebSdkInitialized),
          returnValue: false) as bool);
  @override
  _i6.Future<bool> get isAutoLogAppEventsEnabled =>
      (super.noSuchMethod(Invocation.getter(#isAutoLogAppEventsEnabled),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i5.LoginResult> expressLogin() =>
      (super.noSuchMethod(Invocation.method(#expressLogin, []),
              returnValue: Future<_i5.LoginResult>.value(_FakeLoginResult_4()))
          as _i6.Future<_i5.LoginResult>);
  @override
  _i6.Future<Map<String, dynamic>> getUserData(
          {String? fields = r'name,email,picture.width(200)'}) =>
      (super.noSuchMethod(
              Invocation.method(#getUserData, [], {#fields: fields}),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i6.Future<Map<String, dynamic>>);
  @override
  _i6.Future<void> logOut() =>
      (super.noSuchMethod(Invocation.method(#logOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i5.LoginResult> login(
          {List<String>? permissions = const [r'email', r'public_profile'],
          _i5.LoginBehavior? loginBehavior = _i5.LoginBehavior.dialogOnly}) =>
      (super.noSuchMethod(
              Invocation.method(#login, [],
                  {#permissions: permissions, #loginBehavior: loginBehavior}),
              returnValue: Future<_i5.LoginResult>.value(_FakeLoginResult_4()))
          as _i6.Future<_i5.LoginResult>);
  @override
  void webInitialize(
          {String? appId, bool? cookie, bool? xfbml, String? version}) =>
      super.noSuchMethod(
          Invocation.method(#webInitialize, [], {
            #appId: appId,
            #cookie: cookie,
            #xfbml: xfbml,
            #version: version
          }),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> autoLogAppEventsEnabled(bool? enabled) => (super
      .noSuchMethod(Invocation.method(#autoLogAppEventsEnabled, [enabled]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UserCredential].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCredential extends _i1.Mock implements _i4.UserCredential {
  MockUserCredential() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i4.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified =>
      (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
          as bool);
  @override
  bool get isAnonymous =>
      (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
          as bool);
  @override
  _i3.UserMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeUserMetadata_5()) as _i3.UserMetadata);
  @override
  List<_i3.UserInfo> get providerData =>
      (super.noSuchMethod(Invocation.getter(#providerData),
          returnValue: <_i3.UserInfo>[]) as List<_i3.UserInfo>);
  @override
  String get uid =>
      (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
  @override
  _i6.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i3.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
              returnValue:
                  Future<_i3.IdTokenResult>.value(_FakeIdTokenResult_6()))
          as _i6.Future<_i3.IdTokenResult>);
  @override
  _i6.Future<_i4.UserCredential> linkWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> linkWithPopup(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
          [_i4.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
              Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
              returnValue: Future<_i4.ConfirmationResult>.value(
                  _FakeConfirmationResult_3()))
          as _i6.Future<_i4.ConfirmationResult>);
  @override
  _i6.Future<_i4.UserCredential> reauthenticateWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#reauthenticateWithCredential, [credential]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> sendEmailVerification(
          [_i3.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailVerification, [actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i4.User> unlink(String? providerId) =>
      (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
              returnValue: Future<_i4.User>.value(_FakeUser_7()))
          as _i6.Future<_i4.User>);
  @override
  _i6.Future<void> updateEmail(String? newEmail) =>
      (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updatePassword(String? newPassword) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updatePhoneNumber(
          _i3.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
          Invocation.method(#updatePhoneNumber, [phoneCredential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updatePhotoURL(String? photoURL) =>
      (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> updateProfile({String? displayName, String? photoURL}) =>
      (super.noSuchMethod(
          Invocation.method(#updateProfile, [],
              {#displayName: displayName, #photoURL: photoURL}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> verifyBeforeUpdateEmail(String? newEmail,
          [_i3.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(
              #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}
