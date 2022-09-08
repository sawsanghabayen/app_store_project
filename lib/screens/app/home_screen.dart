import 'package:database_app/models/process_response.dart';
import 'package:database_app/models/screens.dart';
import 'package:database_app/screens/app/cart_screen.dart';
import 'package:database_app/screens/app/liked_screen.dart';
import 'package:database_app/screens/app/mainWidget.dart';
import 'package:database_app/screens/app/setting_screen.dart';
import 'package:database_app/utils/context_extension.dart';
import 'package:database_app/widgets/custom_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../getx/cart_getx_controller.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_category.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/header_slider.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  static String homeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CartGetxController controller = Get.put(CartGetxController());

  int index = 0;

  // BuildContext? context;

  @override
  Widget build(BuildContext context) {
    List<Screens> screens = [
      Screens(widget: MainScreenWidget(), title: context.localizations.home),
      Screens(widget: CartScreen(), title: context.localizations.cart),
      Screens(widget: LikedScreen(), title: context.localizations.favorite),
      Screens(widget: CategoryScreen(), title: context.localizations.category),
    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(context, title: screens[index].title,
          icon: index == 1 ? Icons.delete : Icons.notifications),
      drawer: CustomDrawer(),
      body: screens[index].widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: index == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
              label: context.localizations.home),
          BottomNavigationBarItem(
              icon: index == 1
                  ? Icon(Icons.shopping_cart)
                  : Icon(Icons.shopping_cart_outlined),
              label: context.localizations.cart),
          BottomNavigationBarItem(
              icon: index == 2
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              label: context.localizations.favorite),
          BottomNavigationBarItem(
              icon: index == 3
                  ? Icon(Icons.category)
                  : Icon(Icons.category_outlined),
              label: context.localizations.categories),
        ],
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),
    );
  }


  AppBar CustomAppBar(BuildContext context,
      {required String title, IconData icon = Icons.notifications}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      title: AppText(text: title, color: Color(0xff3E3E3E), fontSize: 16),
      centerTitle: true,
      actions: [
        IconButton(
          icon: (Icon(
            icon,
          )),
          onPressed: () async{
            if (index == 1) {
            ProcessResponse process=await  controller.clear();
            context.showSnackBar(message: process.message,error: !process.success);
            } else {
              Navigator.pushNamed(context, '/notifications_screen');
            }
          },
          color: Colors.black,
        )
      ],
    );
  }
}