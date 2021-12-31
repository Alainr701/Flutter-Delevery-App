import 'package:delevery/src/models/response_api.dart';
import 'package:delevery/src/models/user.dart';
import 'package:delevery/src/provider/users_provider.dart';
import 'package:delevery/src/utils/my_snackbar.dart';
import 'package:delevery/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginController {
  
  BuildContext context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
   SharedPref _sharedPref =  SharedPref();


  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
     User user = User.fromJson(await _sharedPref.read('user') ?? {});
      print('Usuario  ${user.toJson()}');
    if (user?.sessionToken != null) {
        Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
     
    }
  }
  

  void goToRegisterPage() {
    Navigator.pushNamed(context, 'register');
  }
  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);

      _sharedPref.save('user', user.toJson());
      
      Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);

      // pushNotificationsProvider.saveToken(user.id);

      // print('USUARIO LOGEADO: ${user.toJson()}');
      // if (user.roles.length > 1) {
      //   Navigator.pushNamedAndRemoveUntil(context, 'roles', (route) => false);
      // }
      // else {
      //   Navigator.pushNamedAndRemoveUntil(context, user.roles[0].route, (route) => false);
      // }

    }
    else {
      MySnackbar.show(context, responseApi.message);
    }

    print('email $email');
    print('password $password');
  }
}