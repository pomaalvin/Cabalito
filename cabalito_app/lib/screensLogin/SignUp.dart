import 'package:cabalitoapp/bloc/bloc/LogInBloc.dart';
import 'package:cabalitoapp/bloc/event/LoginEvent.dart';
import 'package:cabalitoapp/bloc/state/LoginState.dart';
import 'package:cabalitoapp/lib/Alerts.dart';
import 'package:cabalitoapp/lib/Colors.dart';
import 'package:cabalitoapp/model/LoginRequest.dart';
import 'package:cabalitoapp/model/Seller.dart';
import 'package:cabalitoapp/screens/Information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class SignUp extends StatefulWidget{
  @override
  State createState() => _SignUpState();
}
class _SignUpState extends State<SignUp>{

  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
    return WillPopScope(
      onWillPop: ()async{


        BlocProvider.of<LogInBloc>(context).add(LogInPageEvent());
        return false;
      },
      child: BlocBuilder<LogInBloc,LogInBlocState>(
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
                      margin: EdgeInsets.only(top: size.height*0.15),

                      decoration: BoxDecoration(
                        color: color4,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                      ),
                      height: size.height*0.85,
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
                                          input(size, "Nombres", Icons.person_add, name),
                                          input(size, "Apellidos", Icons.person, lastname),
                                          input(size, "Numero telefonico", Icons.phone, phone),
                                          input(size, "Correo Electrónico", Icons.email, email),
                                          input(size, "Contraseña", Icons.vpn_key,password),
                                          input(size, "Confirmar Contraseña", Icons.vpn_key, confirmPassword),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height*0.03,
                              ),
                              FlatButton(
                                      onPressed: (){
                                        _signUp(context);
                                      },
                                      child:  Container(
                                        height: 50,
                                        margin: EdgeInsets.symmetric(horizontal: size.width*0.15),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: PrimaryColor
                                        ),
                                        child: Center(
                                            child:Text(
                                        "Registrarse",
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
                                    "¿Ya tienes una cuenta?",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: (){

                                    BlocProvider.of<LogInBloc>(context).add(LogInPageEvent());
                                  },
                                  child: Center(
                                    child: Text(
                                      "Iniciar Sesión",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 15
                                      ),
                                    ),
                                  )
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
                      height: size.height*0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Registrarse",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    (state is SignUpLoadingState)?Container(
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
      return Stack(
        children: [
          Scaffold(
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
                    height: size.height*0.005,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Cabalito",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: size.height*0.020,
                        ),
                        Text("Registrate",
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
                    height: size.height*0.73,
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
                                  input(size, "Nombres", Icons.person_add, name),
                                  input(size, "Apellidos", Icons.person, lastname),
                                  input(size, "Numero telefonico", Icons.phone, phone),
                                  input(size, "Correo Electrónico", Icons.email, email),
                                  input(size, "Contraseña", Icons.vpn_key,password),
                                  input(size, "Confirmar Contraseña", Icons.vpn_key, confirmPassword),

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
                                    onPressed: (){},
                                    child: Text(
                                      "Registrarse",
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
                              "¿Ya tienes una cuenta?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15
                              ),
                            ),
                            FlatButton(
                              padding: EdgeInsets.all(0),
                                height: 10,
                                onPressed: (){

                                  BlocProvider.of<LogInBloc>(context).add(LogInPageEvent());
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "Iniciar Sesión",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
      );
      }
      ),
    );

  }
  Widget input(size,text,icon,controller){
    return Container(
      padding: EdgeInsets.only(left: size.width*0.045,top: size.width*0.01,bottom: size.width*0.01),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: BorderListColor
              )
          )
      ),
      child: TextField(
        cursorColor: Colors.black,
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16
            ),
            border: InputBorder.none,
            prefixIcon: Icon(icon,
              color: Colors.grey,
            )
        ),
      ),
    );
  }
  bool _verificarCampos(){
    if(name.text.isEmpty||lastname.text.isEmpty||phone.text.isEmpty||email.text.isEmpty||password.text.isEmpty||confirmPassword.text.isEmpty){
      return false;
    }
    else{
      return true;
    }
  }
  _signUp(context){
    if(_verificarCampos()){
      Seller seller=Seller();
      seller.firstName=name.text;
      seller.lastName=lastname.text;
      seller.phoneNumber=phone.text;
      seller.email=email.text;
      seller.imagePath="vacio";
      LoginRequest loginRequest=LoginRequest();
      loginRequest.email=email.text;
      loginRequest.password=password.text;
      if(password.text.length>6){
        if(password.text==confirmPassword.text) {
          BlocProvider.of<LogInBloc>(context).add(SignUpEvent(seller,loginRequest));
        }
        else{
          alertError("Las contraseñas no coinciden", context);
        }
      }
      else{
        alertGen("Las contraseñas debe tener al menos 6 carácteres", context);
      }
    }
    else{
      alertGen("Complete todos los campos.", context);
    }

  }

}