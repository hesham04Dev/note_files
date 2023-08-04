import 'package:flutter/material.dart';

import '../isarCURD.dart';
import '../translations/translations.dart';

class FolderNameDialog extends StatelessWidget {
  final Map<String, String> locale;
  final Function onSubmit;
  final bool isRtl;
  final IsarService db;
  final int? parentFolderId;

  FolderNameDialog(
      {super.key,
      required this.locale,
      required this.onSubmit,
      required this.isRtl,
      required this.db,
      required this.parentFolderId});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var folderNameController = TextEditingController();
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return locale[TranslationsKeys.folderName]!;
                          }
                          return null;
                        },
                        controller: folderNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: locale[TranslationsKeys.folderName]!,
                          border: const UnderlineInputBorder(),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        onSubmit(folderNameController.text);

                        Navigator.pop(context);

                      }
                    },
                    child: Text(
                      locale[TranslationsKeys.done]!,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
