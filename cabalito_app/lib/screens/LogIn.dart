import 'package:cabalitoapp/lib/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LogIn extends StatefulWidget{
  @override
  State createState() => LogInState();
}
class LogInState extends State<LogIn>{
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              PrimaryColor,
              Color.fromRGBO(1, 89, 70, 1),
              SecondaryColor,
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.032,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Iniciar Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.020,
                  ),
                  Text("Bienvenidos",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Expanded(
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
                          height: MediaQuery.of(context).size.height*0.06
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
                              padding: EdgeInsets.only(left: 15,top: 4,bottom: 4),
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
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15,top: 4,bottom: 4),
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
                                    border: InputBorder.none
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      FlatButton(
                          onPressed: (){},
                          child: Text(
                            "Registrarse",
                            style: TextStyle(
                              color: BorderListColor,
                              fontSize: 15
                            ),
                          )
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
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
                        height: 40,
                      ),
                      Text(
                        "Encuentranos en:",
                        style: TextStyle(
                            color: BorderListColor,
                            fontSize: 15
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                              ),
                              child: Center(
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Facebook",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                      ),
                                    )
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.redAccent
                              ),
                              child: Center(
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Gmail",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15
                                      ),
                                    )
                                ),
                              ),
                            ),
                          )
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