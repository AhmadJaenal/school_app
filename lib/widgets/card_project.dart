import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/project.dart';
import 'package:school_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/theme.dart';

class CardProject extends StatefulWidget {
  final Project project;
  final Function()? onLongPress;
  const CardProject({super.key, required this.project, this.onLongPress});

  @override
  State<CardProject> createState() => _CardProjectState();
}

class _CardProjectState extends State<CardProject> {
  saveProjectId(projectId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('projectId', projectId);
  }

  @override
  void initState() {
    saveProjectId(widget.project.id);
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
              saveProjectId(widget.project.id);
              Get.toNamed('/detail-project');
            },
            onLongPress: widget.onLongPress,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              padding: const EdgeInsets.all(9.0),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image_product.png'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        widget.project.name!,
                        style: AppTextStyle.h3.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  IconButton(
                    style: const ButtonStyle(),
                    onPressed: () {},
                    icon: Container(
                      width: 43,
                      height: 43,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: const Icon(Icons.check),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Text('Tidak ada project');
      },
    );
  }
}
