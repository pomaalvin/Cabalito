import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class LogIn extends StatefulWidget{
  @override
  State createState() => LogInState();
}
class LogInState extends State<LogIn>{
  @override
  void initState(){
    super.initState();
  }

  String _launchGithub = 'https://github.com/pjalvin/Cabalito';
  String _launchFacebook = 'https://www.facebook.com/Cabalito-104841941479769/?view_public_for=104841941479769';
  String _launchTwitter = 'https://twitter.com/Cabalito4';

  Future<void> _launchInBrowser(String url)async{
    if(await canLaunch(url)){
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String,String>{'header_key': 'header_value'},
      );
    }else{
      throw 'No se puede abrir $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              PrimaryColor,
              PrimaryColor
            ]
          )
        ),
        child: ListView(
          children: [
            SizedBox(
              height: size.height*0.032,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Iniciar Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.020,
                  ),
                  Text("Bienvenido",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height*0.025,
            ),
            Container(
              height: size.height*0.70,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(28),
                  child: Column(
                    children: [
                      SizedBox(
                          height: size.height*0.06
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(20, 61, 89, 0.3),
                            blurRadius: 20,
                            offset: Offset(0,10)
                          )
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: size.width*0.045,top: size.width*0.01,bottom: size.width*0.01),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: BorderListColor
                                  )
                                )
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Correo Electronico",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email,
                                    color: Colors.grey,
                                  )
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: size.width*0.045,top: size.width*0.01,bottom: size.width*0.01),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: BorderListColor
                                      )
                                  )
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Contraseña",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16
                                    ),
                                    border: InputBorder.none,
                                  prefixIcon: Icon(Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                ),
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      FlatButton(
                          onPressed: (){},
                          child: Text(
                            "Registrarse",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                            ),
                          )
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: size.width*0.15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: PrimaryColor
                        ),
                        child: Center(
                          child: FlatButton(
                              onPressed: (){},
                              child: Text(
                                "Ingresar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Text(
                        "Encuentranos en:",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Color(0xff00acee),
                            onPressed: (){
                              _launchInBrowser(_launchTwitter);
                            },
                            child: Icon(FontAwesomeIcons.twitter,
                            ),
                          ),
                          SizedBox(
                            width: size.width*0.06,
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              _launchInBrowser(_launchFacebook);
                            },
                            backgroundColor: Color(0xff3b5998),
                            child: Icon(FontAwesomeIcons.facebookSquare,
                            ),
                          ),
                          SizedBox(
                            width: size.width*0.06,
                          ),
                          FloatingActionButton(
                            onPressed: (){
                              _launchInBrowser(_launchGithub);
                            },
                            backgroundColor: Colors.black,
                            child: Icon(FontAwesomeIcons.github,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}