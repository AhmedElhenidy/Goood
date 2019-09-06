class SliderModel {
    String created_at;
    int id;
    String image;
    String imageLink;
    String updated_at;

    SliderModel({this.created_at, this.id, this.image, this.imageLink, this.updated_at});

    factory SliderModel.fromJson(Map<String, dynamic> json) {
        return SliderModel(
            created_at: json['created_at'],
            id: json['id'],
            image: json['image'],
            imageLink: json['imageLink'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['image'] = this.image;
        data['imageLink'] = this.imageLink;
        data['updated_at'] = this.updated_at;
        return data;
    }
}
class SliderServerResponse{
  List<SliderModel> sliderList;
  SliderModel slider ;
  bool errors;
  String messages ;
  SliderServerResponse({this.sliderList,this.errors,this.messages,this.slider});
  factory SliderServerResponse.fromJson(Map<String, dynamic> json) {
    return SliderServerResponse(
      errors: json['errors'],
      messages: json['message_ar'],
      slider: json['Slider']!=null?SliderModel.fromJson(json['Slider']):null,
      sliderList: json['Sliders'] != null ? (json['Sliders'] as List).map((i) => SliderModel.fromJson(i)).toList() : null,
    );
  }
}