import 'package:crud_project/routers/app_router.dart';
import 'package:crud_project/ui/utils/app_color.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../weight/app_bar_weight.dart';
import '../weight/common_card_widht.dart';
import '../weight/task_item_weight.dart';

class BottomHomeTask extends StatelessWidget {
  const BottomHomeTask({super.key});

  @override
  Widget build(BuildContext context) {

    final textThemes = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppbarWeight(textThemes: textThemes),
      body:BackgroundImage(child:  
      SingleChildScrollView(
        child: Column(
          children: [
            _BuildTaskSummaryByStatus(),
            TaskItemWeight()
          ],
        ),
      ),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.goNamed(AppRouter.addNesTask);
      },child: Icon(Icons.add),),
    );
  }
}


class _BuildTaskSummaryByStatus extends StatelessWidget {
  const _BuildTaskSummaryByStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          common_card_weight(counter: "09",semi_counter: "Progress",),
          common_card_weight(counter: "10",semi_counter: "Refersh",),
          common_card_weight(counter: "11",semi_counter: "Completed",),
          common_card_weight(counter: "12",semi_counter: "Canceled",),
        ],
      ),
    );
  }
}


