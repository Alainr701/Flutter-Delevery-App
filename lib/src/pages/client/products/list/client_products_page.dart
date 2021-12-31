
import 'package:delevery/src/utils/shared_pref.dart';
import 'package:flutter/cupertino.dart';

class ClientProductsListController {

  BuildContext context;
  SharedPref sharedPref = SharedPref();
 
  Future init(BuildContext context) async {
    this.context = context;
  }
  logout(){
  sharedPref.logout(context);
  }

}