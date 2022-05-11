
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:govi_piyasa/Blog/Blogs.dart';
import 'package:govi_piyasa/Blog/addBlog.dart';

import 'package:govi_piyasa/Cart/Cart.dart';
import 'package:govi_piyasa/Forum/CreatePost.dart';
import 'package:govi_piyasa/Profile/ProfileScreen.dart';
import 'package:govi_piyasa/Screen/About.dart';
import 'package:govi_piyasa/Screen/Architectlist.dart';
import 'package:govi_piyasa/Screen/Delivery.dart';
import 'package:govi_piyasa/Screen/HomeScreen.dart';
import 'package:govi_piyasa/Screen/feedback.dart';
import 'package:govi_piyasa/Screen/sellerlist.dart';
import 'package:govi_piyasa/Search/page/filter_local_list_page.dart';
import 'package:govi_piyasa/architecture/widget_screen.dart';
import 'package:govi_piyasa/crud/app.dart';
import 'package:govi_piyasa/shop/shoprofile.dart';

import 'package:intl/intl.dart';

import '../NetworkHandler.dart';
import 'WelcomePage.dart';
//import 'package:blogapp/onesignal_flutter/onesignal_flutter.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.value}) : super(key: key);
  String value;
  @override
  _HomePageState createState() => _HomePageState(value);
}

class _HomePageState extends State<HomePage> {
/*
static final String oneSignalAppId="7a1f4b11-b687-479e-84b1-35d8ac53978f";
Future<void> initPlateformState() async{
  OneSignal.shared.setAppId(oneSignalAppId);
}*/
  int currentState = 0;
  List<Widget> widgets = [HomeScreen(), ProfileScreen()];
  List<String> titleString = ["Home Page", "Profile Page"];
  final storage = FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();
  String username = "";
  Widget profilePhoto = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50),
    ),
  );
String value;
  _HomePageState(this.value);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkProfile();
  }

  void checkProfile() async {
    var response = await networkHandler.get("/profile/checkProfile");
    setState(() {
      username = response['username'];
    });
    if (response["status"] == true) {
      setState(() {
        profilePhoto = CircleAvatar(
          radius: 50,
         // backgroundImage: NetworkHandler().getImage(response['username']),
            backgroundImage:AssetImage('assets/logo1.png')
        );
      });
    } else {
      setState(() {
        profilePhoto = Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/logo1.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    String _message;
    DateTime now = DateTime.now();
    String _currentHour = DateFormat('kk').format(now);
    int hour = int.parse(_currentHour);

    setState(
          () {
        if (hour >= 5 && hour < 12) {
          _message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          _message = 'Good Afternoon';
        } else {
          _message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  profilePhoto,
                  SizedBox(
                    height: 10,
                  ),
                  Text("@$username"),
                ],
              ),
            ),
            ListTile(
              title: Text("Cart"),
              trailing: Icon(Icons.add_shopping_cart, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CartApp()));
              },
            ),
            ListTile(
              title: Text("Delivery"),
              trailing: Icon(Icons.airport_shuttle, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Delivery()));
              },
            ),
            ListTile(
              title: Text("Feedback"),
              trailing: Icon(Icons.feedback, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ReachUs()));
              },
            ),
            ListTile(
              title: Text("Designers"),
              trailing: Icon(Icons.assistant_rounded, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>expert()));
              },
            ),
            ListTile(
              title: Text("Expertlist"),
              trailing: Icon(Icons.lightbulb_rounded, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SellerList()));
              },
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.assignment_sharp, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>About()));
              },
            ),
            // ListTile(
            //   title: Text("Add item"),
            //   trailing: Icon(Icons.control_camera_sharp, color: Colors.green),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Architect()));
            //   },
            // ),
            Divider(),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.power_settings_new, color: Colors.green),
              onTap: logout,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text(_message,
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Colors.lightGreen)),
          flexibleSpace: Image(
            image: AssetImage('assets/about.jpg'),
            fit: BoxFit.cover,
          ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {
          ///  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Messaging_Widget()));
          }),

          PopupMenuButton<int>(
            onSelected: (item)=>onSelected(context,item),
            itemBuilder: (context)=>[
              PopupMenuItem<int>(
                value:0,
                child:Row(
                  children:[
                    Icon(Icons.apps_rounded,color:Colors.blue),
                    Text("Services"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value:1,
                child:Row(
                  children:[
                    Icon(Icons.api_sharp ,color:Colors.blue),
                    Text("Search"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value:2,
                child:Row(
                  children:[
                    Icon(Icons.art_track_outlined,color:Colors.blue),
                    Text("Blog list"),
                  ],

                ),

              ),
              PopupMenuItem<int>(
                value:3,
                child:Row(
                  children:[
                    Icon(Icons.article_sharp ,color:Colors.blue),
                    Text("Add Blog"),
                  ],

                ),

              ),
              PopupMenuItem<int>(
                value:4,
                child:Row(
                  children:[
                    Icon(Icons.app_registration_sharp,color:Colors.blue),
                    Text("Crud"),
                  ],

                ),

              ),
              PopupMenuItem<int>(
                value:5,
                child:Row(
                  children:[
                    Icon(Icons.art_track_outlined,color:Colors.blue),
                    Text("Add Question"),
                  ],

                ),

              ),
            ],)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Showitem()));
        },
        child: Text(
          "+",
          style: TextStyle(fontSize: 40),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        
        color: Colors.lightGreen,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: currentState == 0 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 0;
                    });
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  color: currentState == 1 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                    });
                  },
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
      body: widgets[currentState],
    );
  }
  void onSelected(BuildContext context, int item) {
    switch(item){
      case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>WidgetScreen()));break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>FilterLocalListPage()));break;
      case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AddBlog()));break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Blogs()));break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>App()));break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CreatePost(value:value)));break;
    }
  }
  void logout() async {
    await storage.delete(key: "token");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
        (route) => false);
  }
}

