/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/data/data_sources/interfaces/i_remote_user_data_source.dart';
import 'package:core/data/mappers/app/user_mapper.dart';
import 'package:core/data/utils/fire_constants/firestore_collections.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:rxdart/rxdart.dart';

final class FireStoreUserDataSource implements IRemoteUserDataSource {
  FireStoreUserDataSource() {
    _connectionSubject.add(true);
  }

  final _fireInstance = FirebaseFirestore.instance;

  final BehaviorSubject<User> _userSubject = BehaviorSubject.seeded(
    const User.unauthorized(),
  );

  final BehaviorSubject<bool> _connectionSubject = BehaviorSubject();

  @override
  Future<void> addUser(User user) async {
    try {
      final collection = _fireInstance.collection(FireStoreCollections.users);

      collection
          .doc(user.uuid)
          .set(
            UserMapper().toJson(user),
          )
          .whenComplete(() => _userSubject.add(user));

      CoreLogger.infoLog(
        'FireStore user was updated successfully',
        params: {
          'New user': user,
        },
      );
    } catch (e) {
      CoreLogger.errorLog(
        'FireStore user update error',
        params: {'Stacktrace': e},
      );

      return;
    }
  }

  @override
  void clearUser() {
    _userSubject.add(
      const User.unauthorized(),
    );
  }

  @override
  Future<User> fetchUser(String userUuid) async {
    try {
      final collection = _fireInstance.collection(FireStoreCollections.users);

      final userSnapshot = await collection.doc(userUuid).get();

      final userJson = userSnapshot.data();

      if (userJson == null) {
        CoreLogger.infoLog(
          'User with this uuid ($userUuid) was not found',
        );

        _userSubject.add(const User.unfounded());

        return const User.unfounded();
      } else {
        final userObject = UserMapper().fromJson(userJson);

        _userSubject.add(userObject);

        CoreLogger.infoLog('Successful fetching user');

        return userObject;
      }

      return User(uuid: '-1', phoneNumber: '');
    } catch (e) {
      CoreLogger.errorLog(
        'User with uuid: $userUuid does not exist',
        params: {'Params': e},
      );

      _userSubject.add(const User.unauthorized());

      return const User.unauthorized();
    }
  }

  @override
  Future<User> fetchUserByPhone(String phoneNumber) async {
    try {
      final collection = _fireInstance.collection(FireStoreCollections.users);

      final querySnapshot =
          await collection.where('phone_number', isEqualTo: phoneNumber).get();

      final userSnapshot = querySnapshot.docs.firstOrNull;

      if (userSnapshot == null) {
        CoreLogger.infoLog(
          'User with this phone number ($phoneNumber) was not found',
        );

        _userSubject.add(const User.unfounded());

        return const User.unfounded();
      } else {
        final userObject = UserMapper().fromJson(userSnapshot.data());

        _userSubject.add(userObject);

        CoreLogger.infoLog('Successful fetching user');

        return userObject;
      }

      return User(uuid: '-1', phoneNumber: '');
    } catch (e) {
      CoreLogger.errorLog(
        'User with phone number: $phoneNumber does not exist',
        params: {'Params': ''},
      );

      _userSubject.add(const User.unauthorized());

      return const User.unauthorized();
    }
  }

  @override
  Stream<bool> get remoteConnectionStream => _connectionSubject;

  @override
  Future<void> updateUser(User user) async {
    try {
      final collection = _fireInstance.collection(
        FireStoreCollections.users,
      );

      await collection.doc(user.uuid).update(UserMapper().toJson(user));

      _userSubject.add(user);

      CoreLogger.infoLog(
        'FireStore user was updated successfully',
        params: {
          'New user': user,
        },
      );
    } catch (e) {
      CoreLogger.errorLog(
        'FireStore user update error',
        params: {'Stacktrace': e},
      );

      return;
    }
  }

  @override
  User get userEntity => _userSubject.value;

  @override
  Stream<User> get userStream => _userSubject;

  @override
  String get userEmail => userEntity.emails![0];
}
*/
