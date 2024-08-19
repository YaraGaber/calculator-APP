import 'dart:math';

import 'package:flutter/material.dart';
import 'buttom.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String res='';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Calculator'),
       centerTitle: true,
     ),
     body: Column(
         children: [
           Expanded(
             child: Row(
               children: [
               Text(res,style: TextStyle(fontSize: 20),)
             ],),
           ),
           Expanded(
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Buttom(text: 'C',onClick: clear) ,
                 Buttom(text: 'cos',onClick: operatorClick) ,
                 Buttom(text: '%',onClick: operatorClick) ,
                 Buttom(text: 'Del',onClick: backspace) ,

               ],
             ),

           ),
          Expanded(
               child: Row(
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                  Buttom(text: '7',onClick: onClickDiget) ,
                   Buttom(text: '8',onClick: onClickDiget) ,
                   Buttom(text: '9',onClick: onClickDiget) ,
                   Buttom(text: '*',onClick: operatorClick) ,

                 ],
               ),

             ),
           Expanded(child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
           Buttom(text: '4',onClick: onClickDiget) ,
           Buttom(text: '5',onClick: onClickDiget) ,
           Buttom(text: '6',onClick: onClickDiget) ,
           Buttom(text: '/',onClick:operatorClick) ,

         ],
     ),),
           Expanded(child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Buttom(text: '1',onClick: onClickDiget) ,
               Buttom(text: '2',onClick: onClickDiget) ,
               Buttom(text: '3',onClick: onClickDiget) ,
               Buttom(text: '+',onClick: operatorClick) ,

             ],
           ),),
           Expanded(child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Buttom(text: '.',onClick: onClickDiget) ,
               Buttom(text: '0',onClick: onClickDiget) ,
               Buttom(text: '=',onClick: equalClick) ,
               Buttom(text: '-',onClick: operatorClick) ,

             ],
           ),)
     ])
   );
  }

  void onClickDiget(String text){
    res+= text;
    setState(() {

    });
    }
  String lhs ='';
  String operator ='';

  void operatorClick(String clickOperator){
      if (operator.isEmpty){
        lhs =res;

      }else{
       String rhs =res;
      lhs=  calculate(lhs,operator,rhs);

      }
      operator = clickOperator;
      res='';
      setState(() {

      });
   }

  String calculate(String lhs, String operator, String rhs) {
     double num1= double.parse(lhs);
     double num2= double.parse(rhs);
     double result = 0.0;
     if (operator == '+'){
       result = num1 + num2;
     }else if(operator == '-'){
       result = num1 - num2;
     }else if(operator == '*'){
       result = num1 * num2;
     }else if(operator == '/'){
       result = num1 / num2;
     }else if(operator == '%'){
       result = num1 % num2;
     }else if(operator == 'cos'){
       result = cos(num1 * (pi / 180.0));
     }
     return result.toString();
  }

  void equalClick(String text){
     String rhs = res;
     res= calculate(lhs, operator, rhs);
     lhs='';
     operator= '';
     setState(() {

     });

  }
  void clear(String text) {
    res = '';
    lhs = '';
    operator = '';
    setState(() {});
  }
  void backspace(String text) {
    if (res.isNotEmpty) {
      res = res.substring(0, res.length - 1);
      setState(() {});
    }
  }
}