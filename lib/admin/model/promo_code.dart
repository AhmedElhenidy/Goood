class PromoCode {
    String amount;
    String codeName;
    String created_at;
    String endDate;
    int id;
    String startDate;
    String updated_at;
    PromoCode({this.amount, this.codeName, this.created_at, this.endDate, this.id, this.startDate, this.updated_at});
    factory PromoCode.fromJson(Map<String, dynamic> json) {
        return PromoCode(
            amount: json['amount'],
            codeName: json['codeName'],
            created_at: json['created_at'],
            endDate: json['endDate'],
            id: json['id'],
            startDate: json['startDate'],
            updated_at: json['updated_at'],
        );
    }
}
class PromoCodeServerResponse{
  PromoCode promo;
  bool errors;
  String messages;
  PromoCodeServerResponse({this.errors,this.promo,this.messages});
  factory PromoCodeServerResponse.fromJson(Map<String, dynamic> json) {
    return PromoCodeServerResponse(
      errors: json['errors'],
      messages: json['message_ar'],
      promo: json['promocode'],
    );
  }
}
class GetAllPromoCodeServerResponse{
  List<PromoCode> promoList;
  bool errors;
  String messages;
  GetAllPromoCodeServerResponse({this.errors,this.promoList,this.messages});
  factory GetAllPromoCodeServerResponse.fromJson(Map<String, dynamic> json) {
    return GetAllPromoCodeServerResponse(
      errors: json['errors'],
      messages: json['message_ar'],
      promoList: json['promocode'] != null ? (json['promocode'] as List).map((i) => PromoCode.fromJson(i)).toList() : null,
    );
  }
}