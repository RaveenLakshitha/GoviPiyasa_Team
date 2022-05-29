// class itemmodel{
//   String price;
//   String category;
//   String itemname;
//   String description;
//   String image;
//   itemmodel(String itemname, String price,String description,String category,String image){
//     this.itemname = itemname;
//     this.price = price;
//     this.description=description;
//     this.image=image;
//     this.category=category;
//   }
// }
import 'package:blogapp/shop/DataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
class Itemdetails extends StatefulWidget {
  final String text;
  final String price;
  final String image;
  final String quantity;
  final String description;
  final String category;
  // receive data from the FirstScreen as a parameter
  Itemdetails(
      {Key key,
        @required this.text,
        @required this.price,
        @required this.image,
        @required this.quantity,
        @required this.description,
        @required this.category})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(text,price,image,quantity,description,category);
}
Future<DataModel> submitData(String itemname,String description,String price,String qty,String category,String image,String deliverystatus)async{
  var response=await http.post(Uri.parse('https://mongoapi3.herokuapp.com/additem'),
      body:{"itemname":itemname,"description":description,"price":price,"quantity":qty,"category":category,"image":image,"deliverystatus":deliverystatus});
  var data=response.body;
  print(data);
  if(response.statusCode==201){
    String responseString=response.body;
    dataModelFromJson(responseString);
  }
}
class _MyHomePageState extends State<Itemdetails> {
  double rating=0;
  final String text;
  final String price;
  final String image;
  final String quantity;
  final String description;
  final String category;
  _MyHomePageState(this.text,this.price,this.image,this.quantity,this.description,this.category);
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colors.lightGreenAccent, Colors.green],
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image(
                        width: 300,
                        height: 240,
                        image: NetworkImage(image),
                      ),),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Rs:${price}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    GestureDetector(
                      child:Icon(Icons.share),
                      onTap: (){
                        Share.share('${text}', subject: '${description}');
                      },
                    )

                  ]),
                ),
              ),
              Positioned(
                  left: 20.0,
                  right: 20.0,
                  child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Rating:$rating',
                              style:TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 22,),
                            buildRating(),
                            TextButton(
                              child:Text(
                                'Show',style:TextStyle(fontSize:15),
                              ),
                              onPressed: ()=>showRating(),
                            ),

                          ],
                        ),
                      ))),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colors.lightGreenAccent, Colors.green],
                    ),
                  ),
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                          child: Container(
                              width: 310.0,
                              height: 170.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Details",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Item Name",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              text,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        ),

                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Description",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              description,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Quantity",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              quantity,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        ),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Category",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              category,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
          ),

        ],
      ),
    );

  }
  Widget buildRating()=>RatingBar.builder(
    minRating: 1,
    itemSize: 26,
    itemPadding: EdgeInsets.symmetric(horizontal: 4),
    itemBuilder:(context,_)=>Icon(Icons.star,color:Colors.amber),
    updateOnDrag: true,
    onRatingUpdate:(rating)=>setState((){
      this.rating=rating;
    }),);
  void showRating()=>showDialog(
    context:context,
    builder:(context)=>AlertDialog(
      title:Text('Rate this Product'),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:[
            Text('Please leave a star rating',
                style:TextStyle(fontSize:20)),
            TextField(
              controller:myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Review',
              ),
            ),
          ]
      ),
      actions: [
        TextButton(onPressed:()=>Navigator.pop(context) , child: Text('Ok',style:TextStyle(fontSize:20)))
      ],
    ),
  );
}
