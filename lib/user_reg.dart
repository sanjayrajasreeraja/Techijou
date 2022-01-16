class UserModal {
  String? uid;
  String? email;
  String? username;

  UserModal({this.email, this.uid, this.username});

  factory UserModal.fromMap(map) {
    return UserModal(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "username": username,
    };
  }
}
