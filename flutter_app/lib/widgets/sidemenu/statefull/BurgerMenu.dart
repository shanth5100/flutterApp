import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets/sidemenu/statefull/MenuItemFields.dart';

class BurgerMenu extends StatefulWidget {
  @override
  BurgerMenuState createState() {
    return BurgerMenuState();
  }
}

class BurgerMenuState extends State<BurgerMenu> {
  Widget appBarTitle;
  Color appBarBGColor;
  MenuItemFields menuItemFields;
  List<MenuItemFields> menuItemFieldList;
  List<Widget> widgetList = [];
  @override
  void initState() {
    super.initState();
    appBarTitle = new Text(menuItemFieldList.first.title);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
