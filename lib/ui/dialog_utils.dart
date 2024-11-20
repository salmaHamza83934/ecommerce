import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF004182),
            content: Row(
              children: [
                const CircularProgressIndicator(color: Colors.white,),
                const SizedBox(
                  width: 12,
                ),
                Text(message,style: AppTextStyles.font14White),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      BuildContext context,
      String message, {
        String title = 'Title',
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
      }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,style: AppTextStyles.font14White,)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,style: AppTextStyles.font14White)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF004182),
            content: Text(message,style: AppTextStyles.font14White),
            title: Text(title,style: AppTextStyles.font14White),
            actions: actions,
            titleTextStyle: AppTextStyles.font14White
          );
        });
  }
}