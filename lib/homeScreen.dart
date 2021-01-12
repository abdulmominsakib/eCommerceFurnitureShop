import 'package:flutter/material.dart';
import 'package:sofa_shop_ui/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
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
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Sofa',
                                style: h2.copyWith(color: Colors.grey),
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Round Chair',
                                style: h2.copyWith(color: Colors.grey),
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Home',
                                style: h2,
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                'Arm Chair',
                                style: h2.copyWith(color: Colors.grey),
                                textDirection: TextDirection.ltr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /* <----------- Home Screen ------------> */
              Expanded(
                flex: 5,
                child: CustomPaint(
                  painter: RPSCustomPainter(),
                  size: mediaQuery,
                  child: Container(
                    padding: EdgeInsets.only(left: 30, top: 30),
                    decoration: BoxDecoration(
                      // color: secondaryColor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* <----------- Custom Paint For The Container ------------> */
class RPSCustomPainter extends CustomPainter {
  /* <-----------------------> 
      You can animate the path programitcally. The height of the curve will be marked down here. I am putting static value because this is just a UI build, 
      if you want to use it in your projects then you can add values to this    
   <-----------------------> */

  @override
  void paint(Canvas canvas, Size size) {
    /* <----------- Container ------------> */
    Paint paint_0 = new Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    // The starting height of the curve from the bottom
    path_0.lineTo(0, size.height * 0.71);
    // You can just edit this to get your desired results
    path_0.quadraticBezierTo(
        size.width * 0.13, size.height * 0.62, 0, size.height * 0.53);
    path_0.cubicTo(
        0, size.height * 0.35, 0, size.height * 0.15, 0, size.height * 0.06);
    path_0.cubicTo(size.width * -0.00, size.height * 0.02, size.width * 0.05,
        size.height * 0.01, size.width * 0.10, 0);
    path_0.quadraticBezierTo(
        size.width * 0.33, size.height * 0.00, size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    /* <----------- Circle ------------> */
    Paint paint_1 = new Paint()
      ..color = thirdColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path_0, paint_0);
    canvas.drawCircle(Offset(0, size.height * 0.61), 6, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/* <-----------------------> 
    Re usable Widgets    
 <-----------------------> */

/* <----------- Recently View Card ------------> */
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

/* <----------- For Image and the Text ------------> */
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

/* <----------- Categories ------------> */
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
