void main(List<String> args) {
  //Dart varible type is mutable
  var s1 = 'Hello'; // infer type
  String s2 = 'World'; // explicit type

  //if you want to have a nullable variable
  String? name;
  print(name);

  //เปลี่ยนไม่ได้ตั้งเเต่ run time
  final time1 = DateTime.now();
  print(time1);
  //เเดงเเน่ๆเพราะ เราไม่สามารถกำหนดค่าคงที่ตอนcompileเพราะเราไม่รู้เวลา
  // const time2 =  DateTime.now();

}
