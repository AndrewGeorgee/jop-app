import 'package:flutter/material.dart';
import 'package:job_application/core/utils/colors.dart';

import '../utils/styles.dart';

class TextFormFeildWidget extends StatelessWidget {
  const TextFormFeildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.5,
              color: ColorManager.textFormFeildColor), //<-- SEE HERE
          borderRadius: BorderRadius.circular(13.0),
        ),
        hintText: 'E-mail',
        prefixIcon: const Icon(Icons.email_outlined),
        hintStyle: Styles.textStylesHintText,
      ),
    );
  }
}
