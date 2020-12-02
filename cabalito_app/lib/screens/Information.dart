import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationView extends StatefulWidget{
  State createState() => InformationViewState();
}
class InformationViewState extends State<InformationView>{

  @override
  void initState(){
    super.initState();
  }

  final List<String> _listItem = [
    'assets/alvin.jpg',
    'assets/joma.jpg',
    'assets/erwin.jpg',
    'assets/sil.jpg',
  ];

  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height*0.30,
            decoration: BoxDecoration(
              color: PrimaryColor,
            ),
          ),
          Container(
            height: size.height*0.20,
            decoration: BoxDecoration(
                color: PrimaryColor,
                image: DecorationImage(
                    alignment: Alignment.center,
                    scale: 11,
                    image: AssetImage('assets/logo.png')
                )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: size.width*0.07,right: size.width*0.07),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.16),
                    height: size.height*0.185,
                    width: size.width*0.85,
                    decoration: BoxDecoration(
                        color: color4,
                        borderRadius: BorderRadius.circular(29.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0,10.0),
                          )
                        ]
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size.width*0.07),
                      child: Column(
                        children: [
                          Description(text: 'Cabalito es una aplicación que '
                              'centraliza la compra y venta de vehiculos '
                              'de segunda mano. '
                              'Lo que buscamos es simplificar '
                              'y brindar seguridad a los compradores y vendedores '
                              'miembros de Cabalito.'
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(
                    height: size.height*0.015,
                  ),
                  Text(
                    "Equipo Cabalito",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.015,
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: _listItem.map((item) => Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(0.0,10.0),
                                  )
                                ],
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      color: PrimaryColor,
                                      width: 4
                                  )
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(item),
                                        fit: BoxFit.cover
                                    ),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: SecondaryColor,
                                        width: 2
                                    )
                                ),
                              ),
                            )
                        )).toList(),
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget{
  final String text;

  Description({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 13,
        ),
        textAlign: TextAlign.justify,
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