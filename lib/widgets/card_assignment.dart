import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/project_assignment.dart';
import 'package:school_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/theme.dart';

class CardAssignment extends StatefulWidget {
  final ProjectAssignment assignment;
  final Function()? onLongPress;
  const CardAssignment({super.key, required this.assignment, this.onLongPress});

  @override
  State<CardAssignment> createState() => _CardAssignmentState();
}

class _CardAssignmentState extends State<CardAssignment> {
  saveProjectId(projectId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('projectId', projectId);
  }

  @override
  void initState() {
    saveProjectId(widget.assignment.id);
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
              saveProjectId(widget.assignment.id);
            },
            onLongPress: widget.onLongPress,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
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
                      Text(
                        widget.assignment.user!.fullName!,
                        style: AppTextStyle.h3.copyWith(color: AppColors.white),
                      ),
                      const Spacer(),
                      Text(
                        widget.assignment.project!.name!,
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
