import "package:test/test.dart";

import 'package:mockito/mockito.dart';
import 'package:core/core.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  AuthenticationBloc authenticationBloc;
  MockUserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  });

  test('initial state is correct', () {
    expect(authenticationBloc.initialState, AuthenticationUninitialized());
  });

  test('dispose does not emit new states', () {
    expectLater(
      authenticationBloc.state,
      emitsInOrder([]),
    );
    authenticationBloc.dispose();
  });

  group('AppStarted', () {
    test('emits [uninitialized, unauthenticated] for invalid token', () {
      final expectedResponse = [
        AuthenticationUninitialized(),
        AuthenticationUnauthenticated()
      ];

      when(userRepository.hasToken()).thenAnswer((_) => Future.value(false));

      expectLater(
        authenticationBloc.state,
        emitsInOrder(expectedResponse),
      );

      authenticationBloc.dispatch(AppStarted());
    });
  });

  group('LoggedIn', () {
    test(
        'emits [uninitialized, loading, authenticated] when token is persisted',
        () {
      final expectedResponse = [
        AuthenticationUninitialized(),
        AuthenticationLoading(),
        AuthenticationAuthenticated(),
      ];

      expectLater(
        authenticationBloc.state,
        emitsInOrder(expectedResponse),
      );

      authenticationBloc.dispatch(LoggedIn(
        token: 'instance.token',
      ));
    });
  });

  group('LoggedOut', () {
    test(
        'emits [uninitialized, loading, unauthenticated] when token is deleted',
        () {
      final expectedResponse = [
        AuthenticationUninitialized(),
        AuthenticationLoading(),
        AuthenticationUnauthenticated(),
      ];

      expectLater(
        authenticationBloc.state,
        emitsInOrder(expectedResponse),
      );

      authenticationBloc.dispatch(LoggedOut());
    });
  });
}