import 'package:blogapp/Blog/addBlog.dart';
import 'package:blogapp/Cart/Cart.dart';
import 'package:blogapp/Forum/create_post.dart';
import 'package:blogapp/Forum/list_post.dart';
import 'package:blogapp/Pages/WelcomePage.dart';
import 'package:blogapp/Screen/About.dart';
import 'package:blogapp/Screen/Delivery.dart';
import 'package:blogapp/Screen/HomeScreen.dart';
import 'package:blogapp/Profile/ProfileScreen.dart';
import 'package:blogapp/Screen/expertlist.dart';
import 'package:blogapp/Screen/feedback.dart';
import 'package:blogapp/Screen/messaging_widget.dart';
import 'package:blogapp/Screen/sellerlist.dart';
import 'package:blogapp/architecture/widget_screen.dart';
import 'package:blogapp/checkout/mainpage.dart';
import 'package:blogapp/checkout/screens/homepage.dart';
import 'package:blogapp/checkout/widgets/home_body.dart';

import 'package:blogapp/shop/additem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:blogapp/NetworkHandler.dart';
import 'package:intl/intl.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            color: Colors.black,
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MyApp1()));
              },
            ),
            ListTile(
              title: Text("Users"),
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
            ListTile(
              title: Text("Add item"),
              trailing: Icon(Icons.control_camera_sharp, color: Colors.green),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Addproduct()));
              },
            ),
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
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Messaging_Widget()));
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
                    Text("Forum"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value:2,
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
              .push(MaterialPageRoute(builder: (context) => AddBlog()));
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ListPost()));break;
      case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CreatePost()));break;
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
