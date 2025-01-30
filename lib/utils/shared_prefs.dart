import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  storeFirst(String isFirst) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('first', isFirst);
  }

  getFirst() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('first');
  }

  removeFirst() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('first');
  }
  //////// user /////////
  storeUser(user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user);
  }

  getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }
}