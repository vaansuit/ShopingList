import 'package:ShopList/src/home/widgets/task_card.dart';
import 'package:ShopList/src/services/realm/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';

void main() {

  final board = TaskBoard(Uuid.v4(), 'Nova Lista de Tarefas 1',);
  test('task card ...', ()  {
    final tasks = [
      Task(Uuid.v4(), '',complete: true),
      Task(Uuid.v4(), '',complete: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progress = TaskCard(board: board).getProgress(tasks);

    expect(progress, 0.5);
  });

  
}