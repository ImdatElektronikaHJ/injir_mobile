class Account {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Account({this.firstName, this.lastName, this.email, this.phone});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        firstName: json['firstname'],
        lastName: json['lastname'],
        email: json['email'],
        phone: json['telephone']);
  }

  Map<String, dynamic> toJson() => {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'telephone': phone,
      };

  factory Account.dummy() {
    return Account(
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
    );
  }
}
