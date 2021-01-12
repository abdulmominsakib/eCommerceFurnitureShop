import 'package:flutter/material.dart';
import 'package:sofa_shop_ui/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              /* <----------- Side Menu ------------> */
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /* <----------- Home Screen ------------> */
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(left: 30, top: 30),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* <----------- Top HeadLine ------------> */
                      Text(
                        'Good Morning',
                        style: lessImport,
                      ),
                      Text(
                        'Dwi Lestari',
                        style: h1,
                      ),
                      /* <----------- Categories ------------> */
                      hGap20,
                      Container(
                        height: mediaQuery.height * 0.08,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CategoriesTile(
                              mediaQuery: mediaQuery,
                              imageName: 'sofa',
                              selected: true,
                            ),
                            CategoriesTile(
                              mediaQuery: mediaQuery,
                              imageName: 'lamp',
                            ),
                            CategoriesTile(
                              mediaQuery: mediaQuery,
                              imageName: 'cabinet',
                            ),
                            CategoriesTile(
                              mediaQuery: mediaQuery,
                              imageName: 'almirah',
                            ),
                          ],
                        ),
                      ),
                      /* <----------- End Categories ------------> */
                      hGap30,
                      /* <----------- New Arrival ------------> */
                      Text(
                        'New Arrival',
                        style: lessImport,
                      ),
                      hGap10,
                      Container(
                        height: mediaQuery.height * 0.25,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ImageCardTile(
                              mediaQuery: mediaQuery,
                              image: 'sofa-0',
                            ),
                            ImageCardTile(
                              mediaQuery: mediaQuery,
                              image: 'sofa-3',
                            ),
                          ],
                        ),
                      ),
                      /* <----------- End New Arrival ------------> */
                      hGap30,
                      /* <----------- Recently Views ------------> */
                      Text(
                        'Recently Views',
                        style: lessImport,
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            RecentlyViewCard(
                              mediaQuery: mediaQuery,
                              sofaImage: 'sofa-1',
                              sofaPrice: '123',
                              sofaName: 'Nestudio Sofa',
                            ),
                            RecentlyViewCard(
                              mediaQuery: mediaQuery,
                              sofaImage: 'sofa-2',
                              sofaPrice: '243',
                              sofaName: 'Picaso Sofa Emma',
                            ),
                            RecentlyViewCard(
                              mediaQuery: mediaQuery,
                              sofaImage: 'sofa-3',
                              sofaPrice: '89',
                              sofaName: 'Tina Sofa',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentlyViewCard extends StatelessWidget {
  const RecentlyViewCard({
    Key key,
    @required this.mediaQuery,
    @required this.sofaName,
    @required this.sofaPrice,
    @required this.sofaImage,
  }) : super(key: key);

  final Size mediaQuery;
  final String sofaName, sofaPrice, sofaImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: mediaQuery.height * 0.1,
      child: Row(
        children: [
          Container(
            width: mediaQuery.width * 0.2,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/$sofaImage.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          wGap15,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$sofaName',
                style: lessImport,
              ),
              Text(
                '\$$sofaPrice',
                style: h2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ImageCardTile extends StatelessWidget {
  const ImageCardTile({
    Key key,
    @required this.mediaQuery,
    @required this.image,
  }) : super(key: key);

  final Size mediaQuery;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: mediaQuery.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Container(
            height: mediaQuery.height * 0.12,
            child: Image.asset(
              'assets/$image.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          // You can use auto size text here
          Positioned(
            bottom: 0,
            left: 10,
            child: Container(
              child: Text(
                'Antik Mebel \n Vanya Sofa',
                style: h2.copyWith(
                  color: Color(0xFF272727),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              child: Text(
                '\$374',
                style: h2.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* <----------- To make code clean ------------> */

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    Key key,
    @required this.mediaQuery,
    @required this.imageName,
    this.selected = false,
  }) : super(key: key);

  final Size mediaQuery;
  final String imageName;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Color(0xFF694AF6),
        borderRadius: BorderRadius.circular(15),
      ),
      height: mediaQuery.width * 0.15,
      child: Image.asset(
        'assets/icon-$imageName.png',
        color: selected ? Colors.white : Colors.grey,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
