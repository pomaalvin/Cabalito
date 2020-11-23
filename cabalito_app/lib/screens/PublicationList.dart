import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_drawer/kf_drawer.dart';
import '../lib/Colors.dart';
import '../lib/ApiUrl.dart' as api;

class PublicationList extends StatefulWidget{
  List<ListPublication> listPublications;
  PublicationList(this.listPublications);
  @override
  State createState() => _PublicationList(listPublications);
}

class _PublicationList extends State<PublicationList>{
  _PublicationList(this.listPublications);
  List<ListPublication> listPublications=List();
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

                                              return _ViewPublic(size.width,size.height,listPublications[index]);
                                            },
                                            itemCount: listPublications.length,
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

  KFDrawerController _drawerController;
  var width;
  var height;
  ListPublication listPublication;
  _ViewPublic(this.width, this.height,this.listPublication);
  Widget build(BuildContext context) {

    return


        Container(

          padding: const EdgeInsets.fromLTRB(0,10,0,10),

          width: width,
          height: height*0.23,
          color: Colors.transparent,
          child: GestureDetector(

            onTap: () async {

              print("Ingresa");
              BlocProvider.of<NavigationBloc>(context).add(PublicationViewEvent(listPublication.idPublication));
             // var  listPublication=await alert.alertColor(context, listPublications);
              //if(listPublication!=null){
               // setState(() {
                //  newColor=color;
                //});
              //}

              //_drawerController.close();
              //BlocProvider.of<NavigationBloc>(context).add(AddPublicationPageEvent());
            },


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
                          height: height*0.155,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(api.url+"image/"+listPublication.imagePath),
                              fit: BoxFit.fill
                            ),
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
                              child: Text(listPublication.title,
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width*0.35,
                                  height: height*0.05,
                                  color: Colors.transparent,
                                  child: Text("Precio: Bs. ${listPublication.price}",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14.0
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
