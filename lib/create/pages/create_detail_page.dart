import 'package:flutter/material.dart';

import 'package:diplomka/models/growing_plants.dart';

class CreateDetailPage extends StatefulWidget {
  const CreateDetailPage({super.key, required this.growingPlants});

  final GrowingPlants growingPlants;

  @override
  State<CreateDetailPage> createState() => _CreateDetailPageState();
}

class _CreateDetailPageState extends State<CreateDetailPage> {
  final jobCtl = TextEditingController();
  bool? isChecked = false;
  List<TizmeModel> tizmeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Тизме түзүү',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Text('Өсүмдүктүн аты:')),
                            Expanded(
                              child: Text(
                                widget.growingPlants.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Expanded(child: Text('Дата:')),
                            Expanded(
                              child: Text(
                                widget.growingPlants.date,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Expanded(child: Text('Саат:')),
                            Expanded(
                              child: Text(
                                widget.growingPlants.time,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Expanded(child: Text('Коментарий:')),
                            Expanded(
                              child: Text(
                                widget.growingPlants.comment,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: TextField(
                          controller: jobCtl,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: InputBorder.none,
                            hintText: 'Жумуш',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: () {
                      if (jobCtl.text.isNotEmpty) {
                        setState(() {
                          tizmeList.add(
                            TizmeModel(
                              nameJob: jobCtl.text,
                              isActive: false,
                            ),
                          );
                          jobCtl.clear();
                        });
                      }
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              tizmeList.isEmpty
                  ? const SizedBox()
                  : Card(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(6),
                        shrinkWrap: true,
                        itemCount: tizmeList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text('${index + 1}'),
                            title: Text(tizmeList[index].nameJob),
                            trailing: Checkbox(
                              value: tizmeList[index].isActive,
                              onChanged: (bool? value) {
                                setState(() {
                                  tizmeList[index].isActive = value ?? false;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
