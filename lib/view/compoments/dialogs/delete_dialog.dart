import 'package:chiase_hinhanh/view/compoments/constants/string.dart';
import 'package:chiase_hinhanh/view/compoments/dialogs/alter_dialog_model.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class DeleteDiaLog extends AlterDialogModel<bool> {
  const DeleteDiaLog({required String titleOfObjectToDelete})
      : super(
          title: '${Strings.delete} $titleOfObjectToDelete?',
          message:
              '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete',
          buttons: const {
            Strings.cancel: false,
            Strings.delete: true,
          },
        );
}
