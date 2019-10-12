import 'package:shared_preferences/shared_preferences.dart';

class User {
    String created_at;
    String email;
    int id;
    String image;
    String latLng;
    String name;
    String phone;
    String status;
    String token;
    String updated_at;
    String password ;

    User({this.created_at, this.email, this.id, this.image, this.latLng, this.name, this.phone, this.status, this.token, this.updated_at ,this.password});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            created_at: json['created_at'], 
            email: json['email'], 
            id: json['id'], 
            image: json['image'], 
            latLng: json['latLng'], 
            name: json['name'], 
            phone: json['phone'], 
            status: json['status'], 
            token: json['token'], 
            updated_at: json['updated_at'], 
        );
    }

}

//local storage functions

Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear() ;

    return true ;
}

Future<bool> saveUser(User user) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setInt("userId", user.id);
        await prefs.setString("userName", user.name);
        await prefs.setString("userEmail", user.email);
        await prefs.setString("userPhone", user.phone);
        await prefs.setString("userToken", user.token);
        await prefs.setString("userImage", user.image);
        await prefs.setString("userLatLng", user.latLng);
        await prefs.setString("userPassword", user.password);

        return true ;
    }catch(Excption){
        print("save to shared faild   :  $Excption");
        return false ;
    }
}

Future< User > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new User(
        id: prefs.getInt("userId"),
        name: prefs.getString("userName"),
        email: prefs.getString("userEmail"),
        phone: prefs.getString("userPhone"),
        token: prefs.getString("userToken"),
        image: prefs.getString("userImage"),
        latLng: prefs.getString("userLatLng"),
        password: prefs.getString("userPassword"),
    );

}