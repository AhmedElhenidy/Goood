import 'dart:convert';

class ProductModel {
    String created_at;
    int id;
    String price;
    String updated_at;
    String quantity ;
    ProductModel({this.created_at, this.id, this.price,this.quantity ,this.updated_at});
    factory ProductModel.fromJson(Map<String, dynamic> json) {
        return ProductModel(
            created_at: json['created_at'],
            id: json['id'],
            price: json['price'],
            updated_at: json['updated_at'],
            quantity: "${json['quantity']}"
        );
    }
    Map<String, dynamic> toJson() {
        final Map<String, String> data = new Map<String, String>();
        data['created_at'] = this.created_at;
        data['id'] = this.id.toString();
        data['price'] = this.price;
        data['updated_at'] = this.updated_at;
        return data;
    }
}
class GetAllPricesServerResponse{
  List<ProductModel> productList;
  GetAllPricesServerResponse({this.productList});
  factory GetAllPricesServerResponse.fromJson(Map<String, dynamic> json) {
    return GetAllPricesServerResponse(
      productList: json['Products'] != null ? (json['Products'] as List).map((i) => ProductModel.fromJson(i)).toList() : null,
    );
  }

  Map<String ,String >toJson(){
    final Map<String, String> data = new Map<String, String>();
    if(this.productList!=null)
    data['Products'] = json.encode(this.productList.map((v) => v.toJson()).toList());

    return data ;
  }
}