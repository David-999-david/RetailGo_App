class StripeModel {
  final String clientSecret;

  const StripeModel({required this.clientSecret});

  factory StripeModel.fromJson(Map<String,dynamic> json){
    return StripeModel(clientSecret: json['client_secret']);
  }
}