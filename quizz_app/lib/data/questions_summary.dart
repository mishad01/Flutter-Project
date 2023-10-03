import 'package:flutter/material.dart';
import 'package:quizz_app/data/summary_Item.dart';

class questionsSummary extends StatelessWidget {
  const questionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return summaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
