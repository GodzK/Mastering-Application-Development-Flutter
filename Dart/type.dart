void main() {
  //Number
  int i = 1;
  // Float
  double f = 1.1;
  // num can be int or float in the same time
  num n = 13.5;
  n = 9;
  print('Hello, Integer $i!');
  print('Hello, Float $f!');
  print('Hello, The Num $n!');
  //String can make with single^double quote
  var sMap = {
    's1': 'Hello1',
    's2': "Hello 'Hello'",
    //strimg multi line
    's3': '''
    This is How
    You can make Multiple Line of String
    ''',
  };
  //use $ to interpolation and call method with {} for example ${s.toLowerCase}
  for (var i = 0; i <= sMap.length; i++) {
    print(sMap['s$i']);
  }
  // boolean
  bool b1 = true;
  bool b2 = false;
  String fullname = '';
  if (fullname.isEmpty) {
    print(b1);
  } else {
    print(b2);
  }

  //list
  List<int> list1 = [1, 2, 3];
  List<String> list2 = ['Car', 'Boat', "Plane"];
  //Concat in list
  List<int> list3 = [...list1, 4, 5, 6];
  print(list3);

  //Set (cant duplicate)
  Set<String> names1 = {};
  var names2 = {}; // THis is Map by default
  //Operation
  var oldSet = {'A', 'B'};
  var newSet = <String>{};
  newSet.addAll(oldSet);
  newSet.add('C');
  print('newSet: $newSet');

  var unionSet = oldSet.union(newSet);
  var intersectSet = newSet.intersection(oldSet);
  var diffSet = newSet.difference(oldSet);

  print('unionSet: $unionSet');
  print('intersectSet: $intersectSet');
  print('diffSet: $diffSet');

  Set<Set<String>> setOperation = {unionSet, intersectSet, diffSet};

  for (var s in setOperation) {
    print(s);
  }
}
