import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({ Key? key }) : super(key: key);

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {

  int lengthNumPage=8;
  int vt=1;
  int index=1;
  String nut0='<<', nut1='1', nut2='2', nut3="3", nut4='8', nut5='>>';
  // String tam='...';



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //----------nut thu 0
        ElevatedButton(
          onPressed: (){
            setState(() {
              index=1;
              vt = int.tryParse(nut1.toString())!;
            });
          }, 
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // Background color
          ),
          child: Text(nut0,style: TextStyle(color: Colors.black))),


        //----------nut thu nhat
        ElevatedButton(
          onPressed: (){
            setState(() {
              index=1;
              vt = int.tryParse(nut1.toString())!;
            });
          }, 
          style: ElevatedButton.styleFrom(
            primary: index == 1 ?  Color(0xff6849ef) : Colors.grey, // Background color
          ),
          child: Text(nut1)),

        //-----------nut thu hai ---------  
        ElevatedButton(
          onPressed: (){
            setState(() {
              index=2;
            });
          }, 
          style: ElevatedButton.styleFrom(
            primary: index == 2 ?  Color(0xff6849ef) : Colors.grey, // Background color
          ),
          child: Text(nut2)),

        //-------------nut thu 3 ----------------
        ElevatedButton(
          onPressed: (){
            setState(() {
              index=3;
            });
          }, 
          style: ElevatedButton.styleFrom(
            primary: index == 3 ?  Color(0xff6849ef) : Colors.grey, // Background color
          ),
          child: Text(nut3)),

        //------Text-----------------
        ElevatedButton(
          onPressed: (){
            setState(() {
              index=8;
              vt = int.tryParse(nut1.toString())!;
            });
          }, 
          style: ElevatedButton.styleFrom(
            primary: index == 8 ?  Color(0xff6849ef) : Colors.grey, // Background color
          ),
          child: Text(nut4)),


        // -----------nut thu 4----------
        ElevatedButton(
          onPressed: (){
            setState(() {
              index=4;
            });
          }, 
          style: ElevatedButton.styleFrom(
            primary:  Colors.white, // Background color
          ),
          child: Text(nut5,style: TextStyle(color: Colors.black)),
        )
      ],
    );
  }

  // Widget Button(bool checked)=>Button();

}