import 'package:ecommerce/controller/orders_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with TickerProviderStateMixin {
  late OrdersController ordersController;
  @override
  void initState() {
    ordersController = Provider.of<OrdersController>(context, listen: false);
    ordersController.tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    ordersController.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
        bottom: TabBar(
          controller: ordersController.tabController,
          indicatorColor: AppColors.whiteColor,
          unselectedLabelStyle: AppTextStyle.inAtiveTabBarStyle,
          labelStyle: AppTextStyle.activeTabBarStyle,
          padding: AppPadding.sidePading15,
          tabs: const [
            Tab(
              text: "Ongoing",
            ),
            Tab(
              text: "Completed",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: ordersController.tabController,
          children: const [
            CustomNotFoundWidget(
              title: "Not Found",
              subtitle: "You dont't have an ongoing order at this time",
            ),
            CustomNotFoundWidget(
              title: "Not Found",
              subtitle: "You dont't have an ongoing order at this time",
            ),
          ],
        ),
      ),
    );
  }
}
