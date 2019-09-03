class Driver{
    String created_at;
    int id;
    String name;
    String phone;
    String updated_at;
    Driver({this.created_at, this.id, this.name, this.phone, this.updated_at});
    factory Driver.fromJson(Map<String, dynamic> json) {
        return Driver(
            created_at: json['created_at'],
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            updated_at: json['updated_at'],
        );
    }
}
class DriverOperationsServerResponse{
  List<Driver> driverList;
  Driver driver;
  bool errors;
  String messages;
  DriverOperationsServerResponse({this.errors,this.driver,this.messages,this.driverList});
  factory DriverOperationsServerResponse.fromJson(Map<String, dynamic> json) {
    return DriverOperationsServerResponse(
      errors: json['errors'],
      messages: json['message_ar'],
      driver: json['driver']!=null ?Driver.fromJson(json['driver']):null,
      driverList: json['drivers'] != null ? (json['drivers'] as List).map((i) => Driver.fromJson(i)).toList() : null,
    );
  }
}