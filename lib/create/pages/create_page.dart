import 'package:diplomka/create/cubit/create_cubit.dart';
import 'package:diplomka/create/pages/create_detail_page.dart';
import 'package:diplomka/models/growing_plants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final nameCtl = TextEditingController();
  final commentCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Өсүмдүктөр өстүрүү'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<CreateCubit, CreateState>(
          builder: (context, state) {
            if (state.growingPlants.isEmpty) {
              return const Center(child: Text('Азырынча өсүмдүк жок'));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Баардык өсүмдүктөр'),
                  const SizedBox(height: 10),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: state.growingPlants.length,
                    itemBuilder: (context, index) {
                      return Card(
                        surfaceTintColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateDetailPage(
                                  growingPlants: state.growingPlants[index],
                                ),
                              ),
                            );
                          },
                          leading: Text('${index + 1}'),
                          title: Text(state.growingPlants[index].name),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Өсүмдүк кошуу',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: nameCtl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Аталышы',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                DateTime date = DateTime.now();
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                    height: 216,
                                    padding: const EdgeInsets.only(top: 6.0),
                                    margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    color: CupertinoColors.systemBackground
                                        .resolveFrom(context),
                                    child: SafeArea(
                                      top: false,
                                      child: CupertinoDatePicker(
                                        initialDateTime: date,
                                        mode: CupertinoDatePickerMode.date,
                                        use24hFormat: true,
                                        showDayOfWeek: true,
                                        onDateTimeChanged: (DateTime newDate) {
                                          String formattedDate =
                                              DateFormat('dd.MM.yyyy')
                                                  .format(newDate);
                                          context.read<CreateCubit>().saveDate(
                                              TypeDateTime.date, formattedDate);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: BlocBuilder<CreateCubit, CreateState>(
                                builder: (context, state) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: state.date != null
                                          ? Text(state.date!)
                                          : Text(
                                              DateFormat('dd.MM.yyyy')
                                                  .format(DateTime.now()),
                                            ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                DateTime time = DateTime.now();
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                    height: 216,
                                    padding: const EdgeInsets.only(top: 6.0),
                                    margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    color: CupertinoColors.systemBackground
                                        .resolveFrom(context),
                                    child: SafeArea(
                                      top: false,
                                      child: CupertinoDatePicker(
                                        initialDateTime: time,
                                        mode: CupertinoDatePickerMode.time,
                                        use24hFormat: true,
                                        showDayOfWeek: true,
                                        onDateTimeChanged: (DateTime newDate) {
                                          String formattedTime =
                                              DateFormat('HH:mm')
                                                  .format(newDate);
                                          context.read<CreateCubit>().saveDate(
                                              TypeDateTime.time, formattedTime);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: BlocBuilder<CreateCubit, CreateState>(
                                builder: (context, state) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: state.time != null
                                          ? Text(state.time!)
                                          : Text(
                                              DateFormat('HH:mm').format(
                                                DateTime.now(),
                                              ),
                                            ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: commentCtl,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Коментарий',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: ElevatedButton(
                          onPressed: () {
                            final state = context.read<CreateCubit>().state;
                            if (nameCtl.text.isNotEmpty &&
                                commentCtl.text.isNotEmpty) {
                              context.read<CreateCubit>().addPlants(
                                    GrowingPlants(
                                      name: nameCtl.text,
                                      date: state.date ??
                                          DateFormat('dd.MM.yyyy')
                                              .format(DateTime.now()),
                                      time: state.time ??
                                          DateFormat('HH:mm').format(
                                            DateTime.now(),
                                          ),
                                      comment: commentCtl.text,
                                    ),
                                  );

                              nameCtl.clear();
                              commentCtl.clear();
                            }
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                          ),
                          child: const Text('Сактоо'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
