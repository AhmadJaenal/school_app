import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/screens/homePage/profile/history_payment.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/card_cart_product.dart';

class HistoryEdumart extends StatelessWidget {
  const HistoryEdumart({super.key});

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      labelStyle: AppTextStyle.paragraphLBold.copyWith(color: AppColors.white),
      indicator: BoxDecoration(
          color: AppColors.primary1, borderRadius: BorderRadius.circular(8)),
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle:
          AppTextStyle.paragraphLBold.copyWith(color: AppColors.primary1),
      tabs: const [
        Tab(text: 'Produk'),
        Tab(text: 'SPP'),
        Tab(text: 'Event'),
      ],
    );

    Widget product() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return cartHistoryProduct();
          },
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back_ios_new_rounded,
                  color: AppColors.black),
            ),
            title: Text(
              'Riwayat Pembayaran',
              style: AppTextStyle.h2.copyWith(color: AppColors.black),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.defaultMargin,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black40,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: tabBar,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            product(),
            product(),
            product(),
          ],
        ),
      ),
    );
  }
}
