import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:school_app/commons/app_colors.dart';
import 'package:school_app/commons/app_margin.dart';
import 'package:school_app/commons/app_text_styles.dart';

class HistoryPayment extends StatelessWidget {
  const HistoryPayment({super.key});

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      labelStyle: AppTextStyle.paragraphLBold.copyWith(color: AppColors.white),
      indicator: BoxDecoration(
        color: AppColors.primary1,
        borderRadius: BorderRadius.circular(8),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle: AppTextStyle.paragraphLBold.copyWith(
        color: AppColors.primary1,
      ),
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
            return Container(
              width: double.infinity,
              height: 65,
              margin: EdgeInsets.symmetric(
                horizontal: AppMargin.defaultMargin,
                vertical: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.paragraphL.copyWith(
                        color: AppColors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: 'EduMart\n'),
                        TextSpan(
                          text: 'Rp42.000\n',
                          style: AppTextStyle.h3.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: '3 Item',
                          style: AppTextStyle.paragraphS.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      style: AppTextStyle.paragraphL.copyWith(
                        color: AppColors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(text: '26 Agt 2023\n'),
                        TextSpan(
                          text: '\n',
                          style: AppTextStyle.h3.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Virtual Account ',
                          style: AppTextStyle.paragraphS.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    Widget event() {
      double width = MediaQuery.of(context).size.width;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no_payment_history.png', width: width * .7),
          Text(
            'Riwayat kosong',
            style: AppTextStyle.h2.copyWith(color: AppColors.black),
          ),
          const Gap(10),
          SizedBox(
            width: width * .8,
            child: Text(
              'Sepertinya belum ada pembayaran yang tercatat. Mulai berbelanja sekarang dan buat riwayat belanja yang seru!',
              style: AppTextStyle.paragraphL.copyWith(color: AppColors.black80),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    Widget spp() {
      double width = MediaQuery.of(context).size.width;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no_payment_history.png', width: width * .7),
          Text(
            'Riwayat kosong',
            style: AppTextStyle.h2.copyWith(color: AppColors.black),
          ),
          const Gap(10),
          SizedBox(
            width: width * .8,
            child: Text(
              'Sepertinya belum ada pembayaran yang tercatat. Mulai berbelanja sekarang dan buat riwayat belanja yang seru!',
              style: AppTextStyle.paragraphL.copyWith(color: AppColors.black80),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.black,
              ),
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
        body: TabBarView(children: [product(), spp(), event()]),
      ),
    );
  }
}
