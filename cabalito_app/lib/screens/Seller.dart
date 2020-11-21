import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lib/Colors.dart';

class Seller extends StatefulWidget{
  @override
  State createState() => SellerState();
}

class SellerState extends State<Seller>{
  @override
  void initState(){
    super.initState();
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return new Scaffold(
        backgroundColor: color1,
        body: Column(
          children: <Widget>[
            Container(
              height:60,
              child: Center(

                child:
                Container(
                  child:Text("Vendedor",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: color2,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                    ),
                  ),
                  Container(
                      margin: new EdgeInsets.only(top: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            padding: EdgeInsets.only(left:size.width*0.1,right:size.width*0.1),
                            child: Center(
                            ),
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: GridView.builder(
                                padding: EdgeInsets.all(0),
                                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2
                                ),
                                itemBuilder: (context, index){
                                  return Container(
                                      color: Colors.black.withOpacity(0.5),
                                      child: Column(
                                        children: [
                                          Container(
                                              width: size.width*0.5,
                                              height: size.width*0.5*0.8,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          "https://lh3.googleusercontent.com/proxy/w03jEsMOLft4L9aoN-sXooFysioVPF9EorLo8RwCNupJvhMpX0OjjZ_Mh3VJHVh3ttAqN9tVlmPp0GbB9N0DZgm01g"
                                                      )
                                                  )
                                              )
                                          ),
                                          Expanded(
                                              child: Center(

                                              )
                                          ),
                                        ],
                                      )
                                  );
                                },
                                itemCount: 20,
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
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