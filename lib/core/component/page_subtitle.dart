import 'package:flutter/material.dart';

class SubTitle extends Padding {
  SubTitle(BuildContext context, label, {Key? key})
      : super(
          key: key,
          padding: EdgeInsets.only(
            top: 30,
            left: MediaQuery.of(context).size.width * 0.035,
            right: MediaQuery.of(context).size.width * 0.035,
            bottom: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
}
