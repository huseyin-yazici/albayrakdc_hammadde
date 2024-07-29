
import 'package:albayrakdc_hammadde/core/extentions/context_extentions.dart';
import 'package:albayrakdc_hammadde/core/extentions/num_extentions.dart';
import 'package:flutter/material.dart';

import '../../constans/app/color_constans.dart';
import '../../constans/app/string_constants.dart';
import '../text/custom_text.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHome = false,
  }) : super(key: key);

  final bool isHome;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.isHome ? 60.pw : 0.pw,
          Image.asset(
            "assets/images/logo0.png",
            height: context.dynamicHeight(0.03),
            width: context.dynamicWidth(0.06),
          ),
          7.pw,
          CustomText(
            StringConstants.appName,
            textStyle: context.textTheme.headlineSmall,
          ),
        ],
      ),
      actions: [
        widget.isHome
            ? IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: ColorConstants.black,
                ),
              )
            : const SizedBox.shrink(),
        10.pw,
      ],
    );
  }
}
