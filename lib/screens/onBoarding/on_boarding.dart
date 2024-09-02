import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final CarouselSliderController _controller = CarouselSliderController();
  get controllerCarousel => _controller;
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<List<String>> onBoarding = [
      [
        "onboard1.png",
        "Absensi Harian yang Mudah",
        "Catat kehadiran siswa secara praktis, baik saat masuk maupun pulang.."
      ],
      [
        "onboard2.png",
        "Belanja dengan Nyaman",
        "Telusuri produk EduMart sekolah dan tambahkan ke keranjang dengan satu ketukan."
      ],
      [
        "onboard3.png",
        "Pembayaran SPP Aman",
        "Lakukan pembayaran SPP melalui metode pembayaran yang aman dan terpercaya."
      ],
    ];
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: height,
              aspectRatio: 2,
              viewportFraction: 2,
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            carouselController: controllerCarousel,
            items: onBoarding.map((hero) {
              return Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image.asset(
                  'assets/${hero[0]}',
                ),
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppMargin.defaultMargin, vertical: 30),
        width: double.infinity,
        height: height * .4,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _current == 0 ? 50 : 10,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color:
                        _current == 0 ? AppColors.primary3 : AppColors.black40,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _current == 1 ? 50 : 10,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color:
                        _current == 1 ? AppColors.primary3 : AppColors.black40,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _current == 2 ? 50 : 10,
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color:
                        _current == 2 ? AppColors.primary3 : AppColors.black40,
                  ),
                ),
              ],
            ),
            const Gap(20),
            Text(
              onBoarding[_current][1],
              style: AppTextStyle.h1.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            const Gap(10),
            Text(
              onBoarding[_current][2],
              style: AppTextStyle.paragraphM.copyWith(color: AppColors.black80),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
              titleButton: 'Selanjutnya',
              ontap: () {
                Get.toNamed('/login');
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
