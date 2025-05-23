import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/extensions/color_extension.dart';

import '../../common/theme/colors.dart';

class CommonSettingItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final IconData? actionIcon;
  final bool? isSwitchedOn;
  final Function onTap;
  final bool isSensitive;

  const CommonSettingItem({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.actionIcon,
    this.isSwitchedOn,
    required this.onTap,
    this.isSensitive = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        width: size.width,
        height: 30.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(
          bottom: 15,
          top: 15,
        ),
        child: Row(
          children: [
            Icon(
              leadingIcon,
              size: 20,
              color: isSensitive
                  ? kColorRed
                  : Theme.of(context)
                      .colorScheme
                      .secondary
                      .withValueOpacity(0.5),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleMedium
                    ?.copyWith(color: isSensitive ? kColorRed : null),
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            if (actionIcon == null && isSwitchedOn == null) const SizedBox(),
            if (actionIcon != null && isSwitchedOn == null)
              Icon(
                actionIcon,
                size: 15,
                color: isSensitive
                    ? kColorRed
                    : Theme.of(context)
                        .colorScheme
                        .secondary
                        .withValueOpacity(0.5),
              ),
            if (actionIcon == null && isSwitchedOn != null) ...[
              const SizedBox(width: 10.0),
              CupertinoSwitch(
                value: isSwitchedOn!,
                onChanged: (val) => onTap(),
                activeTrackColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ],
        ),
      ),
    );
  }
}
