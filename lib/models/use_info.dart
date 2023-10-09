
UserInfoDto userInfoFromJson(dynamic str){
  Map<String, dynamic> data = str;
  return UserInfoDto.fromJson(data);
}
class UserInfoDto {
    final int userId;
    final String userName;
    final String firstName;
    final String lastName;
    final String email;
    final List<Role> roles;

    UserInfoDto({
        required this.userId,
        required this.userName,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.roles,
    });

    UserInfoDto copyWith({
        int? userId,
        String? userName,
        String? firstName,
        String? lastName,
        String? email,
        List<Role>? roles,
    }) => 
        UserInfoDto(
            userId: userId ?? this.userId,
            userName: userName ?? this.userName,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            roles: roles ?? this.roles,
        );

    factory UserInfoDto.fromJson(Map<String, dynamic> json) => UserInfoDto(
        userId: json["userId"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    };
}

class Role {
    final int roleId;
    final String roleName;

    Role({
        required this.roleId,
        required this.roleName,
    });

    Role copyWith({
        int? roleId,
        String? roleName,
    }) => 
        Role(
            roleId: roleId ?? this.roleId,
            roleName: roleName ?? this.roleName,
        );

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleId"],
        roleName: json["roleName"],
    );

    Map<String, dynamic> toJson() => {
        "roleId": roleId,
        "roleName": roleName,
    };
}
