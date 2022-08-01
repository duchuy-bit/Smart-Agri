// // import 'package:datn/sheet_api.dart';
// // // import 'package:datn/userField.dart';
// // // import 'package:flutter/material.dart';

// // // Future<void> main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();

// // //   await UserSheetApi.init();

// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({Key? key}) : super(key: key);

// // //   // This widget is the root of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({Key? key, required this.title}) : super(key: key);

// // //   final String title;

// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {

// // //   List<User> users= [];

// // //   final formkey = GlobalKey<FormState>();
// // //   TextEditingController? controllerName;
// // //   TextEditingController? controllerEmail;

// // //   Future getUser() async{
// // //     // final user = await UserSheetApi.getById(2);
// // //     // print(user!.toJson());

// // //     final users = await UserSheetApi.getAll();
// // //     final userLast = await UserSheetApi.getLastRow();

// // //     // print(users);
// // //     print(userLast!.name);


// // //     setState(() {
// // //       this.users=users;
// // //       for(int i=0;i<users.length;i++)
// // //         {
// // //           print(users[i].name);
// // //         }
// // //     });
// // //   }

// // //   @override
// // //   void initState() {
// // //     // TODO: implement initState
// // //     super.initState();
// // //     controllerEmail= TextEditingController();
// // //     controllerName= TextEditingController();
// // //     getUser();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(        
// // //         title: Text(widget.title),
// // //       ),
// // //       body: Center(
// // //         child: SingleChildScrollView(
// // //           child: Form(
// // //             key: formkey,
// // //             child: Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 buildName(),
// // //                 const SizedBox(height: 16,),
// // //                 buildEmail(),
// // //                 const SizedBox(height: 16,),
// // //                 buildSubmit(),              
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       )
// // //     );
// // //   }

// // //   Widget buildName() => TextFormField(
// // //     controller: controllerName,
// // //     validator: (value)=>
// // //       value!=null && value.isEmpty ? 'Enter Name':null,
// // //     decoration: InputDecoration(
// // //       labelText: 'Name',
// // //       border: OutlineInputBorder(),
// // //     ),
// // //   );

// // //   Widget buildEmail() => TextFormField(
// // //     controller: controllerEmail,
// // //     validator: (value)=>
// // //     value!=null && !value.contains('@') ? 'Enter Email':null,
// // //     decoration: InputDecoration(
// // //       labelText: 'Email',
// // //       border: OutlineInputBorder(),
// // //     ),
// // //   );

// // //   Widget buildSubmit() => ElevatedButton(
// // //     child: Text("Save"),
// // //     onPressed: () async {
// // //       final form = formkey.currentState!;
// // //       final isValid = form.validate();
// // //       if ( isValid ){
// // //         final id = await UserSheetApi.getRowCount()+1;
// // //         final user= User(
// // //             id: id,
// // //             name: controllerName!.text,
// // //             email: controllerEmail!.text,
// // //         );
// // //         final newUser = user.copy(id: id);

// // //         await UserSheetApi.insert([newUser.toJson()]);
// // //       }
// // //     },
// // //   );

// // //   Future insertUsers() async{
// // //     final users= [
// // //       User(id: 1,name: 'huy1', email: 'huy1'),
// // //       User(id: 2,name: 'huy2', email: 'huy2'),
// // //     ];
// // //   final jsonUser=users.map((user) => user.toJson()).toList();
// // //     await UserSheetApi.insert(jsonUser);
// // //   }
// // // }









// // // child: LineChart(
// // //     LineChartData(
// // //       minX: 0,
// // //       maxX: 6,
// // //       minY: 0,
// // //       maxY:5,
// // //       // titlesData: FlTitlesData(
// // //       //   show: true,
// // //       //   bottomTitles: SideTitles(
// // //       //     showTitles: true,
// // //       //   ),
// // //       // ),
// // //       gridData: FlGridData(
// // //         show: true,
// // //         getDrawingHorizontalLine:(value){
// // //           return FlLine(
// // //             color: Colors.grey,
// // //             strokeWidth: 3
// // //           );
// // //         },
// // //         drawVerticalLine: true,
// // //         getDrawingVerticalLine:(value){
// // //           return FlLine(
// // //               color: Colors.grey,
// // //               strokeWidth:3
// // //           );
// // //         },
// // //
// // //       ),
// // //       borderData: FlBorderData(
// // //         show: true,
// // //         border: Border.all(color: const Color(0xf37434d),width: 1),
// // //       ),
// // //       lineBarsData: [
// // //         LineChartBarData(
// // //           spots: [
// // //             FlSpot(0, 3),
// // //             FlSpot(1, 2),
// // //             FlSpot(2, 4.3),
// // //             FlSpot(3, 4),
// // //             FlSpot(4, 3.4),
// // //             FlSpot(5, 2.3),
// // //             FlSpot(6, 4.5),
// // //           ],
// // //           isCurved: true,
// // //           color: Colors.blue,
// // //           barWidth: 5,
// // //           // dotData: FlDotData(show: false),
// // //         )
// // //       ]
// // //     )
// // // ),


//  Widget buildSlidingPanel (
//     {
//       required ScrollController scrollController,
//     })=>
//     Container(
//         child: PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: Container(
//             height: 50,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(50)
//               ),
              
//               child: Column(
//                 children: [
//                 Padding(
//                       padding:  EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width/2-25,
//                         right: MediaQuery.of(context).size.width/2 -25,
//                         bottom: 21,
//                         top: 21,
//                       ),
//                       child: Container(
//                         width: 40 ,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
                  

//                   TabView(),
//                 ],
//               ),
//             ),
//             // centerTitle: true,
//           ),
//         ),
//         // body: TabView()
//         );

// class TabView extends StatefulWidget {
//   const TabView({ Key? key }) : super(key: key);

//   @override
//   State<TabView> createState() => _TabViewState();
// }

// class _TabViewState extends State<TabView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [
//         // Test(Colors.pink),
//         // Test(Colors.blue),
//         // Test(Colors.green)
//       ]),
//     );
//   }

//   Widget Test(Color color)=> Container(
//     color: color,
//     width: 500,
//     height: 200,
//   );
// }

      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       InputRow(),

      //     Padding(
      //       padding: const EdgeInsets.only(left: 20),
      //       child: SlidePage(),
      //     ),


      //       Body(),
      //     ],
      //   )
      // ),