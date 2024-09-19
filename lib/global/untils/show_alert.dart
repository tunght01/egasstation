import 'package:egasstation/global/themes/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../navigator/navigation/navigation.dart';

class ShowAlert {
  /// Shows a custom toast message with an orange theme and rounded borders.
  static void showToast({required String content, required bool isSuccess}) {
    ScaffoldMessenger.of(navigation.navigatorKey.currentContext!).showSnackBar(SnackBar(
      backgroundColor: isSuccess ? Colors.orange : Colors.redAccent,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(isSuccess ? Icons.check_circle_outline : Icons.error_outline, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded borders for the toast
      ),
      elevation: 6.0,
      duration: const Duration(seconds: 3),
    ));
  }

  //////////////////////////////  Dialog /////////////////////////
  static void showDialog({
    String? title,
    Widget? content,
    String? desc,
    bool? status,
    List<DialogButton>? buttons,
    AlertType? alertType,
    bool? isCloseButton,
    bool? isDismissible = true,
  }) {
    AlertType _alertType = alertType ??
        (status == true
            ? AlertType.success
            : status == false
                ? AlertType.error
                : AlertType.none);

    Alert(
      context: navigation.navigatorKey.currentContext!,
      style: AlertStyle(
        animationType: AnimationType.grow,
        isCloseButton: isCloseButton ?? true,
        isOverlayTapDismiss: isDismissible!,
        isButtonVisible: buttons != null,
        descStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        titleStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.current.blackColor,
        ),
        animationDuration: const Duration(milliseconds: 400),
        alertPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Rounded borders for the dialog
          side: const BorderSide(
            color: Colors.orangeAccent, // Border color to match the orange theme
          ),
        ),
        backgroundColor: AppColors.current.whiteColor,
        overlayColor: Colors.black54, // Dimmed background for a modern look
      ),
      type: _alertType,
      title: title,
      desc: desc,
      content: content ?? const SizedBox.shrink(),
      closeFunction: () {
        navigation.pop();
      },
      buttons: buttons,
    ).show();
  }
}
