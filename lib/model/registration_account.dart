class RegistrationAccount {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  // String? confirmPassword;
  String? telephone;
  String? city;
  String? address;
  String? addressOptional;
  int taxId;
  int? countryId;
  int? zoneId;
  int customerGroupId;
  int newsletter;
  int agree;
  RegistrationAccount({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    // this.confirmPassword,
    this.telephone,
    this.city,
    this.taxId = 1,
    this.address,
    this.addressOptional,
    this.countryId = 216,
    this.zoneId = 3396,
    this.customerGroupId = 1,
    this.agree = 1,
    this.newsletter = 1,
  });

  Map<String?, dynamic> toJson() => {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
        'confirm': password,
        'telephone': '$telephone',
        // 'city': city,
        // 'address_1': address,
        // 'address_2': addressOptional,
        'country_id': countryId,
        'zone_id': zoneId,
        'customer_group_id': customerGroupId,
        'tax_id': taxId,
        'agree': agree,
        'default': 1
      };
}
