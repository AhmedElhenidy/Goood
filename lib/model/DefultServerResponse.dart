class DefultServerResponse {
    bool errors;
    String message;
    int amount ;

    DefultServerResponse({this.errors, this.message ,this.amount});

    factory DefultServerResponse.fromJson(Map<String, dynamic> json) {
        return DefultServerResponse(
            errors: json['errors'], 
            message: json['message_ar'],
            amount: json['amount'] != null ? int.parse("${json['amount']}") : 0
        );
    }


}