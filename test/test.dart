import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:psyco_space/app/utils/mock_data.dart';

abstract class MockBuildContext extends MockData implements BuildContext {}

final currentUser = MockUser(
  isAnonymous: false,
  uid: 'someUid',
  email: 'luisbruno123@gmail.com',
  displayName: 'Luis Bruno Monteiro',
  phoneNumber: 'somePhoneNumber',
  refreshToken: 'someLog',
);

void main() async {
  test('Verifica se o usuario já existe', () async {
    final auth = MockFirebaseAuth(signedIn: true, mockUser: currentUser);
    final user = auth.currentUser;
    expect(user, currentUser);
  });

  test('Verifica se o usuario fez signOut', () async {
    final auth = MockFirebaseAuth(signedIn: true, mockUser: currentUser);
    final user = auth.currentUser;
    // `If successful, it also updates any
    //[authStateChanges], [idTokenChanges] or [userChanges] stream listeners.`

    await auth.signOut();

    expect(auth.currentUser, isNull);
    expect(auth.authStateChanges(), emitsInOrder([user, null]));
    expect(auth.userChanges(), emitsInOrder([user, null]));
  });

  group('Ao iniciar, emite um usuário ', () {
    test('nulo vai ser retornado se ele ja tenha deslogado', () async {
      final auth = MockFirebaseAuth();
      expect(auth.authStateChanges(), emits(null));
    });
    test('se o usuario entrou', () async {
      final auth = MockFirebaseAuth(signedIn: true);
      expect(auth.authStateChanges(), emitsInOrder([isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([isA<User>()]));
    });
  });
}
