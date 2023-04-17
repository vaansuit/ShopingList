import 'package:flutter/material.dart';

import '../../services/realm/models/task_model.dart';

class TaskCard extends StatelessWidget {
  
  final TaskBoard board;
  
  const TaskCard({Key? key, required this.board}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const progress = 0.2;
    const progressText = '1/5';
    const title = 'Título';
    final backgroundColor = Colors.blue.withOpacity(0.5);
    const color = Colors.blue;
    const statusText = 'Pendente';
    const iconData = Icons.access_alarm;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
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
              Icon(iconData),
              Spacer(),
              Text(statusText),
            ],
          ),
          const Spacer(),
          const Text(title),
          const LinearProgressIndicator(
            value: progress,
            color: color,
          ),
          const Text(progressText),
        ],
      ),
    );
  }
}
