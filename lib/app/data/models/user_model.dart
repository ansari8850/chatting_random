class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? subscription;
  final DateTime? subscriptionEndDate;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.subscription,
    this.subscriptionEndDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        profileImage: json['profile_image'],
        subscription: json['subscription'],
        subscriptionEndDate: json['subscription_end_date'] != null
            ? DateTime.parse(json['subscription_end_date'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'profile_image': profileImage,
        'subscription': subscription,
        'subscription_end_date': subscriptionEndDate?.toIso8601String(),
      };
}
