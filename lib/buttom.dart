import 'package:flutter/material.dart';

class Buttom extends StatelessWidget{
  String text;
  Function onClick ;
  Buttom({required this.text,required this.onClick });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Expanded(
        child: Container(
          padding: EdgeInsets.all(2),
          child: ElevatedButton(onPressed:(){
            onClick(text);
          }, child: Text(
            text,style: TextStyle(fontSize: 20),)),
        ));
  }

}