import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../lib/core/exceptions/exception.dart';
import '../../../../../lib/features/email_auth/data/model/user_model.dart';
import '../../../../../lib/features/email_auth/data/datasource/auth_remote_datasource.dart';
import 'auth_remote_datasource_test.mocks.dart';

@GenerateMocks([FirebaseAuth])
@GenerateMocks([FacebookAuth])
@GenerateMocks([UserCredential])
@GenerateMocks([User])
void main() async {
  group('SigIn', () {
    final mockFirebaseAuth = MockFirebaseAuth();
    final mockFacebookAuth = MockFacebookAuth();
    final mockUserCredential = MockUserCredential();
    final mockUser = MockUser();
    group('withEmailAndPassword', () {


      group('with valid credentials', () {
        when(mockFirebaseAuth.signInWithEmailAndPassword(email: 'olawale@test.com', password: 'password'))
            .thenAnswer((_) {
          return Future<MockUserCredential>.value(mockUserCredential);
        });

        when(mockUserCredential.user).thenAnswer((_) => mockUser);

        when(mockUser.email).thenAnswer((_) => 'olawale@test.com');
        when(mockUser.displayName).thenAnswer((_) => 'olawale');

        test('it should return email olawale@test.com', () async {
          AuthRemoteDataSourceImpl authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(firebaseAuth: mockFirebaseAuth, facebookAuth: mockFacebookAuth);
          final UserModel userModel = await authRemoteDataSourceImpl.logIn("olawale@test.com", "password");
          expect(userModel.user?.email, 'olawale@test.com');
        });
        test('it should return displayName olawale', () async {
          AuthRemoteDataSourceImpl authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(firebaseAuth: mockFirebaseAuth, facebookAuth: mockFacebookAuth);
          final UserModel userModel = await authRemoteDataSourceImpl.logIn("olawale@test.com", "password");
          expect(userModel.user?.displayName, 'olawale');
        });
      });

      group('with invalid credentials', () {
        when(mockFirebaseAuth.signInWithEmailAndPassword(email: 'email@test.com', password: 'password'))
            .thenAnswer((_) => throw AuthException('email does not exist'));

        when(mockFirebaseAuth.signInWithEmailAndPassword(email: 'olawale@test.com', password: 'pass'))
            .thenAnswer((_) => throw AuthException('Wrong password'));


        test('it should throw an exception', () async {
          AuthRemoteDataSourceImpl authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(firebaseAuth: mockFirebaseAuth, facebookAuth: mockFacebookAuth);
          final future = authRemoteDataSourceImpl.logIn("email@test.com", "password");
          await expectLater(future, throwsA(isA<Exception>()));
          // expect(authRemoteDataSourceImpl.logIn("email@test.com", "password"), throwsA(isA<Exception>()));
        });
        test('it should throw an exception', () async {
          AuthRemoteDataSourceImpl authRemoteDataSourceImpl = AuthRemoteDataSourceImpl(firebaseAuth: mockFirebaseAuth, facebookAuth: mockFacebookAuth);
          final future = authRemoteDataSourceImpl.logIn("olawale@test.com", "pass");
          await expectLater(future, throwsA(isA<Exception>()));
        });

      });
    });

    group('withCredentials', () {

    });

  });
}
