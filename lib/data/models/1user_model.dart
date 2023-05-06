import 'package:hive/hive.dart';

part '1user_model.g.dart';

@HiveType(typeId: 0)
class UsersModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? country;
  @HiveField(4)
  bool? state;

  UsersModel({
    this.id,
    this.name,
    this.phone,
    this.country,
    this.state,
  });
  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
    country = json["country"];
    state = json["state"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'country': country,
      'state': state,
    };
  }
}
