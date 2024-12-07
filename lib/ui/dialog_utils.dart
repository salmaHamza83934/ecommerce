import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.magentaHaze,
                backgroundColor: Colors.grey.shade300,
              ),
            ));
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
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,
              style: AppTextStyles.font14DelfBlue
                  .copyWith(color: AppColors.slateGrey))));
    }
    if (posActionName != null) {
      actions.add(TextButton(
          clipBehavior: Clip.antiAlias,
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.magentaHaze),
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: AppTextStyles.font14White,
          )));
    }

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Text(message,
                style: AppTextStyles.font14DelfBlue
                    .copyWith(color: AppColors.slateGrey)),
            title: Text(title, style: AppTextStyles.font20MagentaHaze),
            actions: actions,
          );
        });
  }
}
