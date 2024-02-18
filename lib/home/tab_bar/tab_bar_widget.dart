import 'package:flash_task/common/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../common/themes/theme_color.dart';
import '../../common/constants/app_utils.dart';

class TabBarWidget extends StatelessWidget {
  final Function(int) onTabPressed;
  final int currentSelectedIndex;
  final TabController tabController;
  final double? tabItemHeight;
  final List<Widget> tabs;

  const TabBarWidget({
    Key? key,
    required this.tabs,
    this.tabItemHeight,
    required this.onTabPressed,
    required this.currentSelectedIndex,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      //This is responsible for the background of the tabbar, does the magic
      decoration: BoxDecoration(
        //This is for background color
        color: AppColor.fadeYellow,
        borderRadius: BorderRadius.circular(
          AppUtils.cornerRadius.w,
        ),
        //This is for bottom border that is needed
        border: Border.all(color: AppColor.primaryDarkColor),
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,

        /// unSelected
        unselectedLabelColor: AppColor.primaryDarkColor,
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),

        /// label
        labelColor: AppColor.white,
        labelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),

        //splashBorderRadius: BorderRadius.circular(50.0),

        /// indicator
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(
          color: AppColor.primaryDarkColor,
          borderRadius: BorderRadius.circular(
            AppUtils.cornerRadius.w,
          ),
        ),

        /// onTabPressed
        onTap: onTabPressed,

        /// list of tabs
        tabs: tabs,
      ),
    );
  }
}
