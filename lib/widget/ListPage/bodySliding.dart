import 'package:datn/data_sheet_api.dart';
import 'package:datn/datasetField.dart';
import 'package:datn/helper/changeDoubleToDate.dart';
import 'package:flutter/material.dart';

class BodySliding extends StatefulWidget {
  List<DataSet>? data;

  BodySliding({ Key? key , this.data}) : super(key: key);

  @override
  State<BodySliding> createState() => _BodySlidingState();
}

class _BodySlidingState extends State<BodySliding> {

  int? sortColumnIndex = 0;
  bool isAscending = false;
  int lengthData=0;
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
  List<DataSet> dataMain= [
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

  int page=0;
  List<int> dropDownList = [10, 12 ,20,24,48,60,72];
  int? selectedItemDropDown =10;

  void cutRow(int selectedItemDropDown,int page){
    setState(() {
      data.removeRange(0, data.length);
    });
    print('page = $page');
    var start = page * selectedItemDropDown;
    var end = page * selectedItemDropDown + selectedItemDropDown;
    for(int i= start;i<end;i++)
    {
      setState(() {
        data.add(dataMain[i]);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getParameter();

    cutRow(selectedItemDropDown!, 0);
  }

  Future getParameter() async{
    final dataLast = await DataSheetApi.getLastRow();
    final data = await DataSheetApi.getAll();


    setState(() {
      this.data= data;
      this.data= this.data.reversed.toList();

      this.dataMain.removeRange(0, dataMain.length);
      this.dataMain = data;
      this.lengthData=this.data.length;
      this.dropDownList.add(this.lengthData);

      this.data.removeRange(0, data.length);
      for(int i= 0;i<10;i++)
      {
        this.data.add(dataMain[i]);
      }
    });

    print(data.length);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InputRow(),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SlidePage(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: buildDataTable())
          ),
        ],
      ),
    );
  }


  Widget buildDataTable() {
    final columns = ['Ngày', 'Thời gian', 'Nhiệt Độ', 'Độ ẩm', 'Ánh sáng'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        
        
        DataTable(
          sortAscending: isAscending,
          
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(data),
        ),
        
        Test(Colors.white),
      ],
    );
  }

  Widget SlidePage()=> Container(
    height: 60,
    width: MediaQuery.of(context).size.width-50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment,
      children: [
        ElevatedButton(
            onPressed: (){
              setState(() {
                if(page>0) page--;
                cutRow(selectedItemDropDown!, page);
              });
            }, 
            style: ElevatedButton.styleFrom(
              primary: Color(0xff886ff2), // Background color
            ),
            child: Text('<',style: TextStyle(color: Colors.black))
        ),

        Text('${page+1}/${(lengthData~/selectedItemDropDown!)+1}'),

        Padding(
          padding: EdgeInsets.only(
            // left: MediaQuery.of(context).size.width-190
            ),
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  if(page<(lengthData~/selectedItemDropDown!))    { 
                    page++;     
                  }
                  if(page == (lengthData~/selectedItemDropDown!))    {
                    print('full');
                    setState(() {
                      data.removeRange(0, data.length);
                    });
                    print('page = $page');
                    var start = page * selectedItemDropDown!;
                    var end = lengthData;
                    for(int i= start;i<end;i++)
                    {
                      setState(() {
                        data.add(dataMain[i]);
                      });
                    }
                  }
                  else cutRow(selectedItemDropDown!, page);
                  // cutRow(selectedItemDropDown!, page);
                });
              }, 
              style: ElevatedButton.styleFrom(
                primary: Color(0xff886ff2), // Background color
              ),
              child: Text('>',style: TextStyle(color: Colors.black))
          ),
        ),

      ],
    ),
  );

  Widget Test(Color color)=> Container(
    color: color,
    width: MediaQuery.of(context).size.width,
    height: 200,
  );
  
  Widget InputRow()=>  Padding(
    padding: const EdgeInsets.only(top: 20,left:20,bottom: 5),
    child: Row(
      children: [
        
        Text('Hiển thị    ',style: TextStyle(fontSize: 18),),
        DropdownButton(
          value: selectedItemDropDown,
          items: dropDownList.map((item) {
                return  DropdownMenuItem<int>(
                  child:  Text(item.toString(),
                            style: TextStyle(fontSize: 18),),
                            value: int.parse(item.toString()), //FAIL
                                    );
                                  }).toList(),
                                  onChanged: (selected)
                        => setState(() {
                            page=0;
                            selectedItemDropDown = int.parse(selected.toString());
                            print(selectedItemDropDown);
                            cutRow(selectedItemDropDown!, page);
                        })),
        Text('   hàng',style: TextStyle(fontSize: 18),),
      ],
    ),
  );

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column,style: TextStyle(fontWeight: FontWeight.bold),),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<DataSet> users) => users.map((DataSet user) {
        String date= "${Changes().changeDoubleToDate(user.date!).day}/${Changes().changeDoubleToDate(user.date!).month}/${Changes().changeDoubleToDate(user.date!).year}";
        String time ="${Changes().changeDoubleToDate(user.time!).hour}: ${Changes().changeDoubleToDate(user.time!).minute}";
        final cells = [date, time, user.temperature,user.humidity,user.light];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      data.sort((user1, user2) =>
          compareString(ascending, user1.date!, user2.date!));
    } else if (columnIndex == 1) {
      data.sort((user1, user2) =>
          compareString(ascending, user1.time!, user2.time!));
    } else if (columnIndex == 2) {
      data.sort((user1, user2) =>
          compareString(ascending, '${user1.temperature}', '${user2.temperature}'));
    }else if (columnIndex == 3) {
      data.sort((user1, user2) =>
          compareString(ascending, '${user1.humidity}', '${user2.humidity}'));
    }else if (columnIndex ==4) {
      data.sort((user1, user2) =>
          compareString(ascending, '${user1.light}', '${user2.light}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

