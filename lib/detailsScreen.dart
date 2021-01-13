import 'package:flutter/material.dart';
import 'package:sofa_shop_ui/data.dart';

class ProductDetails extends StatelessWidget {
  final String productName;

  const ProductDetails({Key key, @required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          children: [
            /* <----------- Image Section ------------> */
            Container(
              width: size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      /* <----------- Text Block ------------> */
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        width: size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Antik Mebel\nVanya Sofa',
                              style: h2,
                            ),
                            Text(
                              'Double Cheese features two 100\% pure beef burger patties',
                              style: lessImport.copyWith(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      /* <----------- Image Block ------------> */
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              width: size.width * 0.9,
                              height: size.height * 0.25,
                              child: Hero(
                                tag: productName,
                                child: Image.asset(
                                  'assets/$productName.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /* <----------- End of Image Section ------------> */
            hGap20,
            /* <----------- Gallery ------------> */
            Container(
              height: size.height * 0.08,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                  ),
                  GalleryThumbnail(
                    size: size,
                    image: 'sofa-0',
                    active: true,
                  ),
                  GalleryThumbnail(
                    size: size,
                    image: 'sofa-1',
                  ),
                  GalleryThumbnail(
                    size: size,
                    image: 'sofa-3',
                  ),
                ],
              ),
            ),
            /* <----------- End of Gallery ------------> */
            hGap30,
            /* <----------- Description And Review Sections ------------> */
            Expanded(
              child: Row(
                children: [
                  /* <----------- Side Menu ------------> */
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        hGap30,
                        hGap30,
                        hGap20,
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Description',
                            style: menuText.copyWith(color: Colors.white),
                          ),
                        ),
                        hGap40,
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'Reviews',
                            style: menuText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* <----------- Details Menu ------------> */
                  Expanded(
                    flex: 4,
                    child: CustomPaint(
                      painter: ContainerCustomPaint(),
                      size: size,
                      child: Container(
                        padding: EdgeInsets.only(left: 50, top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* <----------- Text Block ------------> */
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: Text(
                                '''Furniture refers to movable objects intended to support various human activities such as seating (e.g., chairs, stools, and sofas), eating (tables), and sleeping (e.g., beds). \n\n People have been using natural objects, such as tree stumps, rocks and moss, as furniture since the beginning of human civilisation.
                              ''',
                                style: lessImport.copyWith(fontSize: 15),
                              ),
                            ),
                            /* <----------- Color Choosing ------------> */
                            Row(
                              children: [
                                ColorPicker(
                                  size: size,
                                  color: Color(0xFF73E1B4),
                                  active: true,
                                ),
                                ColorPicker(
                                  size: size,
                                  color: Color(0xFFF380AD),
                                ),
                                ColorPicker(
                                  size: size,
                                  color: Color(0xFFFFB63D),
                                ),
                                ColorPicker(
                                  size: size,
                                  color: Color(0xFF3AB0FF),
                                ),
                              ],
                            ),
                            /* <----------- End of Color Choosing ------------> */
                          ],
                        ),
                      ),
                    ),
                  ),
                  /* <----------- Details Menu ------------> */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    Key key,
    @required this.size,
    @required this.color,
    this.active = false,
  }) : super(key: key);

  final Size size;
  final Color color;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size.width * 0.08,
      height: size.height * 0.08,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: active
            ? Border.all(
                width: 2,
                color: color,
              )
            : null,
      ),
      child: CircleAvatar(
        backgroundColor: color,
      ),
    );
  }
}

/* <----------- Custom Paint For The Container ------------> */
class ContainerCustomPaint extends CustomPainter {
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
    path_0.lineTo(0, size.height * 0.40);
    // You can just edit this to get your desired results
    path_0.quadraticBezierTo(
        size.width * 0.13, size.height * 0.30, 0, size.height * 0.20);
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
    canvas.drawCircle(Offset(0, size.height * 0.30), 6, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/* <----------- Reusable Widgets ------------> */
class GalleryThumbnail extends StatelessWidget {
  const GalleryThumbnail({
    Key key,
    @required this.size,
    @required this.image,
    this.active = false,
  }) : super(key: key);

  final Size size;
  final String image;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: active
              ? Border.all(
                  width: 1,
                  color: Colors.orange,
                )
              : null),
      height: size.height * 0.08,
      width: size.width * 0.2,
      child: Image.asset('assets/$image.png'),
    );
  }
}
