class StripeModel {
  final String clientSecret;

  const StripeModel({required this.clientSecret});

  factory StripeModel.fromJson(Map<String,dynamic> json){
    final secret = json['clientSecret'] as String?;
    if (secret == null){
      throw FormatException('Missing clientSecret');
    }
    return StripeModel(clientSecret: secret);
  }
}