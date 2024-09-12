import 'package:fit_journey/src/modules/cusotm_elements/alert_dialog.dart';
import 'package:flutter/material.dart';

class MessageService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar({required String message, required bool isSuccess}) {
    final SnackBar snackBar;
    if (isSuccess) {
      snackBar = SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
    } else {
      snackBar = SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    messengerKey.currentState?.showSnackBar(
      snackBar,
    );
  }

  static void showAlertDialog(
      {required BuildContext context,
      required VoidCallback onYes,
      VoidCallback? onNo,
      required String message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          message: message, // Custom message
          onYes: onYes, 
          onNo: onNo ?? () => Navigator.pop(context),
        );
      },
    );
  }
}
