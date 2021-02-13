
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hersay/generated/l10n.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';
import 'package:inject/inject.dart';

@provide
class ProductImagesScreen extends StatefulWidget {
  @override
  _ProductImagesScreenState createState() => _ProductImagesScreenState();
}

class _ProductImagesScreenState extends State<ProductImagesScreen> {
  List<String> _images = [];

  @override
  Widget build(BuildContext context) {
    _images = ModalRoute.of(context).settings.arguments;

    final List<Widget> imageSliders = _images.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      S.of(context).image+'${_images.indexOf(item)+1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    )).toList();

    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, S.of(context).images),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            imageSliders.isNotEmpty
                ? CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 4),
              ),
              items: imageSliders,
            )
                : Center(
              child: Text(
                S.of(context).threIsNotOtherImages,
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
            ),
           
          ],)
      ),
    );
  }
}
