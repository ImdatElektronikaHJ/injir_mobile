class RegistrationAccount {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  String? confirmPassword;
  String? phone;
  int taxId;
  int customerGroupId;
  int newsletter;
  int agree;
  RegistrationAccount({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.taxId = 1,
    this.customerGroupId = 1,
    this.agree = 1,
    this.newsletter = 1,
  });

  Map<String?, dynamic> toJson() => {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
        'telephone': '$phone',
        'customer_group_id': customerGroupId,
        'tax_id': taxId,
        'agree': agree,
        'default': 1
      };
}
