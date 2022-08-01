// import 'package:datn/datasetField.dart';
// import 'package:datn/helper/changeDoubleToDate.dart';
// import 'package:flutter/material.dart';

// List<DataColumn> getColumns(List<String> columns) => columns
//       .map((String column) => DataColumn(
//             label: Text(column,style: TextStyle(fontWeight: FontWeight.bold),),
//             onSort: onSort,
//           ))
//       .toList();

//   List<DataRow> getRows(List<DataSet> users) => users.map((DataSet user) {
//         String date= "${Changes().changeDoubleToDate(user.date!).day}/${Changes().changeDoubleToDate(user.date!).month}/${Changes().changeDoubleToDate(user.date!).year}";
//         String time ="${Changes().changeDoubleToDate(user.time!).hour}: ${Changes().changeDoubleToDate(user.time!).minute}";
//         final cells = [date, time, user.temperature,user.humidity,user.light];

//         return DataRow(cells: getCells(cells));
//       }).toList();

//   List<DataCell> getCells(List<dynamic> cells) =>
//       cells.map((data) => DataCell(Text('$data'))).toList();

//   void onSort(int columnIndex, bool ascending) {
//     if (columnIndex == 0) {
//       data.sort((user1, user2) =>
//           compareString(ascending, user1.date!, user2.date!));
//     } else if (columnIndex == 1) {
//       data.sort((user1, user2) =>
//           compareString(ascending, user1.time!, user2.time!));
//     } else if (columnIndex == 2) {
//       data.sort((user1, user2) =>
//           compareString(ascending, '${user1.temperature}', '${user2.temperature}'));
//     }else if (columnIndex == 3) {
//       data.sort((user1, user2) =>
//           compareString(ascending, '${user1.humidity}', '${user2.humidity}'));
//     }else if (columnIndex ==4) {
//       data.sort((user1, user2) =>
//           compareString(ascending, '${user1.light}', '${user2.light}'));
//     }

//     setState(() {
//       this.sortColumnIndex = columnIndex;
//       this.isAscending = ascending;
//     });
//   }

//   int compareString(bool ascending, String value1, String value2) =>
//       ascending ? value1.compareTo(value2) : value2.compareTo(value1);