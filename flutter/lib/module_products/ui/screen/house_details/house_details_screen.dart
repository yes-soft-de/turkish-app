import 'package:flutter/material.dart';
import 'package:turkesh/utils/project_colors/project_colors.dart';
import 'package:turkesh/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class HouseDetailsScreen extends StatefulWidget {
  @override
  _HouseDetailsScreenState createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {
  double width;

  @override
  Widget build(BuildContext context) {
    width =  MediaQuery.of(context).size.width;
    return _screenUi();
  }

  Widget _screenUi(){
    return Scaffold(
      appBar: TurkishAppBar.getTurkishOrdinaryAppBar(context, ''),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // car model
              Text(
                'House 44',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              // owner
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Steve Josh',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              // House image
              Container(
                width: width,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                        'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.jpg'
                        )
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    color: ProjectColors.THEME_COLOR,
                    onPressed: (){},
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(Icons.picture_in_picture,color: Colors.white,),
                        Text(
                          'Show Pics',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),


              //House details
              Text(
                  'Type : House'
              ),
              Text(
                  'Space : 250 SM'
              ),
              Text(
                  'Floors number : 3'
              ),
              Text(
                  'Cladding : Super Deluxe'
              ),
              Text(
                  'Furnished House'
              ),
              Text(
                  'Address :  Sisili, Istanbul, Turkey'
              ),
              Text(
                  'Rooms : 3 Bathrooms, 5 Bedrooms and Carage'
              ),
              Center(
                child:   Text(
                    'Price : 300,253 \$'
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    color:ProjectColors.THEME_COLOR ,
                    onPressed: (){},
                    child: Text(
                      'Request Lawer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white
                      ),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    color:ProjectColors.THEME_COLOR ,
                    onPressed: (){},
                    child: Text(
                      'Request Chat',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
