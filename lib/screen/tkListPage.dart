import 'package:datn/helper/changeDoubleToDate.dart';
import 'package:datn/widget/ListPage/bodySliding.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../data_sheet_api.dart';
import '../datasetField.dart';
class TkListPage extends StatefulWidget {
  const TkListPage({Key? key}) : super(key: key);

  @override
  State<TkListPage> createState() => _TkListPageState();
}

class _TkListPageState extends State<TkListPage> {
  int? sortColumnIndex = 0;
  bool isAscending = false;
  int lengthData=0;
  List<String> chooseIf=['Nhiệt độ','Độ ẩm','Ánh sáng'];
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

  List<DataSet> dataMainTam= [
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
  List<int> dropDownList = [10, 12 ,20, 24, 36, 48, 60, 72];
  List<int> dropDownList_1 = [10, 12 ,20, 24, 36, 48, 60, 72];
  int? selectedItemDropDown =10;
  String DateErrol = '';
  String DateErrolFinish = '';

  //  int dayTam =  Changes().changeDoubleToDate(dataMain[dataMain.length-1].date!.toString()).day;
  DateTime dateStart = DateTime(2021, 11, 27);
  DateTime dateFinish = DateTime(2022, 08, 16);
  DateTime dateFinishCheck = DateTime(2022, 08, 16);
  DateTime dateStartCheck = DateTime(2022, 08, 16);



  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getParameter();
    // giatri.value = 2000 as TextEditingValue;

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
      this.dataMain.reversed.toList();
      this.lengthData=this.data.length;
      this.dropDownList.add(this.lengthData);

      dateStart = DateTime(
        Changes().changeDoubleToDate(dataMain[0].date!).year,
        Changes().changeDoubleToDate(dataMain[0].date!).month,
        Changes().changeDoubleToDate(dataMain[0].date!).day,
      );

      dateFinish = DateTime(
        Changes().changeDoubleToDate(dataMain[dataMain.length-1].date!).year,
        Changes().changeDoubleToDate(dataMain[dataMain.length-1].date!).month,
        Changes().changeDoubleToDate(dataMain[dataMain.length-1].date!).day,
      );

      dateFinishCheck=dateFinish;
      dateStartCheck=dateStart;

      this.data.removeRange(0, data.length);
      for(int i= 0;i<10;i++)
      {
        this.data.add(dataMain[i]);
      }
    });

    print(data.length);
  }

  

  // int dayTam =  Changes().changeDoubleToDate(dataMain[dataMain.length-1].date!.toString()).day;
  // DateTime dateStart = DateTime(2021, 11, 27);
  // DateTime dateFinish = DateTime(Changes().changeDoubleToDate(dataMain[dataMain.length-1].date!).day, 11, 27);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SlidingUpPanel(backdropEnabled: true,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(50),
        ),
        minHeight: 155,
        maxHeight: MediaQuery.of(context).size.height/1.5,
        panelBuilder: (scrollController) => buildSlidingPanel(
            scrollController: scrollController,            
          ),
        body: BodySliding(),
      ) 
    );      
  
  }
  
  
  Widget buildSlidingPanel ({required ScrollController scrollController})=>
  Container(    
    decoration:const  BoxDecoration(
      color: Colors.white,
      borderRadius:  BorderRadius.vertical(
          top: Radius.circular(50),      
      ),    
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color(0xff886ff2),
              borderRadius:  BorderRadius.vertical(
                  top: Radius.circular(50),      
                  bottom: Radius.circular(50), 
              ),    
            ),
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 8,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),                
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text('Chọn điều kiện lọc dữ liệu',
                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),

        // Text('Chọn điều kiện lọc dữ liệu'),

        Flexible(
          child: ListView(
            children:  [
              // ------------list view thong bao loi chon ngay 1
              DateErrol != '' ? Text(DateErrol,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),)
                :Container(height: 1,width: 1,),

                // ------------list view thong bao loi chon ngay 2
              DateErrolFinish != '' ? Text(DateErrolFinish,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),)
              : Container(height: 1,width: 1,),
              
              // ------------list view chon ngay ------------------------------
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 16),
                child: Row(
                  children: [
                    //---------chọn ngày bắt đầu---------------
                    Text('Từ ngày: '),
                    Container(
                      // width: 100,
                      child: ElevatedButton(
                        child: Text('${dateStart.day}/${dateStart.month}/${dateStart.year}'),
                        onPressed: ()async{
                          DateTime? newDate = await showDatePicker(
                            context: context, 
                            initialDate: dateStart, 
                            firstDate: DateTime(2021), 
                            lastDate: DateTime(2022),
                            );
                          
                          if(newDate == null) return;

                          if(newDate.compareTo(dateStartCheck)< 0 ){
                            print('loi');
                            
                            setState(() {
                              DateErrol = 'Vui lòng nhập ngày bắt đầu Lớn hơn nữa';
                            });
                            return ;
                          }                    
                          
                          setState(() {
                            DateErrol = '';
                            dateStart = newDate;
                          });
                        },
                      ),
                    ),

                    //-------------------chọn ngày kết thúc-------------------
                    Text('Đến ngày: '),
                    Container(
                      // width: 100,
                      child: ElevatedButton(
                        child: Text('${dateFinish.day}/${dateFinish.month}/${dateFinish.year}'),
                        onPressed: ()async{
                          DateTime? newDate1 = await showDatePicker(
                            context: context, 
                            initialDate: dateFinish, 
                            firstDate: DateTime(2021), 
                            lastDate: DateTime(2023),
                            );
                          
                          if(newDate1 == null) return;

                          if(newDate1.compareTo(dateFinishCheck)> 0 ){
                            print('loi');
                            
                            setState(() {
                              DateErrolFinish = 'Vui lòng nhập ngày Kết thúc Nhỏ hơn';
                            });
                            return ;
                          }

                          setState(() {
                            DateErrolFinish='';
                            dateFinish = newDate1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //---------------------Điều kiện theo từng loại giá trị------------
              ChooseIF(0),

              //--------------------Button xac nhan loc du lieu ---------------
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    ElevatedButton( 
                      child: Text('Xác Nhận'),
                      onPressed: (){
                        // print("${dropdownValue} ${dropdownCompare} ${giatri.text}");

                        LocData();
                      },
                    ),
                  ],
                ),
              ),


              // Text('loi'),
            ],
          ),
        ),
      ],
    ),
  );

  int checkChoose1 = 0;
  String dropdownValue = 'Nhiệt độ';
  String dropdownCompare = '>';
  TextEditingController giatri =TextEditingController(text: '30');
  

  void cutRow(int selectedItemDropDown,int page){
    setState(() {
      data.removeRange(0, data.length);
    });
    // print('page = $page');
    var start = page * selectedItemDropDown;
    var end = page * selectedItemDropDown + selectedItemDropDown;
    for(int i= start;i<end;i++)
    {
      if (dropdownValue == 'Nhiệt độ'){
        if(SoSanh(
          double.parse(giatri.text), 
          double.parse(dataMain[i].temperature.toString()), 
          dropdownCompare)   == 0)
        {
          
          setState(() {
            data.add(dataMain[i]);
          });
        }
        else print('${dataMain[i].temperature}');
      }
      
    }

    // List<DataSet> listtam=[];
    //   for (int i=0;i<data.length;i++){
    //     if (dropdownValue == 'Nhiệt độ'){
    //       if(SoSanh(double.parse(giatri.text), double.parse(data[i].temperature.toString()), dropdownCompare) == 0)
    //       {
    //         // print()
    //         listtam.add(data[i]);
    //         print("${dropdownValue} ${dropdownCompare} ${giatri.text}  data = ${data[i].temperature.toString()}");
    //         // data.removeAt(i);
    //         // print('xoa');
    //         // for (int j=0;j<data.length;j++){
    //         //   print(data[j].temperature);
    //         // }
    //       }

    //     }
    //   }

    //   data.removeRange(0, data.length);
      
    //   for(int i= 0;i<listtam.length;i++){
    //     data.add(listtam[i]);
    //     print('${listtam[i].date}/${listtam[i].time} ${listtam[i].temperature} ${listtam[i].humidity} ${listtam[i].light}');
    //   }
    //   print('data');

    //   for(int i= 0;i<data.length;i++){
    //     print('${data[i].temperature} ${data[i].humidity} ${data[i].light}');
    //   }
  }


  void LocData(){
    DateTime datatam = DateTime(2021, 11, 27);
    // DateTime datatam2 = DateTime(2021, 11, 27);
    setState(() {
        data.removeRange(0, data.length);
        print('du lieu :');

        // datatam = DateTime(2021,11,30);
        // print('${datatam.day} / ${datatam.month} / ${datatam.year}: ${dateStart.compareTo(datatam)<=0 && dateFinish.compareTo(datatam) >= 0}');

        for(int i=0 ; i<dataMain.length ; i++)
        {
          datatam = DateTime(
          Changes().changeDoubleToDate(dataMain[i].date!).year,
          Changes().changeDoubleToDate(dataMain[i].date!).month,
          Changes().changeDoubleToDate(dataMain[i].date!).day,
          );
          // print('${datatam.day} / ${datatam.month} / ${datatam.year}: ${dateStart.compareTo(datatam)<=0}');

          if(dateStart.compareTo(datatam)<=0 && dateFinish.compareTo(datatam) >= 0)
          {
            page =lengthData~/selectedItemDropDown!;
            data.add(dataMain[i]);
            print('${datatam.day} / ${datatam.month} / ${datatam.year}');
          }        
        
        }
      List<DataSet> listtam=[];
      for (int i=0;i<data.length;i++){
        if (dropdownValue == 'Nhiệt độ'){
          if(SoSanh(double.parse(giatri.text), double.parse(data[i].temperature.toString()), dropdownCompare) == 0)
          {
            // print()
            listtam.add(data[i]);
            print("${dropdownValue} ${dropdownCompare} ${giatri.text}  data = ${data[i].temperature.toString()}");
            // data.removeAt(i);
            // print('xoa');
            // for (int j=0;j<data.length;j++){
            //   print(data[j].temperature);
            // }
          }

        }
      }

      data.removeRange(0, data.length);
      
      for(int i= 0;i<listtam.length;i++){
        data.add(listtam[i]);
        print('${listtam[i].date}/${listtam[i].time} ${listtam[i].temperature} ${listtam[i].humidity} ${listtam[i].light}');
      }
      print('data');

      for(int i= 0;i<data.length;i++){
        print('${data[i].temperature} ${data[i].humidity} ${data[i].light}');
      }

      
      // data = listtam;


      page = 0 ;
      lengthData = data.length;
      print('Sau khi loc dc ${lengthData} hang du lieu');

      selectedItemDropDown=10;
      
      // int tam = dropDownList.length;
      // dropDownList[dropDownList.length-1] = lengthData;

      dropDownList_1.removeRange(0, dropDownList_1.length);
      if( data.length >= 10 ) dropDownList_1.add(10);
      if( data.length >= 12 ) dropDownList_1.add(12);
      if( data.length >= 24 ) dropDownList_1.add(24);
      if( data.length >= 36 ) dropDownList_1.add(36);
      if( data.length >= 48 ) dropDownList_1.add(48);
      if( data.length >= 60 ) dropDownList_1.add(60);
      if( data.length >= 72 ) dropDownList_1.add(72);
      if( data.length!= 10 && data.length!= 12 && data.length!= 24 
      && data.length!= 36 && data.length!= 48 && data.length!= 60
      && data.length!= 72) dropDownList_1.add(lengthData);
      // dropDownList.add(int.parse(lengthData.toString()));
      // for (int i=0;i<dropDownList_1.length;i++){
      //   print(dropDownList_1[i]);
      //   dropDownList[i] = dropDownList_1[i];
      // }
      dropDownList = dropDownList_1;
      // for (int i=0;i<tam;i++)  dropDownList.remove(i);

      cutRow(selectedItemDropDown!, page);
    });
  }
  

  // ---------------------------------====So sánh:------------===========
  //-----Nếu đúng thì trarveef 1 ngược lại thì trả về 0----------

  int SoSanh(double a, double b, String ss){
    int tam;
    switch (ss) {
      case '=':
        if (a == b) tam = 1; else tam = 0;
        break;
      
      case '>':
        if (a > b) tam = 1; else tam = 0;
        break;

      case '<':
        if (a < b) tam = 1; else tam = 0;
        break;

      case '<=':
        if (a <= b) tam = 1; else tam = 0;
        break;

      case '>=':
        if (a >= b) tam = 1; else tam = 0;
        break;

      default: tam =0;
    }

    return tam;
  }

  Widget ChooseIF(int i)=>Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Text('Chọn thông số'),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                      ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                      isDense: true,
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline:null,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Nhiệt độ', 'Độ ẩm', 'Ánh Sáng']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(fontSize: 18 ),),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              width: MediaQuery.of(context).size.width/3,
              child: Column(
                children: [
                  Text('Chọn điều kiện'),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            value: dropdownCompare,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownCompare = newValue!;
                              });
                            },
                            items: <String>['=', '<', '>','>=','<=']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(child: Text(value, 
                                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                              );
                            }).toList(),
                          ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/3,
              child: TextField(
                          controller: giatri,
                          keyboardType:TextInputType.number, 
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Giá trị',
                          ),
                    ),              
              ),          
          ],
        ),
        // SizedBox(
          
        // ),
      ],

    ),
  );
  
  Widget TabView()=>Text('Alo');

  Widget BodySliding()=>Container(
    // color: Colors.ger,
        child: Column(children: [
    
          AppBarListPage(),
    
          AppBarListPage_1(),
    
          Flexible(
            child: ListView(
              children: <Widget>[
                Body(),
              ],
            )
          ),
          Test(Colors.white),
        ],)      
    
      );

  Widget AppBarListPage()=>Container(
    color: Colors.white,
    child: Container(
      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5,right: 5),
      decoration: const BoxDecoration(
        color: Color(0xff6849ef) ,
        gradient: LinearGradient(
          colors: [
            Color(0xff6849ef),
            Color(0xff886ff2),
          ]
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(-50.0)),
  
      ),
      child: Column(
        children: [
          InputRow(),

          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SlidePage_1(),
            ),
        ],
      ),
    ),
  );

  Widget AppBarListPage_1()=>Container(
    color: const  Color(0xff886ff2),
    child: Container(
      // padding: const EdgeInsets.only(top: 20,bottom: 30,left: 5,right: 5),
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(70.0)),
      
      ),
      child: Padding(
            padding: const EdgeInsets.only(top:16,left: 16),
            child: Text('${lengthData} dòng dữ liệu',style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
          ),
    ),
    
  );

  Widget Body()=>Container(
      child: Column(
        children: [      
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: buildDataTable())
          ),
        ],
      ),
    );

  Widget buildDataTable() {
    final columns = [ 'Ngày', 'Thời gian', 'Nhiệt Độ', 'Độ ẩm', 'Ánh sáng'];

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

  Widget SlidePage_1()=>Container(
    height: 60,
    width: MediaQuery.of(context).size.width-70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
                if(page>0) page--;
                cutRow(selectedItemDropDown!, page);
              });
          },
          child: Container(child: const Icon(Icons.arrow_left_rounded,size:40),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
        ),

        Text('${page+1}/${(lengthData~/selectedItemDropDown!)+1} trang',style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
        

        GestureDetector(
          onTap: (){
            if(page<(lengthData~/selectedItemDropDown!))    { 
                    page++;     
                  }
                  if(page == (lengthData~/selectedItemDropDown!))    {
                    // print('full');
                    setState(() {
                      data.removeRange(0, data.length);
                    });
                    // print('page = $page');
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
          },
          child: Container(child: const Icon(Icons.arrow_right_rounded,size:40),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
        ),
      ],
    ),
  );


  // Widget SlidePage()=> Container(
  //   height: 60,
  //   width: MediaQuery.of(context).size.width-50,
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     // crossAxisAlignment: CrossAxisAlignment,
  //     children: [
  //       ElevatedButton(
  //           onPressed: (){
  //             setState(() {
  //               if(page>0) page--;
  //               cutRow(selectedItemDropDown!, page);
  //             });
  //           }, 
  //           style: ElevatedButton.styleFrom(
  //             primary: Colors.white, // Background color
  //           ),
  //           child: Text('<',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
  //       ),

  //       // Text('${page+1}/${(data.length~/selectedItemDropDown!)+1}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
  //       Text('${data.length}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),

  //       ElevatedButton(
  //             onPressed: (){
  //               setState(() {
  //                 if(page<(lengthData~/selectedItemDropDown!))    { 
  //                   page++;     
  //                 }
  //                 if(page == (lengthData~/selectedItemDropDown!))    {
  //                   // print('full');
  //                   setState(() {
  //                     data.removeRange(0, data.length);
  //                   });
  //                   // print('page = $page');
  //                   var start = page * selectedItemDropDown!;
  //                   var end = lengthData;
  //                   for(int i= start;i<end;i++)
  //                   {
  //                     setState(() {
  //                       data.add(dataMain[i]);
  //                     });
  //                   }
  //                 }
  //                 else cutRow(selectedItemDropDown!, page);
  //                 // cutRow(selectedItemDropDown!, page);
  //               });
  //             },
              
  //             style: ElevatedButton.styleFrom(
                
  //               primary: Colors.white, // Background color
  //             ),
  //             child: Text('>',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
  //         ),
        

  //     ],
  //   ),
  // );

  Widget Test(Color color)=> Container(
    color: color,
    width: MediaQuery.of(context).size.width,
    height: 190,
  );
  
  // Widget Input


  Widget InputRow()=>  Padding(
    padding: const EdgeInsets.only(top: 0,left:5,bottom: 0),
    child: Row(
      children: [
        
        const Text('Hiển thị    ',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        
        // DropDownWidget(dataDropDown: dropDownList),

        // FutureBuilder(
        //   future: dropDownList,
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(
        //         child: DropdownButton(
        //           hint: Text("Preço"),
        //         ),
        //       );
        //     } else {
        //       return Dropdown(title: "Preço", priceProducts: snapshot.data);
        //     }
        //   },
        // )

        DropdownButton(
          value: selectedItemDropDown, 

          items: dropDownList.map((item) {
                return  DropdownMenuItem<int>(
                  child:  Text(item.toString(),
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
        const Text('   hàng',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ],
    ),
  );

  // Widget DropDownWidget({required List<int> dataDropDown})=>DropdownButton(
  //         value: selectedItemDropDown,
  //         items: dataDropDown.map((item) {
  //               return  DropdownMenuItem<int>(
  //                 child:  Text(item.toString(),
  //                           style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  //                           value: int.parse(item.toString()), //FAIL
  //                                   );
  //                                 }).toList(),
  //                                 onChanged: (selected)
  //                       => setState(() {
  //                           page=0;
  //                           selectedItemDropDown = int.parse(selected.toString());
  //                           print(selectedItemDropDown);
  //                           cutRow(selectedItemDropDown!, page);
  //                       }));

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




