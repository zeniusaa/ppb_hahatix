part of 'services.dart';

class UserServices {
  static final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    await _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name ?? "",
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? "",
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(
      id,
      snapshot['email'],
      name: snapshot['name'],
      balance: snapshot['balance'],
      profilePicture: snapshot['profilePicture'],
      selectedGenres: List<String>.from(snapshot['selectedGenres']),
      selectedLanguage: snapshot['selectedLanguage'],
    );
  }
}
