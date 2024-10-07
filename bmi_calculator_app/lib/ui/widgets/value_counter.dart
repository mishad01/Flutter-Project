import 'package:flutter/material.dart';

class ValueCounter extends StatelessWidget {
  const ValueCounter({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17.6,
            ),
          ),
          Text(
            '40',
            style:
                const TextStyle(fontSize: 57.39, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff081854),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: const Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff081854),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Text(
                    '+',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
