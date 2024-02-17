import 'package:flash_task/common/extensions/size_extensions.dart';
import 'package:flash_task/home/tab_bar/tab_bar_widget.dart';
import 'package:flash_task/home/tab_bar/tab_item.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constants/app_utils.dart';
import '../currency_exchange/presentation/exchange_rate_screen/_exchange_rate_screen.dart';
import '../gold_price/presentation/gold_exchange_prices_screen/gold_exchange_prices_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /// TabController
  late final TabController _tabController;

  /// current tab selected index
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      ///
      /// appbar
      ///
      appBar: AppBar(
        title: const Text("Trade Exchange"),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppUtils.mainPagesHorizontalPadding.w,
          vertical: 20,
        ),
        child: Column(
          children: [
            ///TabBar widget
            TabBarWidget(
              currentSelectedIndex: currentIndex,
              tabController: _tabController,
              onTabPressed: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              tabs: const [
                TabItem(
                  text: "Currency",
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                TabItem(
                  text: "Gold",
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            /// TabBarView
            Expanded(
              child: TabBarView(
                //physics: NeverScrollableScrollPhysics(),
                controller: _tabController,

                children: const [
                  /// Currency exchange
                  ExchangeRateScreen(),

                  /// Gold
                  GoldExchangePricesScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
