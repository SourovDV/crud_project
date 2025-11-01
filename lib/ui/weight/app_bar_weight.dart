import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class AppbarWeight extends StatelessWidget implements PreferredSizeWidget{
  const AppbarWeight({
    super.key,
    required this.textThemes,
  });

  final TextTheme textThemes;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.appColor,
      title: Row(
        children: [
          CircleAvatar(),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sourov Chandra",style:textThemes.titleMedium?.copyWith(color: Colors.white)),
                Text("sourovchandra65@gmail.com",style: textThemes.titleSmall?.copyWith(color: Colors.white),)
              ],
            ),
          ),
          Icon(Icons.logout)

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
