class Country {
  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;

  Country({this.id, this.code, this.name, this.createdAt, this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class LoginModel {
  String? token;
  UserModel? user;

  LoginModel({this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? name;
  String? title;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.name, this.title, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? username;
  int? roleId;
  String? email;
  String? phone;
  int? countryId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? skillId;
  String? deletedAt;
  String? college;
  String? aboutMe;
  String? dob;
  String? gender;
  int? isActive;
  String? imageUrl;
  Country? country;
  Role? role;
  String? image;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.roleId,
      this.email,
      this.phone,
      this.countryId,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.skillId,
      this.deletedAt,
      this.college,
      this.aboutMe,
      this.dob,
      this.gender,
      this.isActive,
      this.imageUrl,
      this.country,
      this.role,
      this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    roleId = json['role_id'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    skillId = json['skill_id'];
    deletedAt = json['deleted_at'];
    college = json['college'];
    aboutMe = json['about_me'];
    dob = json['dob'];
    gender = json['gender'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['role_id'] = roleId;
    data['email'] = email;
    data['phone'] = phone;
    data['country_id'] = countryId;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['skill_id'] = skillId;
    data['deleted_at'] = deletedAt;
    data['college'] = college;
    data['about_me'] = aboutMe;
    data['dob'] = dob;
    data['gender'] = gender;
    data['is_active'] = isActive;
    data['image_url'] = imageUrl;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['image'] = image;
    return data;
  }
}
