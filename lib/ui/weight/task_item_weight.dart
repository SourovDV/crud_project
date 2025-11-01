import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class TaskItemWeight extends StatelessWidget {
  const TaskItemWeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 10,
      itemBuilder: (context, index){
        return Card(
          elevation: 0,
          color: Colors.white,
          child: ListTile(
            title: Text("Title will be here"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Decerotation will be here"),
                Text("12/2/2026"),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.appColor,
                      ),
                      height: 30,
                      width: 60,
                      child: Center(child: Text("New",style: TextStyle(color: Colors.white),),),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete))                            ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
