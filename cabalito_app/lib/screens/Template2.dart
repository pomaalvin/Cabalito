import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lib/Colors.dart';

class Template2 extends StatefulWidget{
  @override
  State createState() => Template2State();
}

class Template2State extends State<Template2>{
  @override
  void initState(){
    super.initState();
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              padding: EdgeInsets.only(left:size.width*0.1,right:size.width*0.1),
                              child: Center(
                                  child: Busqueda()
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
                                                            "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132484366.jpg"
                                                        )
                                                    )
                                                )
                                            ),
                                            Expanded(
                                                child: Center(
                                                  child: Estrellas(((index/5)+1%5).floor()),
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
          ),
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
class Estrellas extends StatelessWidget{
  int estrellas;
  Estrellas(this.estrellas);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          if(estrellas>=index+1){

            return
              Icon(Icons.star,color: SecondaryColor,);
          }
          else{

            return
              Icon(Icons.star_border,color: SecondaryColor,);
          }
        })
      ),
    );
  }

}
class Busqueda extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       border: Border.all(color: color3.withOpacity(0.4),width: 2)
     ),
     child: TextField(
       cursorColor: color3.withOpacity(0.6),
       cursorWidth: 1,
       style: TextStyle(color: color3.withOpacity(0.6),fontSize: 18),
       decoration: InputDecoration(
         fillColor: Colors.white,
         border: InputBorder.none,
         contentPadding: EdgeInsets.only(left: 10,top: 15,bottom: 0,right: 0),
         hintText: "Buscar mecánicos 2",
         suffixIcon:Icon(Icons.search,color: color3.withOpacity(0.6),) ,

         hintStyle: TextStyle(color: color3.withOpacity(0.3)),
         // focusColor: Colors.white,
         // labelStyle: TextStyle(color: Colors.white),
       ),
     ),
   );
  }

}
