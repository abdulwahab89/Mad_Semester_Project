import 'package:fluttertoast/fluttertoast.dart';
import 'package:moviepedia/utils/colors.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message,
      backgroundColor: AppColors.backgroundColor,

      fontSize: 16,
    );
  }
}