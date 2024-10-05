import 'package:get/get.dart';

class Profile {
  final RxString id;
  final RxString name;
  final RxString phone;
  final RxString email;
  final RxString imagePath;

  Profile({
    String? id,
    required String name,
    required String phone,
    required String email,
    String imagePath = '',
  })  : id = RxString(id ?? DateTime.now().millisecondsSinceEpoch.toString()),
        name = RxString(name),
        phone = RxString(phone),
        email = RxString(email),
        imagePath = RxString(imagePath);

  // Convert Profile object to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id.value,
      'name': name.value,
      'phone': phone.value,
      'email': email.value,
      'imagePath': imagePath.value,
    };
  }

  // Create a Profile object from a Map
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      imagePath: json['imagePath'],
    );
  }

  // Create a copy of the Profile object with updated fields
  Profile copyWith({
    String? name,
    String? phone,
    String? email,
    String? imagePath,
  }) {
    return Profile(
      id: id.value,
      name: name ?? this.name.value,
      phone: phone ?? this.phone.value,
      email: email ?? this.email.value,
      imagePath: imagePath ?? this.imagePath.value,
    );
  }
}
