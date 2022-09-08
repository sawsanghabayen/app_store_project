import 'package:database_app/database/db_controller.dart';
import 'package:database_app/prefs/shared_pref_controller.dart';
import 'package:database_app/provider/language_provider.dart';
import 'package:database_app/screens/app/about_us_screen.dart';
import 'package:database_app/screens/app/addresses_screen.dart';
import 'package:database_app/screens/app/cart_screen.dart';
import 'package:database_app/screens/app/category_screen.dart';
import 'package:database_app/screens/app/check_out_screen.dart';
import 'package:database_app/screens/app/contact_us_screen.dart';
import 'package:database_app/screens/app/edit_profile_screen.dart';
import 'package:database_app/screens/app/home_screen.dart';
import 'package:database_app/screens/app/liked_screen.dart';
import 'package:database_app/screens/app/new_addess.dart';
import 'package:database_app/screens/app/notifications_screen.dart';
import 'package:database_app/screens/app/order_details_screen.dart';
import 'package:database_app/screens/app/orders_screen.dart';
import 'package:database_app/screens/app/payments_screen.dart';
import 'package:database_app/screens/app/product_screen.dart';
import 'package:database_app/screens/app/products_screen.dart';
import 'package:database_app/screens/app/setting_screen.dart';
import 'package:database_app/screens/app/sub_categories_screen.dart';
import 'package:database_app/screens/auth/change_mobile_screen.dart';
import 'package:database_app/screens/auth/change_password_screen.dart';
// import 'package:database_app/screens/app/home_screen1.dart';
import 'package:database_app/screens/auth/forgot_password_screen.dart';
import 'package:database_app/screens/auth/login_screen.dart';
import 'package:database_app/screens/auth/register_screen.dart';
import 'package:database_app/screens/auth/reset_password_screen.dart';
import 'package:database_app/screens/auth/verification_screen.dart';
import 'package:database_app/screens/core/launch_screen.dart';
import 'package:database_app/screens/outboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();/*   هنا MyApp رح يستنى لحد يجهز الشيرد بريفيرنس*/
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String message='';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(     /*هنا عشان نحدد حجم الشاشة*/
    designSize:const Size(375, 812) ,
      builder: (context, child) {
       return ChangeNotifierProvider<LanguageProvider>(  /*       هنا عشان يعمم ويغير بنفس الوقت*/
       create: (context)=>LanguageProvider(),
         builder:(BuildContext context, Widget? child){
           return  GetMaterialApp(
             theme: ThemeData(
                 colorScheme: ThemeData().colorScheme.copyWith(
                   primary: Color(0xffFF7750),
                   // secondary: ,
                 ),
                 appBarTheme: AppBarTheme(

                     elevation: 0,
                     centerTitle: true,
                     backgroundColor: Colors.transparent,
                     iconTheme: const IconThemeData(color: Colors.black),
                     titleTextStyle: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black,)
                 )
             ),
             // localizationsDelegates: const [
             //   GlobalMaterialLocalizations.delegate,
             //   GlobalCupertinoLocalizations.delegate,
             //   GlobalWidgetsLocalizations.delegate,
             // ],
             localizationsDelegates: AppLocalizations.localizationsDelegates,               /*هنا لترجمة الملفات*/

             // supportedLocales: const [
             //   Locale('ar'),
             //   Locale('en'),
             // ],
             supportedLocales: AppLocalizations.supportedLocales,
             locale:  Locale(Provider.of<LanguageProvider>(context).language),
             debugShowCheckedModeBanner: false,
             initialRoute: '/launch_screen',
             routes: {
               '/launch_screen':(context) => const LaunchScreen(),
               '/login_screen':(context) => const LoginScreen(),
               '/register_screen':(context) => const RegisterScreen(),
               '/home_screen':(context) => const HomeScreen(),
               '/on_boarding_screen': (context) => const OnBoardingScreen(),
               '/forgot_password_screen': (context) => const ForgotPassword(),
               '/reset_password_screen': (context) => const ResetPasswordScreen(),
               '/change_password_screen': (context) => const ChangePasswordScreen(),
               '/verification_screen': (context) => const VerificationScreen(),
               // '/category_screen': (context) => const CategoryScreen(),
               // '/sub_categories_screen': (context) =>  SubCategoriesScreen(),
               // '/products_screen': (context) => const ProductsScreen(),
               // '/product_screen': (context) => const ProductScreen(),
               '/liked_screen': (context) => const LikedScreen(),
               '/addresses_screen': (context) => const AddressesScreen(),
               // '/new_address_screen': (context) => const NewAddressScreen(),
               '/cart_screen': (context) =>  CartScreen(),
               '/setting_screen': (context) => const SettingScreen(),
               '/orders_screen': (context) =>  OrdersScreen(),
               '/order_details_screen': (context) => const OrderDetailsScreen(),
               '/notifications_screen': (context) => const NotificationsScreen(),
               '/payments_screen': (context) => const PaymentsScreen(),
               '/check_out_screen': (context) =>  CheckOutScreen(),
               '/contact_us_screen': (context) => const ContactUsScreen(),
               // '/edit_profile_screen': (context) => const EditProfileScreen(),
               '/about_us_screen': (context) => const AboutUsScreen(),
               '/change_mobile_screen': (context) => const ChangeMobileScreen(),
             },

           );
         },
       );
    },);
  }

}
