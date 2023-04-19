import 'package:ShopList/src/home/widgets/task_card.dart';
import 'package:ShopList/src/widgets/user_image_button.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

import '../services/realm/models/task_model.dart';
import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('ShopList'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: UserImageButton(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 80,
                left: 25,
                right: 25,
                bottom: 200,
              ),
              itemBuilder: (_context, index) {
                final board = TaskBoard(
                    Uuid.v4(),
                    'Nova Lista de Tarefas 1',
                    tasks:  [
                      Task(Uuid.v4(), '', complete: true),
                      Task(Uuid.v4(), '', complete: true),
                      Task(Uuid.v4(), '', complete: true),
                      Task(Uuid.v4(), '', complete: true),
                    ]);
                return TaskCard(board: board);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: 50,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídos'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativados'),
                    ),
                  ],
                  selected: const {1},
                  onSelectionChanged: (values) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
