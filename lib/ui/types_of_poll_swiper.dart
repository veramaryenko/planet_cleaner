import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TypesOfPollution extends StatefulWidget {
  TypesOfPollution({Key key}) : super(key: key);


  @override
  TypesOfPollutionState createState() => TypesOfPollutionState();
  }

class TypesOfPollutionState extends State<TypesOfPollution>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );

  }
}

