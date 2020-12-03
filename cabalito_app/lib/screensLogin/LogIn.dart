import 'package:cabalitoapp/bloc/bloc/LogInBloc.dart';
import 'package:cabalitoapp/bloc/event/LoginEvent.dart';
import 'package:cabalitoapp/bloc/state/LoginState.dart';
import 'package:cabalitoapp/lib/Alerts.dart';
import 'package:cabalitoapp/lib/Colors.dart';
import 'package:cabalitoapp/model/LoginRequest.dart';
import 'package:cabalitoapp/screens/Information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class LogIn extends StatefulWidget{
  @override
  State createState() => LogInState();
}
class LogInState extends State<LogIn>{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
    return BlocBuilder<LogInBloc,LogInBlocState>(
    builder: (context,state){
    return
      Scaffold(
        backgroundColor: color4,
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
          child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height*0.25),

            decoration: BoxDecoration(
              color: color4,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
            ),
            height: size.height*0.75,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(

                      children: [
                        Padding(
                              padding: EdgeInsets.all(28),
                              child: Column(
                                children: [
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
                                            controller: email,
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
                                            controller: password,
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

                                ],
                              ),
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
                                onPressed: (){
                                  _login();
                                },
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
                          height: size.height*0.05,
                        ),
                        Container(
                          child:  Center(
                            child: Text(
                              "¿No tienes una cuenta?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: (){

                              BlocProvider.of<LogInBloc>(context).add(SignUpPageEvent());
                            },
                            child: Center(
                              child: Text(
                                "Registrarse",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 15
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                          height: size.height*0.05,
                        ),
                        Container(
                          child:  Center(
                            child: Text(
                              "Encuentranos en:",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.01,
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
                              child: Center(
                                child: Icon(FontAwesomeIcons.github,
                              )
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height*0.03,
                        ),
                      ],
                    ),
                  ),
                ),
          ),
          Container(
            width: size.width,
            height: size.height*0.25,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
          (state is LogInLoadingState)?Container(
            color: color3.withOpacity(0.5),
            child:  Center(
              child: Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: new AlwaysStoppedAnimation<Color>(PrimaryColor),
                ),
              ),
            ),
          ):Container()
        ],
          )
        ),
        );

    }
    );

  }
  _login(){
    if(email.text.isNotEmpty&&password.text.isNotEmpty){
      LoginRequest loginRequest=LoginRequest();
      loginRequest.password=password.text;
      loginRequest.email=email.text;
      BlocProvider.of<LogInBloc>(context).add(LogInEvent(loginRequest));
    }
    else{
      alertGen("Revise los campos llenados", context);
    }
  }
}