import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../helper/changeDoubleToDate.dart';
import '../chartTitle.dart';
import '../data_sheet_api.dart';
import '../datasetField.dart';

class ChartHomePage extends StatefulWidget {
  const ChartHomePage({ Key? key }) : super(key: key);

  @override
  State<ChartHomePage> createState() => _ChartHomePageState();
}

class _ChartHomePageState extends State<ChartHomePage> {
  List<DataSet> data= [
    DataSet(date: '0/0/0', time: '0', temperature: 0.0, humidity: 0.0, light: 0.0),   // 1
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 2
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 3
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 4
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 5
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 6
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 7
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 8
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 9
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 10
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 11
    DataSet(date: '0/0/0', time: '00', temperature: 0.0, humidity: 0.0, light: 0.0),   // 12
  ];
  int lengthList=0;

  Future getParameter() async{
    final data = await DataSheetApi.getAll();

    setState(() {
      this.data= data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getParameter();
  }



  @override
  Widget build(BuildContext context)=> 
  Container(
    color: Colors.white,
    width: 500,
    height: 500,
    child: LineChart(
      LineChartData(
        lineTouchData: ChartTitle.lineTouchData1(),
        gridData: ChartTitle.gridData(),
        titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              getTitlesWidget: (double value, TitleMeta meta) {
                                // value = da
                                const style = TextStyle(
                                  color: Color(0xff72719b),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                );
                                Widget text;
                                switch (value.toInt()) {
                                  case 1:
                                    text = Text('${Changes().getTime(data[data.length-12].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 2:
                                    text = Text('${Changes().getTime(data[data.length-11].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 3:
                                    text = Text('${Changes().getTime(data[data.length-10].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 4:
                                    text = Text('${Changes().getTime(data[data.length-9].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 5:
                                    text = Text('${Changes().getTime(data[data.length-8].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 6:
                                    text = Text('${Changes().getTime(data[data.length-7].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 7:
                                    text = Text('${Changes().getTime(data[data.length-6].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 8:
                                    text = Text('${Changes().getTime(data[data.length-5].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 9:
                                    text = Text('${Changes().getTime(data[data.length-4].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 10:
                                    text = Text('${Changes().getTime(data[data.length-3].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 11:
                                    text = Text('${Changes().getTime(data[data.length-2].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  case 12:
                                    text = Text('${Changes().getTime(data[data.length-1].time!.toString())}', style: TextStyle(fontSize: 18,),);
                                    break;
                                  default:
                                    text = const Text('');
                                    break;
                                }

                                return SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  space: 10,
                                  child: RotationTransition(
                                    turns:  new AlwaysStoppedAnimation(-45/360),
                                    child: text,
                                  ),
                                );
                              },
                            showTitles: true,
                            interval: 1,
                            reservedSize: 40,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (double value, TitleMeta meta) {
                              const style = TextStyle(
                                color: Color(0xff75729e),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              );
                              String text;
                              switch (value.toInt()) {
                                case 10:
                                  text = '10';
                                  break;
                                case 20:
                                  text = '20';
                                  break;
                                case 30:
                                  text = '30';
                                  break;
                                case 40:
                                  text = '40';
                                  break;
                                case 50:
                                  text = '50';
                                  break;
                                case 60:
                                  text = '60';
                                  break;
                                case 70:
                                  text = '70';
                                  break;
                                case 80:
                                  text = '80';
                                  break;
                                case 90:
                                  text = '90';
                                  break;
                                case 100:
                                  text = '100';
                                  break;
                                default:
                                  return Container();
                              }

                              return Text(text, style: style, textAlign: TextAlign.center);
                            },
                            showTitles: true,
                            interval: 1,
                            reservedSize: 40,
                          ),
                        ),
              ),

        borderData: ChartTitle.borderData(),
        lineBarsData: [
                            LineChartBarData(
                              isCurved: false,
                              color: Colors.redAccent,
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                              spots: [
                                // for(int i=0;i<3;i++){
                                  
                                // },
                                FlSpot(1,  data[data.length-12].temperature!.toDouble()),
                                FlSpot(2,  data[data.length-11].temperature!.toDouble()),
                                FlSpot(3,  data[data.length-10].temperature!.toDouble()),
                                FlSpot(4,  data[data.length- 9].temperature!.toDouble()),
                                FlSpot(5,  data[data.length- 8].temperature!.toDouble()),
                                FlSpot(6,  data[data.length- 7].temperature!.toDouble()),
                                FlSpot(7,  data[data.length- 6].temperature!.toDouble()),
                                FlSpot(8,  data[data.length- 5].temperature!.toDouble()),
                                FlSpot(9,  data[data.length- 4].temperature!.toDouble()),
                                FlSpot(10, data[data.length- 3].temperature!.toDouble()),
                                FlSpot(11, data[data.length- 2].temperature!.toDouble()),
                                FlSpot(12, data[data.length- 1].temperature!.toDouble()),
                              ],
                            ),
                            LineChartBarData(
                              isCurved: false ,
                              color: Colors.lightBlueAccent,
                              barWidth: 5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: false,
                                color: const Color(0x00aa4cfc),
                              ),
                              spots: [
                                FlSpot(1,  data[data.length-12].humidity!.toDouble()),
                                FlSpot(2,  data[data.length-11].humidity!.toDouble()),
                                FlSpot(3,  data[data.length-10].humidity!.toDouble()),
                                FlSpot(4,  data[data.length- 9].humidity!.toDouble()),
                                FlSpot(4,  data[data.length- 9].humidity!.toDouble()),
                                FlSpot(5,  data[data.length- 8].humidity!.toDouble()),
                                FlSpot(6,  data[data.length- 7].humidity!.toDouble()),
                                FlSpot(7,  data[data.length- 6].humidity!.toDouble()),
                                FlSpot(8,  data[data.length- 5].humidity!.toDouble()),
                                FlSpot(9,  data[data.length- 4].humidity!.toDouble()),
                                FlSpot(10, data[data.length- 3].humidity!.toDouble()),
                                FlSpot(11, data[data.length- 2].humidity!.toDouble()),
                                FlSpot(12, data[data.length- 1].humidity!.toDouble()),
                              ],
                            ),
                            LineChartBarData(
                              isCurved: false,
                              color: Colors.green,
                              barWidth: 5 ,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                              spots:  
                              [
                                
                                // getlist(),
                                
                                FlSpot(1,  data[data.length-12].light!.toDouble()),
                                FlSpot(2,  data[data.length-11].light!.toDouble()),
                                FlSpot(3,  data[data.length-10].light!.toDouble()),
                                FlSpot(4,  data[data.length- 9].light!.toDouble()),
                                FlSpot(4,  data[data.length- 9].light!.toDouble()),
                                FlSpot(5,  data[data.length- 8].light!.toDouble()),
                                FlSpot(6,  data[data.length- 7].light!.toDouble()),
                                FlSpot(7,  data[data.length- 6].light!.toDouble()),
                                FlSpot(8,  data[data.length- 5].light!.toDouble()),
                                FlSpot(9,  data[data.length- 4].light!.toDouble()),
                                FlSpot(10, data[data.length- 3].light!.toDouble()),
                                FlSpot(11, data[data.length- 2].light!.toDouble()),
                                FlSpot(12, data[data.length- 1].light!.toDouble()),
                              ],
                              
                            ),
        ],
        minX: 0,
        maxX: 13,
        maxY: 110,
        minY: 0,
      )
      )
    );




    // List<FlSpot> getlist(){
    //   List<FlSpot> accList = [];
    //   for (int i=0;i<12;i++)
    //   {
    //     accList.add(FlSpot(i+1,(i+1)*10))  ;
    //     // list.add(FlSpot(x, y));
        
    //   }
    //   return accList;
    // }
}