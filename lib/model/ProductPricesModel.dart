class ProductPriceModel {
    List<Product> products;

    ProductPriceModel({this.products});

    factory ProductPriceModel.fromJson(Map<String, dynamic> json) {
        return ProductPriceModel(
            products: json['Products'] != null ? (json['Products'] as List).map((i) => Product.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.products != null) {
            data['Products'] = this.products.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Product {
    String created_at;
    int id;
    String price;
    String updated_at;

    Product({this.created_at, this.id, this.price, this.updated_at});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            created_at: json['created_at'],
            id: json['id'],
            price: json['price'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['price'] = this.price;
        data['updated_at'] = this.updated_at;
        return data;
    }
}