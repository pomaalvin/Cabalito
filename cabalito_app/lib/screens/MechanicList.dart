import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MechanicList extends StatefulWidget{
  @override
  State createState() => MechanicListState();
}

class MechanicListState extends State<MechanicList>{
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(20, 61, 89, 1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:EdgeInsets.only(top: 15.0, left:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                    iconSize: 28.0,
                    onPressed: (){
                    }
                ),
                Container(
                  width: MediaQuery.of(context).size.width-100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Mecánicos",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 180, 26, 1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
              ),
              Container(
                margin: new EdgeInsets.only(top: 6.0),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                  primary: false,
                  padding: EdgeInsets.only(left:25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height-150.0,
                        child: ListView.builder(
                          itemBuilder: (context, index){
                            return ListTile(title: Text('Item $index'),);
                          },
                          itemCount: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}