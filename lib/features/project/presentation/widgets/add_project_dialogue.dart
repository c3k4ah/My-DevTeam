import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:mydevteam/core/DTO/entities/user_enetity.dart';
import 'package:mydevteam/core/extensions/date_time_extension.dart';
import 'package:mydevteam/features/project/domain/entities/project.entity.dart';
import 'package:mydevteam/features/project/presentation/manager/project_bloc.dart';

void showAddProjectDialogue({
  required BuildContext context,
  required Function(ProjectEntity project) onConfirm,
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
        // contentPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        children: [
          AddProjectWidget(
            onConfirm: onConfirm,
          )
        ],
      );
    },
  );
}

class AddProjectWidget extends StatefulWidget {
  final Function(ProjectEntity project) onConfirm;
  const AddProjectWidget({super.key, required this.onConfirm});

  @override
  State<AddProjectWidget> createState() => _AddProjectWidgetState();
}

class _AddProjectWidgetState extends State<AddProjectWidget> {
  //initial value
  String title = '';
  String desc = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<String> selectedUsers = [];
  String selectedManager = '';
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
      height: 650,
      width: 600,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Creation de projet',
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
                                      endDateController.text =
                                          date.formatToHuman;
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
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Text(
                              'Choisir un chef de projet',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 130,
                            width: MediaQuery.sizeOf(context).width,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                UserEntity user = state.users[index];
                                return checkUserWidget(
                                  value: selectedManager == user.id,
                                  user: user,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedManager = user.id ?? '';
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                            width: MediaQuery.sizeOf(context).width,
                            child: const Text(
                              'Former une equipe',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 130,
                            width: MediaQuery.sizeOf(context).width,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                UserEntity user = state.users[index];
                                return checkUserWidget(
                                  value: selectedUsers.contains(user.id),
                                  user: user,
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
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
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
                        ProjectEntity project = ProjectEntity(
                          members: selectedUsers,
                          title: titleController.text,
                          description: descController.text,
                          starDate: startDate,
                          endDate: endDate,
                        );
                        widget.onConfirm(project);
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

  Widget checkUserWidget({
    required UserEntity user,
    required bool value,
    required Function(bool? value) onChanged,
  }) {
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
            value: value,
            onChanged: onChanged,
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
  }
}
