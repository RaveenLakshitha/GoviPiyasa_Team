
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

  }/*
  Future<void> postData() async{
    try {
      final response =await http.post(
          Uri.parse("http://localhost:5000/userTask/createUserTask"),
          body: {
            "taskTitle":name,
            "taskDescription": password
          });
      print(response.body);
    }catch(e){
      print(e);
    }
  }
*/
  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
  var name,password,token,age;
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
            child: TextFormField(
              controller: _emailcontroller,
              validator: (input) {
                if (input.isEmpty) return 'Enter Email';
              },
              decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
              onChanged: (val){
                name=val;
              },
            ),
          ),
          Container(
            child: TextFormField(
              controller: _passwordcontroller,
              obscureText: true,
              validator: (input) {
                if (input.length < 5)
                  return 'Provide Minimum 5 Character';
              },
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
                    msg: 'Login sucessfully',
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
            child: Text('Login',
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
