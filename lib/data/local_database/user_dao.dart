import 'dart:developer';
import 'package:drift/drift.dart';
import 'package:realproject/data/local_database/user_table.dart';
import 'app_database.dart';
part 'user_dao.g.dart';
@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  final AppDatabase db;
  UserDao(this.db) : super(db);

  Future<User?> getUserById(int userId) async {
    try {
      return (select(users)..where((u) => u.id.equals(userId))).getSingleOrNull();
    } catch (e) {
      log('Error getting user by ID: $e');
      return null;
    }
  }

  Future<List<User>> getAllUsers() async {
    try {
      return select(users).get();
    } catch (e) {
      log('Error getting all users: $e');
      return [];
    }
  }

  Stream<List<User>> watchAllUsers() {
    try {
      return select(users).watch();
    } catch (e) {
      log('Error watching all users: $e');
      return Stream.empty();
    }
  }

  Future<int> insertUser(UsersCompanion user) async {
    try {
      return into(users).insert(user);
    } catch (e) {
      log('Error inserting user: $e');
      return -1;
    }
  }

  Future<int> updateUser(int userId, String newName) async {
    try {
      final updateCount = await (update(users)..where((u) => u.id.equals(userId)))
          .write(UsersCompanion(fullName: Value(newName)));
      log('Number of rows updated: $updateCount');
      return updateCount;
    } catch (e) {
      log('Error updating user: $e');
      return -1;
    }
  }

  Future<int> deleteUser(User user) async {
    try {
      return delete(users).delete(user);
    } catch (e) {
      log('Error deleting user: $e');
      return -1;
    }
  }

  Future<int> insertWatchlist(int userId, String watchlist) async {
    try {
      final user = await getUserById(userId);
      if (user != null) {
        String updatedWatchlist = user.createWatchlist == null
            ? watchlist
            : '${user.createWatchlist},$watchlist';
        final updateCount = await (update(users)..where((u) => u.id.equals(userId)))
            .write(UsersCompanion(createWatchlist: Value(updatedWatchlist)));
        log('Watchlist added for user ID $userId');
        return updateCount;
      }
      return -1;
    } catch (e) {
      log('Error adding watchlist: $e');
      return -1;
    }
  }

  Future<List<String>> getWatchlistsForUser(int userId) async {
    try {
      final user = await getUserById(userId);
      if (user != null && user.createWatchlist != null) {
        return user.createWatchlist!.split(',');
      }
      return [];
    } catch (e) {
      log('Error getting watchlists for user: $e');
      return [];
    }
  }
}
