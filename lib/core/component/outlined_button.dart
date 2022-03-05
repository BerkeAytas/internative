import 'package:flutter/material.dart';
import 'package:internative/core/shared/costum_shared.dart';

class OutlinedButtonDesign extends OutlinedButton {
  OutlinedButtonDesign(BuildContext context, label, func, {Key? key})
      : super(
          key: key,
          onPressed: func,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.exit_to_app),
              Text(
                label,
                style: Theme.of(context).textTheme.subtitle2!,
              ),
              const SizedBox(),
            ],
          ),
        );
}
