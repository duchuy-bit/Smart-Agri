import 'package:datn/screen/tkListPage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../helper/changeDoubleToDate.dart';
import '../chartTitle.dart';
import '../data_sheet_api.dart';
import '../datasetField.dart';




class TkStatiticPage extends StatefulWidget {
  const TkStatiticPage({ Key? key }) : super(key: key);

  @override
  State<TkStatiticPage> createState() => _TkStatiticPageState();
}

class _TkStatiticPageState extends State<TkStatiticPage> {

  String dropdownValue = 'One';
  String dropdownValue1 = 'One';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Column(
                        children: [
                          Text('alo'),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ],
                      ),
                    ),


                    Container(
                      height: 200,
                      width: 200,
                      child: Column(
                        children: [
                          Text('alo'),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
      ],
    );
    
    
    
     Container(
      child: Column(
        children: [
          Text('Aloooooooooo'),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              
              shrinkWrap: true,
              children: [
                Text('Chọn thông số'),
      // TextField(),
      DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Chọn điều kiện'),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                // TextField(),
              ],
            ),

            // Column(
              // children:const [
                Text('Giá trị'),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                )
                // TextField(

                // ),
              // ],
            // ),
          ],
        ),
      ),
              ],
              
            ),
          ),
          // TkListPage(),
        ],
      ),
    );
  }
}



