import 'package:cabalitoapp/model/Seller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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
                      margin: new EdgeInsets.only(top: 1.0),
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
                                padding: EdgeInsets.only(left: size.width*0.10 ,right:size.width*0.10,top: size.height*0.03),
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
      height: size.height*0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width*0.6,
                height: size.width*0.6,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: PrimaryColor),
                  image: DecorationImage(

                      image: seller.imagePath=="vacio"?(AssetImage("assets/user.png")):(NetworkImage(api.url+"sellerImage/"+seller.imagePath)),
                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.075),
                    child: Text("Nombre: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: PrimaryColor,
                      ),
                    ),
                  ),
                  Flexible(child: Padding(
                    padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.02),
                    child: Text(seller.firstName+" "+seller.lastName,
                      style: TextStyle(
                        fontSize: 18.0,
                        color:Colors.black,
                      ),
                    ),
                  ),)
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.075),
                    child: Text("Telefono: ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: PrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.01),
                    child: Text(seller.phoneNumber,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: TitleColor,
                      ),
                    ),
                  ),

                  IconButton(
                      padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.01),
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.phone),iconSize: size.width*0.1,color: Colors.lightGreen,
                      onPressed: () {
                        _call();
                      }),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.075,bottom: 20),
                    child: Text("Email: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: PrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: heightScreen*0.05,left: widhtScreen*0.010,bottom: 20),
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
  _call() async{
    FlutterPhoneDirectCaller.callNumber(seller.phoneNumber);
    //this.setState({});
  }
}
