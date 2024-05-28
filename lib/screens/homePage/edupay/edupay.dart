import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/shared/theme.dart';
import 'package:school_app/widgets/custom_button.dart';
import 'package:school_app/widgets/custom_textfield.dart';
import 'package:school_app/widgets/transaction_widget.dart';

class Edupay extends StatelessWidget {
  Edupay({super.key});

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'EduPay',
          style: AppTextStyle.h2.copyWith(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 113,
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.secondary1,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/pattern_edupay.png'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saldo EduPay',
                        style: AppTextStyle.h3.copyWith(color: AppColors.white),
                      ),
                      Text(
                        'Rp1.200.000',
                        style: AppTextStyle.h2.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 32,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => DraggableScrollableSheet(
                                expand: false,
                                initialChildSize: 0.6,
                                minChildSize: 0.5,
                                maxChildSize: 1.0,
                                builder: (BuildContext context,
                                        ScrollController scrollController) =>
                                    SingleChildScrollView(
                                  controller: scrollController,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 50,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.black60,
                                            ),
                                          ),
                                        ),
                                        const Gap(16),
                                        Center(
                                          child: Text(
                                            'Tabungkan',
                                            style: AppTextStyle.h3.copyWith(
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        const Gap(12),
                                        Text(
                                          'Jumlah Simpan (Rp)',
                                          style:
                                              AppTextStyle.paragraphL.copyWith(
                                            color: AppColors.black80,
                                          ),
                                        ),
                                        const Gap(16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CardNominal(
                                              amount: '10.000',
                                              onPressed: () {},
                                            ),
                                            CardNominal(
                                              amount: '20.000',
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        const Gap(12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CardNominal(
                                              amount: '50.000',
                                              onPressed: () {},
                                            ),
                                            CardNominal(
                                              amount: '100.000',
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        const Gap(12),
                                        CustomTextField(
                                          hintText: 'Masukan Nominal',
                                          titleTextField:
                                              'Masukkan Jumlah (Rp)',
                                          textController: amountController,
                                        ),
                                        const Gap(16),
                                        Text(
                                          'Masukkan nominal uang yang akan Anda/n Tabungkan.',
                                          style:
                                              AppTextStyle.paragraphL.copyWith(
                                            color: AppColors.black80,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Gap(16),
                                        PrimaryButton(
                                            titleButton: 'Simpan',
                                            ontap: () {}),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            minimumSize: const Size(double.infinity, 56),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.file_download_outlined,
                              color: AppColors.secondary1),
                          label: Text(
                            'Tabungkan',
                            style: AppTextStyle.paragraphSBold.copyWith(
                              color: AppColors.secondary1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 32,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 25),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Top-Up Saldo EduPay',
                                        style: AppTextStyle.h3.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    const Gap(12),
                                    Text(
                                      'Jumlah Simpan (Rp)',
                                      style: AppTextStyle.paragraphL.copyWith(
                                        color: AppColors.black80,
                                      ),
                                    ),
                                    const Gap(16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CardNominal(
                                          amount: '10.000',
                                          onPressed: () {},
                                        ),
                                        CardNominal(
                                          amount: '20.000',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    const Gap(12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CardNominal(
                                          amount: '50.000',
                                          onPressed: () {},
                                        ),
                                        CardNominal(
                                          amount: '100.000',
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    const Gap(12),
                                    CustomTextField(
                                      hintText: 'Masukan Nominal',
                                      titleTextField: 'Masukkan Jumlah (Rp)',
                                      textController: amountController,
                                    ),
                                    const Gap(16),
                                    Text(
                                      'Masukkan nominal Top-Up yang ingin anda isi.',
                                      style: AppTextStyle.paragraphL.copyWith(
                                        color: AppColors.black80,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Gap(16),
                                    PrimaryButton(
                                        titleButton: 'Simpan', ontap: () {}),
                                  ],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            minimumSize: const Size(double.infinity, 56),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.add_circle_outline_outlined,
                              color: AppColors.secondary1),
                          label: Text(
                            'Top-Up',
                            style: AppTextStyle.paragraphSBold.copyWith(
                              color: AppColors.secondary1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(17),
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black40,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tabungan',
                        style: AppTextStyle.paragraphMBold
                            .copyWith(color: AppColors.black100),
                      ),
                      Text(
                        'Rp500.000',
                        style:
                            AppTextStyle.h2.copyWith(color: AppColors.black100),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tarik Uang',
                        style: AppTextStyle.paragraphXS
                            .copyWith(color: AppColors.black100),
                      ),
                      SizedBox(
                        width: 130,
                        height: 32,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                height: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(16),
                                    Center(
                                      child: Text(
                                        'Ambil Uang',
                                        style: AppTextStyle.h3.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    const Gap(12),
                                    CustomTextField(
                                      hintText: 'Masukkan Jumlah (Rp)',
                                      titleTextField: 'Masukkan Nominal',
                                      textController: amountController,
                                    ),
                                    const Gap(16),
                                    Text(
                                      'Masukkan nominal uang yang akan Anda Ambil.',
                                      style: AppTextStyle.paragraphL.copyWith(
                                        color: AppColors.black80,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Gap(16),
                                    PrimaryButton(
                                        titleButton: 'Simpan', ontap: () {}),
                                  ],
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.primary1,
                            minimumSize: const Size(double.infinity, 56),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: Icon(Icons.file_upload_outlined,
                              color: AppColors.white),
                          label: Text(
                            'Ambil Tabungan',
                            style: AppTextStyle.paragraphSBold.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(17),
            Text(
              'Pembayaran Tagihan',
              style: AppTextStyle.h3.copyWith(
                color: AppColors.black,
              ),
            ),
            const Gap(12),
            GestureDetector(
              onTap: () => Get.toNamed('/bill-page'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.info1.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset('assets/icon_student_black.png'),
                  ),
                  const Gap(4),
                  SizedBox(
                    width: 48,
                    child: Text(
                      'Tagihan SPP',
                      style: AppTextStyle.paragraphXSBold.copyWith(
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Riwayat',
                  style: AppTextStyle.h3.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: AppTextStyle.paragraphM.copyWith(
                    color: AppColors.primary1,
                  ),
                ),
              ],
            ),
            const Gap(12),
            SizedBox(
              height: height * .3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => const TransactionWidget(
                  date: '06 May 2023',
                  amount: '50.000',
                  titleTransaction: 'Simpan Uang',
                  isCashIn: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
