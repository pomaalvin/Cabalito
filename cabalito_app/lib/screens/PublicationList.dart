import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lib/Colors.dart';

class PublicationList extends StatefulWidget{
  @override
  State createState() => _PublicationList();
}

class _PublicationList extends State<PublicationList>{
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
                      color: color4,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(left:size.width*0.08,right:size.width*0.08),
                          child: Center(
                              child: Busqueda()
                          ),
                        ),
                  /*
                        Container(
                            margin: new EdgeInsets.only(top: 6.0),
                            padding: new EdgeInsets.only(top:25.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ScrollConfiguration(
                                    behavior: MyBehavior(),
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(left: size.width/7 ,right: size.width/7),
                                      itemBuilder: (context,index){
                                        return Container(
                                          width: size.width,
                                          height: size.height,
                                          color: Colors.red,
                                        );
                                          //_Publications(size.width,size.height);
                                          //_Card(size.width,size.height);
                                      },
                                      itemCount: 20,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        */
                        /*
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: GridView.builder(
                              padding: EdgeInsets.all(0),
                              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 2
                              ),
                              itemBuilder: (context, index){
                                return Container(
                                    color: Colors.black.withOpacity(0.5),
                                    child: Column(
                                      children: [
                                        /*
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
                                        */
                                        Expanded(
                                            child: Center(
                                              child:  Container(
                                                height: size.height*0.2,
                                                width: size.width,
                                                color: Colors.blue,
                                                child: Text("hola"),
                                              ),
                                              //Estrellas(((index/5)+1%5).floor()),
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
                        */
                        Expanded(
                          child: Stack(
                            children: <Widget>[

                              Container(

                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ScrollConfiguration(
                                          behavior: MyBehavior(),
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(left: size.width/9 ,right: size.width/9),
                                            itemBuilder: (context,index){
                                              return _ViewPublic(size.width,size.height);
                                            },
                                            itemCount: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
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

class _ViewPublic extends StatelessWidget{
  var width;
  var height;

  _ViewPublic(this.width, this.height);

  Color color= PrimaryColor;
  @override
  Widget build(BuildContext context) {
    return
        GestureDetector(
          onPanDown: (dt){
          },
          child: Container(

            padding: const EdgeInsets.fromLTRB(0,10,0,10),

            width: width,
            height: height*0.23,
            color: Colors.transparent,
            child: Container(
              width: width,
              height: height*0.1,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: BorderListColor,
                    width: 2),
                //#D4D4D5

              ),
              padding: const EdgeInsets.fromLTRB(10,10,10,10),
              child: Container(
                width: width,
                height: height*0.1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: width*0.32,
                          height: height*0.15,

                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width*0.02,
                          height: height*0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width*0.35,
                              height: height*0.05,
                              color: Colors.transparent,
                              child: Text("Publication Title",
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width*0.35,
                                  height: height*0.05,
                                  color: Colors.transparent,
                                  child: Text("Price: Bs. 350",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0
                                    ),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
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
          hintText: "Buscar mecánicos",
          suffixIcon:Icon(Icons.search,color: color3.withOpacity(0.6),) ,

          hintStyle: TextStyle(color: color3.withOpacity(0.3)),
          // focusColor: Colors.white,
          // labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
