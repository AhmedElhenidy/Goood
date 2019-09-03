import 'dart:convert';
class OrderToSent {
    String price;
    List<Product> productList;
    OrderToSent({this.price, this.productList});
    factory OrderToSent.fromJson(Map<String, dynamic> json) {
        return OrderToSent(
            price: json['price'],
            productList: json['productList'] != null ? (json['productList'] as List).map((i) => Product.fromJson(i)).toList() : null,
        );
    }
    Map<String, String> toJson() {
        final Map<String, String> data = new Map<String, String>();
        data['price'] = this.price;
        if (this.productList != null) {
            data['productList'] = json.encode(this.productList.map((v) => v.toJson()).toList());
        }
        return data;
    }
}
class Product {
    String id;
    List<Spacifcation> spacifcation;
    String qty ;
    Product({this.id, this.qty,this.spacifcation});
    factory Product.fromJson(Map<String, String> json) {
        return Product(
            id: json['id'],
            spacifcation: json['spacifcation'] != null ? (json['spacifcation'] as List).map((i) => Spacifcation.fromJson(i)).toList() : null,
        );
    }
    Map<String, String> toJson() {
        final Map<String, String> data = new Map<String, String>();
        data['id'] = this.id;
        data['quantity'] = this.qty;
        if (this.spacifcation != null) {
            data['spacifcation'] = json.encode(this.spacifcation.map((v) => v.toJson()).toList());
        }
        return data;
    }
}
class Spacifcation {
    String key;
    String value;
    Spacifcation({this.key, this.value});
    factory Spacifcation.fromJson(Map<String, dynamic> json) {
        return Spacifcation(
            key: json['key'],
            value: json['value'],
        );
    }
    Map<String, String> toJson() {
        final Map<String, String> data = new Map<String, String>();
        data['key'] = this.key;
        data['value'] = this.value;
        return data;
    }
}