
import 'package:camel/model/User.dart';
import 'package:camel/statics/Constants.dart';
import 'package:camel/statics/app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission/permission.dart';
class GetLocation extends StatefulWidget {
  @override
  _GetLocationState createState() {
    return _GetLocationState();
  }
}
class _GetLocationState extends State<GetLocation> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: Constants.GOOGLE_MAPS_API_KEY);
  GlobalKey<ScaffoldState> _scaffoldKey =
  new GlobalKey<ScaffoldState>();
  String locationString = "" ;
  bool isGettingLocation = false ;
  bool updateLocationApi = false ;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

      LatLng selectedPosition ;
  void _addMarker(LatLng latLang) async {
    var markerIdVal = "50";
    setState(() {
      this.selectedPosition = latLang ;
    });
    final MarkerId markerId = MarkerId(markerIdVal);
    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: latLang,
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
    );
    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
    setState(() {
      this.isGettingLocation = true ;
    });
    var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLang.latitude, latLang.longitude)) ;

    setState(() {
      this.locationString = address.first.addressLine ;
      this.isGettingLocation = false ;
    });
  }
  Future<void> _redirctCameraPosition(CameraPosition cameraPosition ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      
      _addMarker(new LatLng(lat, lng));
      _redirctCameraPosition(
          CameraPosition(
          bearing: 192.8334901395799,
          target: new LatLng(lat, lng),
          tilt: 59.440717697143555,
          zoom: 15)
      );
    }
  }

  getCurrentPosition () async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        print("my Location Long :${position.longitude}");
        print("my Location lat :${position.latitude}");
        _addMarker(new LatLng(position.latitude, position.longitude));
    _redirctCameraPosition( CameraPosition(
    bearing: 192.8334901395799,
    target: new LatLng(position.latitude, position.longitude),
    tilt: 59.440717697143555,
    zoom: 15));
  }
  //User user ;
  getPermission()async{
    List<PermissionName> permissionNames = [PermissionName.Location];
   final status = await Permission.getPermissionsStatus(permissionNames) ;
   print("permission Status : : $status");
    if( status[0].permissionStatus != PermissionStatus.allow ){
      print("not allowed ");
      var permissions = await Permission.requestPermissions(permissionNames);
      setState(() {
      });
    }else print("allowed");
  }
  @override
  void initState() {
    getPermission();
    super.initState();
    getUser().then((user)async {
      if(user.latLng != null){
        double lat = double.parse(user.latLng.split(",")[0]);
        double lng = double.parse(user.latLng.split(",")[1]);
        _addMarker(new LatLng(lat,lng));
        _redirctCameraPosition(
            CameraPosition(
                bearing: 192.8334901395799,
                target: new LatLng(lat, lng),
                tilt: 59.440717697143555,
                zoom: 15)
        );
        setState(() {
          this.isGettingLocation = true ;
        });
        var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(lat, lng)) ;

        setState(() {
          this.locationString = address.first.addressLine ;
          this.isGettingLocation = false ;
        });
      }
    });
//    UserLocalStorage.getUser().then((user){
//      setState(() {
//        this.user = user ;
//      });
//      if(user.lat != null ){
//        _addMarker(new LatLng(double.parse(user.lat),double.parse(user.lang)));
//        _redirctCameraPosition(
//            CameraPosition(
//                bearing: 192.8334901395799,
//                target:new LatLng(double.parse(user.lat),double.parse(user.lang)),
//                tilt: 59.440717697143555,
//                zoom: 15)
//        );
//      }else{
//        getCurrentPosition();
//      }
//    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass().appBar(context, _scaffoldKey ,false,0, title: "اختر موقعك"),
      floatingActionButton: this.updateLocationApi ? FloatingActionButton(
        onPressed: (){ },
        child: Container(
          decoration: BoxDecoration(color: GoodColors.brown ,shape: BoxShape.circle),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ):FloatingActionButton.extended(
        onPressed: (){
          Navigator.pop(context,selectedPosition);},
        label: Text('اختر الموقع'),
        icon: Icon(Icons.check),
        backgroundColor: GoodColors.brown,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
          top: 0 ,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: (latLang){
                  print(latLang);
                  _addMarker(latLang);
                },
                markers: Set<Marker>.of(markers.values),
              ),
                width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  ),

              ),
          Positioned(
            top: 16,
            left: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(16),
                constraints: BoxConstraints(minHeight:MediaQuery.of(context).size.width/10 ),
                width: MediaQuery.of(context).size.width/2,
                color: Color(0x44000000),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      flex: 2,
                      child: Container(
                        constraints: BoxConstraints(minHeight:MediaQuery.of(context).size.width/10 ),
                        width: MediaQuery.of(context).size.width/2,
                        child:isGettingLocation ? Center(child:CircularProgressIndicator()): Text(locationString),
                            ),

                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Align(alignment: Alignment.topRight,
                          child: IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () async{
                            Prediction p = await PlacesAutocomplete.show(
                              context: context, apiKey: Constants.GOOGLE_MAPS_API_KEY ,
                              mode: Mode.overlay,
                            );
                            displayPrediction(p);
                          }),),),
                    ),
                  ],
                ),
              ),
            ),

              ),
//          Positioned(
//               bottom: MediaQuery.of(context).size.height/9,
//               right: 16,
//              child: InkWell(
//                onTap: (){
//                  this.getCurrentPosition();
//                },
//                child: Container(
//                  width: MediaQuery.of(context).size.width/10,
//                  height: MediaQuery.of(context).size.width/10,
//                  decoration: BoxDecoration(color: GoodColors.brown , shape: BoxShape.circle),
//                  child: Center(child: Icon(Icons.location_searching ,color:Colors.white , size: 25,),),
//
//                ),
//              )
//
//          )
        ],
      ),
    );
  }
}