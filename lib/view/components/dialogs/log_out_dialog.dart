import 'package:chiase_hinhanh/view/components/constants/string.dart';
import 'package:chiase_hinhanh/view/components/dialogs/alter_dialog_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class LogOutDilog extends AlterDialogModel {
  const LogOutDilog() :super (
    title: Strings.logOut,
    message: Strings.areYouSureThatYouWantToLogOutOfTheApp,
    buttons: const {
      Strings.logOut: true,
      Strings.cancel: false,
    }
  );
}