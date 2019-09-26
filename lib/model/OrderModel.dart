class OrderModel {
    bool errors;
    String message_ar;
    Order order;

    OrderModel({this.errors, this.message_ar, this.order});

    factory OrderModel.fromJson(Map<String, dynamic> json) {
        return OrderModel(
            errors: json['errors'],
            message_ar: json['message_ar'],
            order: json['order'] != null ? Order.fromJson(json['order']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['errors'] = this.errors;
        data['message_ar'] = this.message_ar;
        if (this.order != null) {
            data['order'] = this.order.toJson();
        }
        return data;
    }
}

class Order {
    String address;
    String created_at;
    int id;
    String lat;
    String lng;
    String name;
    String note;
    String phone_1;
    String price;
    List<Product> product;
    String shippingPrice;
    String time_order;
    String updated_at;

    Order({this.address, this.created_at, this.id, this.lat, this.lng, this.name, this.note, this.phone_1, this.price, this.product, this.shippingPrice, this.time_order, this.updated_at});

    factory Order.fromJson(Map<String, dynamic> json) {
        return Order(
            address: json['address'],
            created_at: json['created_at'],
            id: json['id'],
            lat: json['lat'],
            lng: json['lng'],
            name: json['name'],
            note: json['note'],
            phone_1: json['phone_1'],
            price: json['price'],
            product: json['product'] != null ? (json['product'] as List).map((i) => Product.fromJson(i)).toList() : null,
            shippingPrice: json['shippingPrice'],
            time_order: json['time_order'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        data['name'] = this.name;
        data['note'] = this.note;
        data['phone_1'] = this.phone_1;
        data['price'] = this.price;
        data['shippingPrice'] = this.shippingPrice;
        data['time_order'] = this.time_order;
        data['updated_at'] = this.updated_at;
        if (this.product != null) {
            data['product'] = this.product.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Product {
    String created_at;
    int id;
    String price;
    String quantity ;
    List<Spacifcation> spacifcation;
    String updated_at;

    Product({this.created_at, this.id,this.quantity ,this.price, this.spacifcation, this.updated_at});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            created_at: json['created_at'],
            id: json['id'],
            price: json['price'],
            spacifcation: json['spacifcation'] != null ? (json['spacifcation'] as List).map((i) => Spacifcation.fromJson(i)).toList() : null,
            updated_at: json['updated_at'],
            quantity: "${json['quantity']}"
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['price'] = this.price;
        data['updated_at'] = this.updated_at;
        if (this.spacifcation != null) {
            data['spacifcation'] = this.spacifcation.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Spacifcation {
    String key;
    String value;

    Spacifcation({ this.key, this.value});

    factory Spacifcation.fromJson(Map<String, dynamic> json) {
        return Spacifcation(
            key: json['key'],
            value: json['value'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['key'] = this.key;
        data['value'] = this.value;
        return data;
    }
}
