import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


import '../widgets/custom_button.dart';

Future<void> customError(
  BuildContext context, {
  required String massage,
}) async {
  await AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.error,
    title:"Error",
    desc: massage,
    btnOk: CustomButton(
      title: "Ok",
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ).show();
}

Future<void> customSuccess(
  BuildContext context, {
  required String massage,
}) async {
  await AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    title: "Success",
    desc: massage,
    btnOk: CustomButton(
      title: "Ok",
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ).show();
}

// Future<void> customWarning(
//   BuildContext context, {
//   required String massage,
// }) async {
//   await AwesomeDialog(
//     context: context,
//     animType: AnimType.scale,
//     dialogType: DialogType.warning,
//     title: S.of(context).warning,
//     desc: massage,
//     btnOk: CustomButton(
//       isMinWidth: true,
//       title: S.of(context).ok,
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//     btnCancel: CustomButton(
//       isMinWidth: true,
//       isSecondary: true,
//       title: S.of(context).cancel,
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//   ).show();
// }

