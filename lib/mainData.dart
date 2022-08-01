import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:datn/data_sheet_api.dart';
import 'package:datn/datasetField.dart';
import 'package:datn/sheet_api.dart';
import 'package:flutter/material.dart';

import 'screen/accountPage.dart';
import 'screen/homepage.dart';
import 'screen/notificationPage.dart';
import 'screen/tkListPage.dart';
import 'screen/tkStatiticPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataSheetApi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  DataSet? dataLast;
  // final formkey = GlobalKey<FormState>();
  // TextEditingController? controllerName;
  // TextEditingController? controllerEmail;

  Future getUser() async{
    // final user = await UserSheetApi.getById(2);
    // print(user!.toJson());

    // final  = await UserSheetApi.getAll();
    // final dataLast = await DataSheetApi.getLastRow();

    // print(users);
    // print(dataLast?.temperature);

    final dataLast = await DataSheetApi.getLastRow();

    setState(() {
      this.dataLast=dataLast!;
    });
    // setState(() {
      // this.users=users;
      // for(int i=0;i<users.length;i++)
      // {
      //   print(users[i].name);
      // }
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  int index=0;
  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.list_alt_rounded, size :30),
    Icon(Icons.area_chart, size:30),
    Icon(Icons.notifications_active, size: 30),
    Icon( Icons.account_circle, size: 30),
  ];

  final screens = [
    HomePage(),
    TkListPage(),
    TkStatiticPage(),
    NotificationPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        // backgroundColor: Colors.orange,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white)
            ),
            child: CurvedNavigationBar(

              color: Color(0xff6849ef),
              buttonBackgroundColor: Color(0xff6849ef),
              backgroundColor: Colors.transparent,
              height: 70,
              items: items,
              index: index,
              onTap: (index)=> setState(()=> this.index=index),
            ),
          ),
          body: screens[index],
      ),
    );
  }

}
// Center(
// child: ElevatedButton(
// child: Text("Save"),
// onPressed: () async {
// // final dataLast = await DataSheetApi.getLastRow();
// //
// // final data= await DataSheetApi.getAll();
// //
// // for (int i=0;i< 5 ;i++)
// //   {
// //     print(data[i].date);
// //     print(data[i].time);
// //     print(data[i].temperature);
// //     print(data[i].humidity);
// //     print(data[i].light);
// //     print("====================================");
// //
// //   }
// //
// // print(dataLast?.date);
// // print(dataLast?.time);
// // print(dataLast?.temperature);
// // print(dataLast?.humidity);
// // print(dataLast?.light);
// // final user= DataSet(
// //   date: '1',
// //   time: '1',
// //   temperature: 0.0,
// //   humidity: 0.0,
// //   light: 0.0,
// // );
// //
// //
// // await DataSheetApi.insert([user.toJson()]);
// },
// ),
// )