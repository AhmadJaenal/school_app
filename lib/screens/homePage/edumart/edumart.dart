import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:school_app/controllers/classroom_controller.dart';
import 'package:school_app/shared/theme.dart';

class EdumartPage extends StatelessWidget {
  const EdumartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ClassroomController classroomController = ClassroomController();

    TabBar tabBar = TabBar(
      labelStyle: AppTextStyle.paragraphLBold.copyWith(color: AppColors.white),
      indicator: BoxDecoration(
          color: AppColors.primary1, borderRadius: BorderRadius.circular(8)),
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle:
          AppTextStyle.paragraphLBold.copyWith(color: AppColors.primary1),
      tabs: const [
        Tab(text: 'Makanan'),
        Tab(text: 'ATK'),
        Tab(text: 'Buku'),
        Tab(text: 'Baju'),
      ],
    );

    Widget foodCategory() {
      return FutureBuilder(
        future: classroomController.fetchClassrooms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final data = snapshot.data;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.3,
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
              itemCount: 10,
              itemBuilder: (context, index) {
                final classroom = data![index];
                return GestureDetector(
                  onTap: () => Get.toNamed('/detail-product', arguments: {
                    'id': classroom.id,
                  }),
                  child: Container(
                    width: 200,
                    height: 400,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.black60,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/image_product.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          classroom.name,
                          style: AppTextStyle.paragraphS.copyWith(
                            color: AppColors.black100,
                          ),
                        ),
                        Text(
                          'ABE',
                          style: AppTextStyle.paragraphXS.copyWith(
                            color: AppColors.black60,
                          ),
                        ),
                        Text(
                          'Rp60.000',
                          style: AppTextStyle.paragraphMBold.copyWith(
                            color: AppColors.black100,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Tidak ada data'));
          }
        },
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            elevation: 0,
            leading: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search, color: AppColors.black100),
            ),
            actions: [
              GestureDetector(
                onTap: () => Get.toNamed('/cart-product'),
                child: Padding(
                  padding: EdgeInsets.only(right: AppMargin.defaultMargin),
                  child: Icon(Icons.shopping_cart_outlined,
                      color: AppColors.black100),
                ),
              ),
            ],
            title: Text(
              'EduMart',
              style: AppTextStyle.h2.copyWith(color: AppColors.black100),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.defaultMargin,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black40,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: tabBar,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: TabBarView(
          children: [
            foodCategory(),
            foodCategory(),
            foodCategory(),
            foodCategory(),
          ],
        ),
      ),
    );
  }
}
