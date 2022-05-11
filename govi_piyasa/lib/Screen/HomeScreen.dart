

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govi_piyasa/Forum/Postlist.dart';
import 'package:govi_piyasa/Information/news.dart';
import 'package:govi_piyasa/Screen/sellerlist.dart';
import 'package:govi_piyasa/checkout/mainpage.dart';



import 'Architectlist.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  /*
  Future getimgfromFirebase() async {

    var firestore = Firestore.instance;
    QuerySnapshot qn =
        await firestore.collection("Carousel_images").getDocuments();
    return qn.documents;
  }

*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[

       /*   Container(
            height: 200,
            child: FutureBuilder(
              future: getimgfromFirebase(),
              builder: (_, snapshot) {
                return CarouselSlider.builder(
                  slideBuilder: (index) {
                    DocumentSnapshot sliderimage = snapshot.data[index];
                    return Container(
                        child: GestureDetector(
                            child: Image.network(sliderimage['img']),
                            onTap: () {
                              Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(),
                                ),
                              );
                            }));
                  },
                  autoSliderTransitionTime: Duration(
                    milliseconds: 100,
                  ),
                  slideTransform: CubeTransform(
                    rotationAngle: 0,
                  ),
                  slideIndicator: CircularSlideIndicator(
                    indicatorBorderColor: Colors.red,
                    currentIndicatorColor: Colors.blue,
                  ),
                  itemCount: snapshot.data.length,
                );
              },
            ),
          )*/

          SizedBox(height: 10.0),
          GestureDetector(
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreenAccent,
                    Colors.lightGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('assets/garden.png',
                        fit: BoxFit.fill, width: 150.0, height: 150.0),
                    const ListTile(
                      title: Text('Garden',
                          style: TextStyle(color: Colors.green, fontSize: 30)),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  expert()));
            },
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreenAccent,
                    Colors.lightGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'assets/flowers.png',
                      width: 150.0, height: 150.0,
                      fit: BoxFit.contain,
                    ),
                    const ListTile(
                      title: Text('Products',
                          style: TextStyle(color: Colors.green, fontSize: 30)),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp1()));
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreenAccent,
                    Colors.lightGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('assets/forum.png',
                        fit: BoxFit.contain,  width: 150.0, height: 150.0),
                    const ListTile(
                      title: Text('Forum',
                          style: TextStyle(color: Colors.green, fontSize: 30)),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Postlist()));
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreenAccent,
                      Colors.lightGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/expert.png',
                          fit: BoxFit.contain, width: 150.0, height: 150.0),
                      const ListTile(
                        title: Text('Experts',
                            style:
                                TextStyle(color: Colors.green, fontSize: 30)),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SellerList()));
              }),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            child: Container(
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreenAccent,
                    Colors.lightGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/welcome.jpg',
                          fit: BoxFit.contain, width: 150.0, height: 150.0),
                      const ListTile(
                        title: Text('Information',
                            style:
                                TextStyle(color: Colors.green, fontSize: 30)),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
