import 'package:flutter/material.dart';

import '../../services/realm/models/task_model.dart';

enum TaskCardStatus {
  pending(Icons.access_time, 'Pendentes'),
  completed(Icons.check, 'Concluídas'),
  disabled(Icons.cancel_outlined, 'Desativadas');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCard extends StatelessWidget {
  final TaskBoard board;

  const TaskCard({Key? key, required this.board}) : super(key: key);

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) {
      return 0;
    }
    final complete = tasks.where((task) => task.complete).length;
    return complete / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    final complete = tasks.where((task) => task.complete).length;
    return '$complete / ${tasks.length}';
  }

  TaskCardStatus getStatus(TaskBoard board, double progress) {
    if (!board.enable) {
      return TaskCardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.completed;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disabled:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final progress = getProgress(board.tasks);
    final progressText = getProgressText(board.tasks);
    final title = board.title;
    final status = getStatus(board, progress);

    final backgroundColor = getBackgroundColor(status, theme);
    final color = getColor(status, theme);

    final statusText = status.text;
    final iconData = status.icon;

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
            children: [
              Icon(
                iconData,
                color: theme.iconTheme.color?.withOpacity(0.5),
              ),
              const Spacer(),
              Text(
                statusText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (board.tasks.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearProgressIndicator(
            value: progress,
            color: color,
          ),
          const SizedBox(height: 2),
          Text(
            progressText,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.5),
            ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}
