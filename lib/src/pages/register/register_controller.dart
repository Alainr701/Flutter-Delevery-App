

import 'package:delevery/src/models/response_api.dart';
import 'package:delevery/src/models/user.dart';
import 'package:delevery/src/provider/users_provider.dart';
import 'package:delevery/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController {

  BuildContext context;
  TextEditingController emailController =  TextEditingController();
  TextEditingController nameController =  TextEditingController();
  TextEditingController lastnameController =  TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  TextEditingController confirmPassswordController =  TextEditingController();


  UsersProvider usersProvider = new UsersProvider();


  Future init(BuildContext context) {
    this.context = context;
    usersProvider.init(context);
    
  }

  void register() async{
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPassswordController.text.trim();


    if (email.isEmpty || name.isEmpty || lastname.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      MySnackbar.show(context, 'De bes ingresar todos los campos');
      return;  
    }

    if (password != confirmPassword) {
      MySnackbar.show(context, 'Las contraseñas no coinciden');
      return;  
    }

    if (password.length < 6) {
      MySnackbar.show(context, 'La contraseña debe tener al menos 6 caracteres');
      return;        
    }

    User user = User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password
    );

    ResponseApi responseApi = await usersProvider.create(user);
    // print(responseApi.toJson());
    MySnackbar.show(context, responseApi.message);

    // print('Email: $email');
    // print('Name: $name');
    // print('Lastname: $lastname');
    // print('Phone: $phone');
    // print('Password: $password');
    // print('Confirm Password: $confirmPassword');    
  }

  void back() {
    Navigator.pop(context);
  }


}