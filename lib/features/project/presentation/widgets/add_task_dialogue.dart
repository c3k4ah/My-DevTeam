import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mydevteam/core/DTO/entities/task_entity.dart';
import 'package:mydevteam/core/DTO/entities/user_enetity.dart';
import 'package:mydevteam/core/extensions/date_time_extension.dart';
import 'package:mydevteam/features/project/presentation/manager/project_bloc.dart';

void showAddTaskDialogue({
  required BuildContext context,
  required Function(TaskEntity task) onConfirm,
}) {
  showAdaptiveDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        children: [
          AddTaskWidget(
            onConfirm: onConfirm,
          )
        ],
      );
    },
  );
}

class AddTaskWidget extends StatefulWidget {
  final Function(TaskEntity task) onConfirm;
  const AddTaskWidget({super.key, required this.onConfirm});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  //initial value
  String title = '';
  String desc = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<String> selectedUsers = [];
  List<UserEntity> users = [];
  // text controller
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    startDateController.text = startDate.formatToHuman;
    endDateController.text = endDate.formatToHuman;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      height: 600,
      width: 600,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Ajouter une nouvelle tache',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Titre',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: startDateController,
                          readOnly: true,
                          onTap: () async {
                            await pickDate(
                                context: context,
                                onChanged: (date) {
                                  setState(() {
                                    startDateController.text =
                                        date.formatToHuman;
                                    startDate = date;
                                  });
                                });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Date de commencement',
                            suffixIcon: Icon(
                              Ionicons.calendar_number,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: endDateController,
                          readOnly: true,
                          onTap: () async {
                            await pickDate(
                                context: context,
                                onChanged: (date) {
                                  setState(() {
                                    endDateController.text = date.formatToHuman;
                                    endDate = date;
                                  });
                                });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Date de fin',
                            suffixIcon: Icon(
                              Ionicons.calendar_number,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Text(
                      'Choisir un responsable',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      return Expanded(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              UserEntity user = state.users[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(5),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox.adaptive(
                                      activeColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      value: selectedUsers.contains(user.id),
                                      onChanged: (value) {
                                        if (selectedUsers.contains(user.id)) {
                                          setState(() {
                                            selectedUsers.remove(user.id);
                                          });
                                        } else {
                                          setState(() {
                                            selectedUsers.add(user.id ?? '');
                                          });
                                        }
                                      },
                                    ),
                                    Text(
                                      user.email ?? '',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                  width: 150,
                  child: MaterialButton(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      context.popRoute();
                    },
                    child: const Text(
                      'Annuler',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 150,
                  child: MaterialButton(
                    color: Colors.blue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      TaskEntity task = TaskEntity(
                        members: selectedUsers,
                        title: titleController.text,
                        description: descController.text,
                        starDate: startDate,
                        endDate: endDate,
                      );
                      widget.onConfirm(task);
                      context.popRoute();
                    },
                    child: const Text(
                      'Confirmer',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> pickDate({
    required Function(DateTime date) onChanged,
    required BuildContext context,
  }) async {
    final date = await showDatePicker(
      context: context,
      confirmText: 'Confirmer',
      cancelText: 'Anuller',
      initialDate: startDate,
      firstDate: startDate,
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 2),
      ),
    );

    if (date == null) return;
    onChanged(date);
  }
}
