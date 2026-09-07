import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/school.dart';
import 'package:school_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/theme.dart';

class CardSchool extends StatefulWidget {
  final SchoolModel school;
  final Function()? onLongPress;
  const CardSchool({super.key, required this.school, this.onLongPress});

  @override
  State<CardSchool> createState() => CardSchoolState();
}

class CardSchoolState extends State<CardSchool> {
  saveSchoolId(schoolId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('schoolId', schoolId);
  }

  @override
  void initState() {
    saveSchoolId(widget.school.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserPreferences userPrefs = UserPreferences();

    return FutureBuilder(
      future: userPrefs.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          User userData = snapshot.data!;
          return GestureDetector(
            onTap: () {
              saveSchoolId(widget.school.id);
            },
            onLongPress: widget.onLongPress,
            child: Row(
              children: [
                Container(
                  width: 61,
                  height: 61,
                  padding: const EdgeInsets.all(17),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary1,
                  ),
                  child: Icon(Icons.school, color: AppColors.white, size: 26),
                ),
                const Gap(16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.school.name!,
                        style: AppTextStyle.paragraphL.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\nDurasi Magang : ${widget.school.durationIntern} Bulan',
                        style: AppTextStyle.paragraphL.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        }
        return const Text('Tidak ada project');
      },
    );
  }
}


// GestureDetector cardDataChildren(
//       {required User user, Function()? onLongPress}) {
//     return GestureDetector(
//       onTap: () {
//         saveIntenshipId(user.id);
//       },
//       onLongPress: onLongPress,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppMargin.defaultMargin),
//         child: Row(
//           children: [
//             Container(
//               width: 61,
//               height: 61,
//               padding: const EdgeInsets.all(17),
//               margin: const EdgeInsets.only(bottom: 8),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.primary1,
//               ),
//               child: Image.asset('assets/icon_student.png'),
//             ),
//             const Gap(16),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: '${user.fullName}\n',
//                     style: AppTextStyle.paragraphL
//                         .copyWith(color: AppColors.black),
//                   ),
//                   TextSpan(
//                     text: user.email,
//                     style: AppTextStyle.paragraphL
//                         .copyWith(color: AppColors.black),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Text(
//               'Kelas 8A',
//               style: AppTextStyle.paragraphM.copyWith(color: AppColors.black),
//             )
//           ],
//         ),
//       ),
//     );
//   }


// Container(
//               width: MediaQuery.of(context).size.width,
//               height: 150,
//               padding: const EdgeInsets.all(9.0),
//               margin: const EdgeInsets.only(bottom: 12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: const DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage('assets/image_product.png'),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Spacer(),
//                       Text(
//                         widget.school.name!,
//                         style: AppTextStyle.h3.copyWith(color: AppColors.white),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     style: const ButtonStyle(),
//                     onPressed: () {},
//                     icon: Container(
//                       width: 43,
//                       height: 43,
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: AppColors.white,
//                       ),
//                       child: const Icon(Icons.check),
//                     ),
//                   ),
//                 ],
//               ),
//             ),