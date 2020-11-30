import 'package:cabalitoapp/model/Seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../lib/Colors.dart';
import '../lib/ApiUrl.dart' as api;

class ViewSeller extends StatefulWidget{
  Seller seller;
  ViewSeller(this.seller);
  @override
  State createState() => _ViewSellerState(seller);
}

class _ViewSellerState extends State<ViewSeller>{
  Seller seller;
  _ViewSellerState(this.seller);

  @override
  void initState(){
    super.initState();
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return new Scaffold(
        body: Container(
                      margin: new EdgeInsets.only(top: 6.0),
                      padding: new EdgeInsets.only(top:30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                      ),
                      child: Column(
                        children: [

                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                padding: EdgeInsets.only(left: 50.0 ,right:50.0,top: size.height*0.03),
                                itemBuilder: (context,index){
                                  return _Card(size.width,size.height,seller);
                                },
                                itemCount: 1,
                              ),
                            ),
                          ),
                        ],
                      )
                  )
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _Card extends StatelessWidget{
  Size size;
  var widhtScreen;
  var heightScreen;
  Seller seller;

  _Card(this.widhtScreen, this.heightScreen, this.seller);

  Color color= PrimaryColor;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return  Container(
      width: size.width*0.80,
      height: size.height*0.62,
      margin: EdgeInsets.only(bottom: 25.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: BorderListColor),
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0,10.0),
            )
          ]
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width*0.5,
                height: size.width*0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(api.url+"sellerImage/"+seller.imagePath),
                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.075),
                    child: Text("Nombre: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.01),
                    child: Text(seller.firstName,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.01),
                    child: Text(seller.lastName,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  )

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.075),
                    child: Text("Telefono: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.01),
                    child: Text(seller.phoneNumber,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.075,bottom: 20),
                    child: Text("Email: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25,left: widhtScreen*0.010,bottom: 20),
                    child: Text(seller.email,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
