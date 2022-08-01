
class Changes{

  DateTime changeDoubleToDate(String n){
    const gsDateBase = 2209161600 / 86400;
    const gsDateFactor = 86400000;
    
    final date = double.tryParse(n.toString());
    final millis = (date! - gsDateBase) * gsDateFactor;
    return DateTime.fromMillisecondsSinceEpoch(millis.toInt(), isUtc: true);
  }

  String getTime(String n){
    var hour = changeDoubleToDate(n.toString()).hour.toString();
    var minu = changeDoubleToDate(n.toString()).minute.toString();
    var checkZero = '';
    if(minu == '0')  checkZero= '0';
    return hour + ':' + minu + checkZero;
  }

  // DateTime changeDoubleToTime(String n){
  //   const gsDateBase = 2209161600 / 86400;
  //   const gsDateFactor = 86400000;
    
  //   final date = double.tryParse(n.toString());
  //   if (date == null) {
  //     // print(null);
  //     // print('n= ${n.toString()}');
  //   };
  //   final millis = (date??0 - gsDateBase) * gsDateFactor;
  //   print(DateTime.fromMillisecondsSinceEpoch(millis.toInt(), isUtc: true));
  //   return DateTime.fromMillisecondsSinceEpoch(millis.toInt(), isUtc: true);
  // }
}