import 'details.dart';

class AmoutModel {
  final String? total;
  final String? currency;
  Details? details;

  AmoutModel({ required this.total, required this.currency, this.details});

  factory AmoutModel.fromJson(Map<String, dynamic> json) => AmoutModel(
        total: json['total'] as String?,
        currency: json['currency'] as String?,
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
