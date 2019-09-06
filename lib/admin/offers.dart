import 'dart:io';

import 'package:camel/admin/model/slider.dart';
import 'package:camel/admin/statics/admin_app_bar.dart';
import 'package:camel/statics/good_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'api/slider_api.dart';
class Offers extends StatefulWidget {
  _OffersState createState() => _OffersState();
}
class _OffersState extends State<Offers>{
  File _image;
  GlobalKey<ScaffoldState> _scaffoldKeyProfile ;
   List<SliderModel> sliderList = new List();
  bool getAllSliderApiCall = false ;
  getAllSlider(){
    setState(() {
      getAllSliderApiCall = true ;
    });
    SliderApi.getAllSlider().then((response){
      setState(() {
        this.sliderList =response.sliderList;
        getAllSliderApiCall = false ;
      });
    },onError: (error){
      setState(() {
        getAllSliderApiCall = false ;
      });
      print("get All drivers error : : : $error");
    });
  }
  deleteSlider(int id,int position){
    SliderApi.deleteSlider(id).then((response){
      setState(() {
        sliderList.removeAt(position);
      });
    });
  }
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("imaaaage ::${image.toString()}");
    setState(() {
      _image = image;
    });
    SliderApi.addNewSlider(_image).then((response){
      setState(() {
        sliderList.add(response.slider);
        _image=null;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _scaffoldKeyProfile =GlobalKey<ScaffoldState>();
    this.getAllSlider();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBarClass().appBar(context, _scaffoldKeyProfile,"العروض"),
      body: getAllSliderApiCall
          ?Center(child:
      CircularProgressIndicator(
        backgroundColor: GoodColors.brownDark,
      ),
      )
          :Container(
        padding: EdgeInsets.only(top: 16,bottom: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left :16,right: 16,top: 8,bottom: 8),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("العدد : 3 صور"),
                    Text("الحجم : 148 * 312 "),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: InkWell(
                onTap: getImage,
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child:_image == null?
                  Image.asset("images/add_photo.png",fit: BoxFit.fill,):
                  Image.file(_image,fit: BoxFit.cover),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 16,right: 16,left: 16),
                  itemCount: sliderList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    childAspectRatio: 1.7
                  ),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,position){
                    return Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: MediaQuery.of(context).size.height/7,
                              color: Colors.green,
                              child: Image.network("http://goot.drugs-house.com/public/images/Slider/1567250892.png",fit: BoxFit.fill,),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Container(
                              height: MediaQuery.of(context).size.height/7,
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: GoodColors.brownLight,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(7),
                                          )
                                        ),
                                        child: Center(
                                          child: Icon(Icons.edit,color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: (){
                                        deleteSlider(sliderList[position].id, position);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: GoodColors.brownDark,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(7),
                                            )
                                        ),
                                        child: Center(child: Icon(Icons.delete,color: Colors.white,)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}