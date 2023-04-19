import 'package:flutter/material.dart';

import '../../services/realm/models/task_model.dart';


enum TaskCardStatus {
  pending(Icons.access_time, 'Pendentes'), completed(Icons.check, 'Concluídas'), disabled(Icons.cancel_outlined, 'Desativadas');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}
class TaskCard extends StatelessWidget {
  
  final TaskBoard board;
  
  const TaskCard({Key? key, required this.board}) : super(key: key);

  double getProgress(List<Task> tasks) {

    if(tasks.isEmpty) {
      return 0;
    }
    final complete = tasks.where((task) => task.complete).length;
    return complete / tasks.length;
  }
  String getProgressText(List<Task> tasks) {

    
    final complete = tasks.where((task) => task.complete).length;
    return '$complete / ${tasks.length}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = getProgress(board.tasks);
    final progressText = getProgressText(board.tasks);
    final title = board.title;
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
          Text(title),
          LinearProgressIndicator(
            value: progress,
            color: color,
          ),
          Text(progressText),
        ],
      ),
    );
  }
}
