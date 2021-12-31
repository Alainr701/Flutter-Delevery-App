import 'package:delevery/src/pages/client/products/list/client_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ClientProductsListPage extends StatefulWidget {
  ClientProductsListPage({Key key}) : super(key: key);

  @override
  _ClientProductsListPageState createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  ClientProductsListController _con = ClientProductsListController(); 
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _con.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('Client Products List'),
          onPressed: _con.logout,
          ),
      ),
    );
  }
}