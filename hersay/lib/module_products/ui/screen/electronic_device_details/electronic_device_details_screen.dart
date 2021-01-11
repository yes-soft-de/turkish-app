import 'package:flutter/material.dart';
import 'package:hersay/utils/project_colors/project_colors.dart';
import 'package:hersay/utils/widgets/turkish_app_bar/turkish_app_bar.dart';

class ElectronicDeviceDetailsScreen extends StatefulWidget {
  @override
  _ElectronicDeviceDetailsScreenState createState() =>
      _ElectronicDeviceDetailsScreenState();
}

class _ElectronicDeviceDetailsScreenState
    extends State<ElectronicDeviceDetailsScreen> {
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return _screenUi();
  }

  Widget _screenUi() {
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
                'Dell XPS 2020',
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
                            'https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500 1x, https://images.pexels.com/photos/127229/pexels-photo-127229.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500 2x'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Edward Josh',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // ElectronicDevice image
              Container(
                width: width,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://cdn.mos.cms.futurecdn.net/FkMhmL6YzQmj7unhsupKMR.png'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: ProjectColors.THEME_COLOR,
                    onPressed: () {},
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Icon(
                          Icons.picture_in_picture,
                          color: Colors.white,
                        ),
                        Text(
                          'Show Pics',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),

              //ElectronicDevice details
              Text('Type : Laptop'),
              Text('Brand : Dell'),
              Text('Year of Release : 2020'),
              Text('Duration of use : 4 Months'),
              Text('Display : 15.6-inch touchscreen (3840*2400)'),
              Text('Processor :  Intel Core i7-10875H'),
              Text('Storage : 512GB PCIe 3*4 SSD'),
              Text('Graphics : Nvidia GeForce GTX 1650 TI 4GB GDDR6'),
              Text('Location : 23CX+G7 Umraniey, istanbul, Turkey'),
              Center(
                child: Text('Price : 300,253 \$'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: ProjectColors.THEME_COLOR,
                    onPressed: () {},
                    child: Text(
                      'Request Lawer',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: ProjectColors.THEME_COLOR,
                    onPressed: () {},
                    child: Text(
                      'Request Chat',
                      style: TextStyle(fontSize: 10, color: Colors.white),
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
