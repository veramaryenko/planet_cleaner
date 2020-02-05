import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TypesOfPollution extends StatefulWidget {
  const TypesOfPollution({Key key}) : super(key: key);

  @override
  TypesOfPollutionState createState() => TypesOfPollutionState();
}

class TypesOfPollutionState extends State<TypesOfPollution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          // TODO(vera): add list of pollutions - create list of images/screens
          // TODO(vera): Show the 5 latest added photos from Firebase with type polution
          return Image.network(
            'https://img-aws.ehowcdn.com/600x600p/photos.demandstudios.com/getty/article/184/54/72967776.jpg',
            fit: BoxFit.contain,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              }
            },
          );
        },
        itemCount: 4,
        viewportFraction: 0.8,
        itemHeight: 500,
        itemWidth: 400,
        layout: SwiperLayout.DEFAULT,
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
            .addRotate([-45.0 / 180, 0.0, 45 / 180]).addTranslate(
                [Offset(-350.0, -35.0), Offset(0.0, 0.0), Offset(370.0, 40.0)]),
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
