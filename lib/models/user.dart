class User {
  num id;
  String email;
  String username;

  String firstname;
  String lastname;
  String password;
  String phone;
  Map address;

  User.fromJson(Map json)
      : username = json["username"],
        password = json["password"],
        id = json["id"],
        firstname = json["name"]["firstname"],
        lastname = json["name"]["lastname"],
        phone = json["phone"],
        address = json["address"];
}
