import 'package:cabalitoapp/bloc/bloc/NavigationBloc.dart';
import 'package:cabalitoapp/bloc/state/NavigationState.dart';
import 'package:cabalitoapp/lib/Colors.dart';
import 'package:cabalitoapp/screens/AddPublication.dart';
import 'package:cabalitoapp/screens/MechanicList.dart';
import 'package:cabalitoapp/screens/Seller.dart';
import 'package:cabalitoapp/screens/Template.dart';
import 'package:cabalitoapp/screens/UpdateSeller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'ViewPublication.dart';

class Home extends KFDrawerContent{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  double statusBarHeight;
  Size size;
  String titulo;
  Widget pagina;
  @override
  Widget build(BuildContext context) {
    statusBarHeight= MediaQuery.of(context).padding.top;
    size= MediaQuery.of(context).size;
    return BlocBuilder<NavigationBloc,NavigationState>(
      builder:(context,stateNavigation) {
        return Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height:size.height*0.13,
                  ),
                  Expanded(

                        child: stateNavigation.props[1]
                  ),
                ],
              ),
              Container(
                height: size.height*0.17,
                width: size.width,
                child: CustomPaint(
                    painter: ShapePainter(),
                    child: Stack(
                      children: [
                        Container(
                          height: size.height*0.17,
                          child: Row(
                            children:[IconButton(
                              icon: Icon(Icons.menu, color: Colors.white,size: size.height*0.035),
                              onPressed: widget.onMenuPressed,
                            ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          child: Center(
                            child: Text(stateNavigation.props[0],style: TextStyle(color: color4,fontSize: size.height*0.035),),
                          ),
                        )
                      ],
                    )
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    Size size1=Size(size.width, size.height+7);
    path.lineTo(0, size1.height);
    path.quadraticBezierTo(size1.width* 0.02, size1.height*0.78,   size1.width*0.1, size1.height*0.75);
    path.quadraticBezierTo(size1.width*0.15, size1.height*0.75, size1.width*0.3, size1.height*0.75);
    path.quadraticBezierTo(size1.width*0.5, size1.height*0.75, size1.width,  size1.height*0.75);
    path.quadraticBezierTo(size1.width*0.99, size1.height*0.75, size1.width,  size1.height*0.75);
    path.lineTo(size1.width, 0);
    path.close();

    paint.color = SecondaryColor;
    canvas.drawPath(path, paint);
    path =Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width* 0.02, size.height*0.78,   size.width*0.1, size.height*0.75);
    path.quadraticBezierTo(size.width*0.15, size.height*0.75, size.width*0.3, size.height*0.75);
    path.quadraticBezierTo(size.width*0.5, size.height*0.75, size.width,  size.height*0.75);
    path.quadraticBezierTo(size.width*0.99, size.height*0.75, size.width,  size.height*0.75);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = PrimaryColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}