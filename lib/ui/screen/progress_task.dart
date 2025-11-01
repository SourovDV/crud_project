import 'package:crud_project/ui/utils/app_color.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';

import '../weight/app_bar_weight.dart';
import '../weight/common_card_widht.dart';
import '../weight/task_item_weight.dart';

class ProgressTask extends StatelessWidget {
  const ProgressTask({super.key});

  @override
  Widget build(BuildContext context) {

    final textThemes = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppbarWeight(textThemes: textThemes),
        body:BackgroundImage(child:
        SingleChildScrollView(
          child: Column(
            children: [

              TaskItemWeight()
            ],
          ),
        ),)
    );
  }
}





