import 'package:cabalitoapp/Home.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'ClassBuilder.dart';

class Menu extends StatefulWidget{
  @override
  State createState() => MenuState();
}
class MenuState extends State<Menu>{
  KFDrawerController _drawerController;
  @override
  void initState(){
    super.initState();
    _drawerController = KFDrawerController(
        initialPage: ClassBuilder.fromString('Home'),
        items: [
          KFDrawerItem.initWithPage(
            text: Text("Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.home,color: Colors.white,
            ),
            page: Home(),
          ),

        ]
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: BlocProvider(
       create:(context2)=>NavigationBloc(),
       child: KFDrawer(
         controller: _drawerController,
         header: Align(
           alignment: Alignment.centerLeft,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0),
             width: MediaQuery.of(context).size.width*0.6,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text("Scarlet",style:
                 TextStyle(
                     fontSize: 17,
                     color: Colors.white
                 ),
                 ),
                 SizedBox(
                   height: 2,
                 ),
                 Text("Actress",style:
                 TextStyle(
                     fontSize: 15,
                     color: Colors.white
                 ),
                 ),
               ],
             ),
           ),
         ),
         footer: KFDrawerItem(
           text: Text("Logout",
             style: TextStyle(
               color: Colors.white,
               fontSize: 18,
             ),
           ),
         ),
         decoration: BoxDecoration(
           color: Color.fromRGBO(20, 61, 89, 1),
         ),
       ),
     )

   );
  }
}