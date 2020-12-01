import 'package:cabalitoapp/Home.dart';
import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/event/NavigationEvent.dart';
import 'package:cabalitoapp/screens/AddPublication.dart';
import 'package:cabalitoapp/screens/RegisterSeller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'ClassBuilder.dart';
import 'model/Seller.dart';

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
            text: Text("Inicio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.home,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(HomePageEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Agregar Publicación",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.add,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(AddPublicationPageEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Mecánicos",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.build,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(MechanicPageEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Lista de Publicación",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.view_list,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(PublicationListsEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Mis Publicaciones",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.supervised_user_circle,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(SellerPublicationEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Registro usuario",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.group_add,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(RegisterSellerPageEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Editar perfil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.edit,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(UpdateSellerPageEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Ver perfil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.supervisor_account,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(ViewSellerPageEvent());


            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("Splash",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.phone,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(SplashScreenEvent());
            },
          ),
          KFDrawerItem.initWithPage(
            text: Text("LogIn",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.login,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(LogInEvent());
            },
          ),



          /*
          KFDrawerItem.initWithPage(
            text: Text("Publicación",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            icon: Icon(Icons.view_list,color: Colors.white,
            ),
            onPressed: (){
              _drawerController.close();
              BlocProvider.of<NavigationBloc>(context).add(PublicationViewEvent());
            },
          ),
          */
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: KFDrawer(
         controller: _drawerController,
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

   );
  }
}