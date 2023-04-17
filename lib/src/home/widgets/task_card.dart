import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.ads_click),
              Spacer(),
              Text('Teste de Sanidade'),
            ],
          ),
          const Spacer(),
          const Text('Teste'),
          const LinearProgressIndicator(
            value: 0.1,
          ),
          const Text('1/5'),
        ],
      ),
    );
  }
}
