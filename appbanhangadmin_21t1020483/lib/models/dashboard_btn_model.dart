import 'package:appbanhangadmin_21t1020483/screens/edit_upload_product.dart';
import 'package:appbanhangadmin_21t1020483/screens/inner_screen/orders/orders_screen.dart';
import 'package:appbanhangadmin_21t1020483/screens/search_screen.dart';
import 'package:appbanhangadmin_21t1020483/services/assets_manager.dart';
import 'package:flutter/material.dart';

class DashboardButtonModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonModel(
      {required this.text, required this.imagePath, required this.onPressed});
  static List<DashboardButtonModel> dashboardBtnList(context) => [
        DashboardButtonModel(
            text: "Add a new product",
            imagePath: AssetsManager.cloud,
            onPressed: () {
              Navigator.pushNamed(context, EditOrUploadProducts.routeName);
            }),
        DashboardButtonModel(
            text: "Inspect all product",
            imagePath: AssetsManager.shoppingCart,
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            }),
        DashboardButtonModel(
            text: "View Order",
            imagePath: AssetsManager.order,
            onPressed: () {
              Navigator.pushNamed(context, OrdersScreenFree.routeName);
            }),
      ];
}
