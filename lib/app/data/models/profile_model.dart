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
    String? imagePath,
  })  : id = RxString(id ?? DateTime.now().millisecondsSinceEpoch.toString()),
        name = RxString(name.trim()),
        phone = RxString(phone.trim()),
        email = RxString(email.trim()),
        imagePath = RxString(imagePath ?? '');

  // Convert Profile object to a Map
  Map<String, dynamic> toJson() => {
        'id': id.value,
        'name': name.value,
        'phone': phone.value,
        'email': email.value,
        'imagePath': imagePath.value,
      };

  // Create a Profile object from a Map
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id']?.toString(),
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      imagePath: json['imagePath']?.toString(),
    );
  }

  // Create an empty Profile
  factory Profile.empty() => Profile(
        name: '',
        phone: '',
        email: '',
      );

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

  @override
  String toString() => 'Profile(id: ${id.value}, name: ${name.value}, '
      'phone: ${phone.value}, email: ${email.value}, '
      'imagePath: ${imagePath.value})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Profile &&
        other.id.value == id.value &&
        other.name.value == name.value &&
        other.phone.value == phone.value &&
        other.email.value == email.value &&
        other.imagePath.value == imagePath.value;
  }

  @override
  int get hashCode => Object.hash(
        id.value,
        name.value,
        phone.value,
        email.value,
        imagePath.value,
      );
}