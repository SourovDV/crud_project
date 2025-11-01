import 'package:flutter/material.dart';

class common_card_weight extends StatelessWidget {
  common_card_weight({
    super.key, required this.counter, required this.semi_counter,
  });

  final String counter ;
  final String semi_counter;

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 30),
        child: Column(
          children: [
            Text(counter,style: textThemes.titleLarge,),
            Text(semi_counter)
          ],
        ),
      ),
    );
  }
}
