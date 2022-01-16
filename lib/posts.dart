class PostModal {
  String? username;
  String? image;
  String? caption;

  PostModal({this.image, this.caption, this.username});

  factory PostModal.fromMap(map) {
    return PostModal(
      image: map['image'],
      caption: map['caption'],
      username: map['username'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "image": image,
      "caption": caption,
      "username": username,
    };
  }
}
