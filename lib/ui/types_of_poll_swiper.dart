import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TypesOfPollution extends StatefulWidget {
  TypesOfPollution({Key key}) : super(key: key);

  @override
  TypesOfPollutionState createState() => TypesOfPollutionState();
}

class TypesOfPollutionState extends State<TypesOfPollution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          //TODO: add list of pollutions - create list of images/screens
          return Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 4,
        viewportFraction: 0.8,
        itemHeight: 500,
        itemWidth: 400,
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
            .addRotate([-45.0 / 180, 0.0, 45 / 180]).addTranslate([
              new Offset(-350.0, -35.0),
              new Offset(0.0, 0.0),
              new Offset(370.0, 40.0)]),
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}
