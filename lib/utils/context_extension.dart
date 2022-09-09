import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// هنا معناه بنعمل build على ال context
//   وبنعمل اضافات على عناصر موجودة مسبقا
extension ContextHelper on BuildContext{
  void showSnackBar(
      {required String message, bool error = false,int seconde=3}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: GoogleFonts.nunito(),
      ),
      backgroundColor: error ? Colors.red.shade700: Colors.green.shade300,
      duration:  Duration(seconds: seconde),
      dismissDirection: DismissDirection.horizontal,
    ));
  }


  AppLocalizations get localizations{
    return AppLocalizations.of(this)!;
  }





}