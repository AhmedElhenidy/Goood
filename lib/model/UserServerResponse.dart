import 'User.dart';

class UserServerResponse {
    bool errors;
    String message;
    String message_ar;
    User user;

    UserServerResponse({this.errors, this.message, this.message_ar, this.user});

    factory UserServerResponse.fromJson(Map<String, dynamic> json) {
        return UserServerResponse(
            errors: json['errors'], 
            message: json['message'], 
            message_ar: json['message_ar'], 
            user: json['User'] != null ? User.fromJson(json['User']) : null,
        );
    }

}