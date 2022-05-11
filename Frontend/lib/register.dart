
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


 late String _name, _email, _password,_phoneno;



  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Form(
                    key: null,//null
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                //if (input.isEmpty) return 'Enter Name';
                              },
                              decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                              onSaved: (input) => _name = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                               // if (input.isEmpty) return 'Enter Email';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email)),
                              onSaved: (input) => _email = input!),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                               // if (input.length < 6)
                                 // return 'Provide Minimum 6 Character';
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input!),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                // if (input.length < 6)
                                // return 'Provide Minimum 6 Character';
                              },
                              decoration: InputDecoration(
                                labelText: 'PhoneNo',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: null,
                          child: Text('SignUp',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
