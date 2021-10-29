
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:govi_piyasa/Auth/authservice.dart';
import 'package:govi_piyasa/home.dart';
import 'package:govi_piyasa/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {



  @override
  void initState() {
    super.initState();

  }
  Future<void> postData() async{
    try {
      final response =await http.post(
          Uri.parse("https://govipiyasa.herokuapp.com/adduser"),
          body: {
            "name": name,
            "password": password
          });
      print(response.body);
    }catch(e){
      print(e);
    }
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
  var name,password,token;
  @override
  Widget build(BuildContext context) {
TextEditingController _passwordcontroller=new TextEditingController();
TextEditingController _emailcontroller=new TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 400,
            child: Image(
              image: AssetImage("images/login.jpg"),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.email)),
              onChanged: (val){
                name=val;
              },
            ),
          ),
          Container(
            child: TextField(
              controller: _passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.lock),),
              onChanged: (val){
                password=val;
              },
            ),
          ),
          SizedBox(height: 10.0,),
          RaisedButton(
            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
            onPressed: (){
              AuthService().login(name,password).then((val){
                if(val.data['success']){
                  token=val.data['token'];
                  Fluttertoast.showToast(
                    msg: 'sucessfull',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                }
              });
            },
            child: Text('LOGIN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
            onPressed:(){
              _passwordcontroller.clear();
              _emailcontroller.clear();
              postData();
            },

            child: Text('register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(height: 10.0,),

          GestureDetector(
            child: Text('Create an Account?'),
            onTap: navigateToSignUp,
          ),
        ],
      ),
    );
  }
}
