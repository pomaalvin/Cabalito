import 'package:auto_size_text/auto_size_text.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/model/PublicationList.dart';
import 'package:cabalitoapp/repository/PublicationRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_drawer/kf_drawer.dart';
import '../lib/Colors.dart';
import '../lib/ApiUrl.dart' as api;

class SellerPublicationList extends StatefulWidget{
  List<ListPublication> listPublications;
  SellerPublicationList(this.listPublications);
  @override
  State createState() => _PublicationList(listPublications);
}

class _PublicationList extends State<SellerPublicationList>{
  _PublicationList(this.listPublications);
  List<ListPublication> listPublications=List();
  ScrollController scrollController=ScrollController();
  TextEditingController buscarPublicacion = TextEditingController();
  int pagina=0;
  bool cargando=true;
  @override
  void initState(){
    super.initState();
    scrollController.addListener(() async{
      if(
      scrollController.position.maxScrollExtent==scrollController.offset&&cargando){
        pagina++;
        PublicationRepository publicationRepository=PublicationRepository();
        var pubs=await publicationRepository.getSellerPublicationList(pagina);
        if(pubs.length==0){
          setState(() {

            cargando=false;
          });
        }
        else{
          setState((){
            listPublications.addAll(pubs);
          });
        }
      }
    });
  }
  Size size;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Column(
            children: [

              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          color: color4,
                        ),
                        child: Column(
                          children: [
                            Expanded(

                              child: Container(

                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ScrollConfiguration(
                                          behavior: MyBehavior(),
                                          child: ListView.separated(
                                            separatorBuilder: (context,index){
                                              return SizedBox(height: 20,);
                                            },
                                            controller:scrollController,
                                            padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.width*0.1),
                                            itemBuilder: (context,index){
                                                if(index==listPublications.length){
                                                  return Container(
                                                    child: Column(
                                                      children: [
                                                        CircularProgressIndicator(

                                                          backgroundColor: Colors.transparent,
                                                          valueColor: new AlwaysStoppedAnimation<Color>(cargando?PrimaryColor:Colors.transparent),
                                                        )
                                                      ],
                                                    )
                                                  );
                                                }
                                                else{

                                                  return _ViewPublic(size.width*0.8,size.height*0.18,listPublications[index],context);
                                                }
                                            },
                                            itemCount: listPublications.length+1,
                                          ),

                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),],
          ),
    );
  }

}

Widget _ViewPublic (width, height,ListPublication listPublication,context){

    return Container(
          width: width-1,
          height: height,
          child: GestureDetector(

            onTap: () async {
              BlocProvider.of<NavigationBloc>(context).add(SellerPublicationViewEvent(listPublication.idPublication));
            },


            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                        color: PrimaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10))
                    ),
                  ),
                ),
                Container(
                  height: height,

                  decoration:  BoxDecoration(
                    color: color4,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BorderListColor,
                        width: 1),
                    //#D4D4D5

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                            Container(
                              width: height,
                              height: height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(api.url+"image/"+listPublication.imagePath),
                                    fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                              ),
                            ),
                      SizedBox(
                        width: width*0.02,
                      ),
                      Expanded(

                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: height*0.28-4,
                                      padding: EdgeInsets.symmetric(horizontal: width*0.02),
                                      child: Center(
                                          child: Container(
                                            width: width,
                                            child: AutoSizeText(listPublication.title,
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              maxFontSize: 21,
                                              style: TextStyle(color:color3,fontSize: 21,fontWeight: FontWeight.bold),
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      height: height*0.1,
                                    ),
                                    Container(
                                      height: height*0.13,
                                      padding: EdgeInsets.symmetric(horizontal: width*0.02),
                                      child: Center(
                                          child: Container(
                                            width: width,
                                            child: AutoSizeText("Precio: "+listPublication.price.toString()+r" $",
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              maxFontSize: 21,
                                              style: TextStyle(color:color3,fontSize: 21),
                                            ),
                                          )
                                      ),
                                    ),
                                  ],
                                )),


                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        );

  }


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Busqueda extends StatelessWidget{
  TextEditingController controller;
  Busqueda(this.controller);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color3.withOpacity(0.4),width: 2)
      ),
      child: TextField(
        controller: controller,
        cursorColor: color3.withOpacity(0.6),
        cursorWidth: 1,
        style: TextStyle(color: color3.withOpacity(0.6),fontSize: 18),
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10,top: 15,bottom: 0,right: 0),
          hintText: "Buscar publicacion",
          suffixIcon:Icon(Icons.search,color: color3.withOpacity(0.6),) ,

          hintStyle: TextStyle(color: color3.withOpacity(0.3)),
          // focusColor: Colors.white,
          // labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
