import 'package:datn/helper/changeDoubleToDate.dart';
import 'package:datn/chart/chart_homePage.dart';
import 'package:datn/data_sheet_api.dart';
import 'package:datn/datasetField.dart';
import 'package:datn/screen/tkStatiticPage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  DataSet dataLast = new DataSet(
      date: '36526',
      time: '0',
      temperature: 0.0,
      humidity: 0.0,
      light: 0.0);

  List<DataSet> data= [
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 1
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 2
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 3
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 4
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 5
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 6
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 7
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 8
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 9
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 10
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 11
    DataSet(date: '36526', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 12
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getParameter();
  }

  DateTime changeDoubleToDate(String n){
    const gsDateBase = 2209161600 / 86400;
    const gsDateFactor = 86400000;
    
    final date = double.tryParse(n.toString());
    final millis = (date! - gsDateBase) * gsDateFactor;
    return DateTime.fromMillisecondsSinceEpoch(millis.toInt(), isUtc: true);
  }

  Future getParameter() async{
    final dataLast = await DataSheetApi.getLastRow();
    final data = await DataSheetApi.getAll();


    setState(() {
      this.dataLast=dataLast!;
      this.data= data;

    //   const gsDateBase = 2209161600 / 86400;
    // const gsDateFactor = 86400000;

    // // final date = double.tryParse("44528");
    // final date = double.tryParse(dataLast.date.toString());
    // if (date == null) return ;
    // final millis = (date - gsDateBase) * gsDateFactor;
    // print('Test=');
    
    // print(DateTime.fromMillisecondsSinceEpoch(millis.toInt(), isUtc: true));
    // print('minisecon= $millis');
    });

    // for(int i=this.data.length-12 ; i<this.data.length ; i++)
    //   {
    //     print(this.data[i].time);
    //   }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 197, 196, 196),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Parameter(),

            // LastData(),
            Content(),

            Center(
              child:  Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 100),
                  child: Container(padding: EdgeInsets.all(15),                                   
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const ChartHomePage(),
                  ),
                ),
              ),

            Footer(),
            
            //
            // Test(Colors.pink),
            // Test(Colors.redAccent),
            // Test(Colors.purple),
            // Test(Colors.blue),
            // Test(Colors.black),
            // Test(Colors.white),
            // Test(Colors.orange),
            // ChartThreeInOne(),
          ],
        ),
      ),
    );
  }
  
  Widget Content()=>Padding(
    padding: const EdgeInsets.only(top: 20,left: 20),
    child: Row(
      children: [
        Text("Thông số trong vòng 12h gần nhất",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

      ],
    ),
  );

  Widget Test(Color color)=> Container(
    color: color,
    width: 500,
    height: 500,
  );

  Widget LastData() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("${data[data.length-1].date.toString()}"),
      // Text("${Changes().tinh(dataLast.date!.toString())}"),
      // Text("${DateTime.fromMicrosecondsSinceEpoch(Changes().tinh(dataLast.date!.toString()))}"
      // ),
      Text("${changeDoubleToDate(dataLast.date.toString())}"),
      Text("${data[data.length-3].temperature!.toDouble()-1}"),
      Text("${data[data.length-1].humidity!.toDouble()}"),
      Text("${data[data.length-1].light!.toDouble()}"),
      // Text(Changes.)
    ],
  );

  Widget Parameter() => Container(
    padding: const EdgeInsets.only(top: 30,bottom: 30,left: 5,right: 5),
    decoration: const BoxDecoration(
      color: Color(0xff6849ef) ,
      gradient: LinearGradient(
        colors: [
          Color(0xff6849ef),
          Color(0xff886ff2),
        ]
      ),
      borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(25.0),
          // topRight: Radius.circular(25.0),
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0)),

    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1,bottom: 35),
            child: Text("Hello! \n    ${changeDoubleToDate(dataLast.date!).day.toString()}/${changeDoubleToDate(dataLast.date!).month.toString()}/${changeDoubleToDate(dataLast.date!).year.toString()} ${changeDoubleToDate(dataLast.time!).hour.toString()}:${changeDoubleToDate(dataLast.time!).minute.toString()}${changeDoubleToDate(dataLast.time!).minute ==0 ? 0 : null} ",
            style:
                TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold)
            ),
          ),
          // Text("",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery. of(context). size. width/3.5 ,
                height: MediaQuery. of(context). size. width/5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Icon(Icons.thermostat,size: 40,),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(50)
                      ),),
                    Text(dataLast.temperature.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
              //--------------------------------
              Container(
                width: MediaQuery. of(context). size. width/3.5,
                height: MediaQuery. of(context). size. width/5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Icon(Icons.water_drop,size:40),
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    Text(dataLast.humidity.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
              //--------------------------------
              Container(
                width: MediaQuery. of(context). size. width/3.5,
                height: MediaQuery. of(context). size. width/5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                        child: Icon(Icons.light_mode,size:40) ,
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    
                    Text(dataLast.light.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );

  Widget Footer()=> Container(
    width: MediaQuery. of(context). size. width,
    height: 20,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 197, 196, 196),

    ),
  );
}


