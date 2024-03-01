import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/features/project/domain/domaine.dart';
import 'package:mydevteam/features/project/presentation/widgets/add_project_dialogue.dart';

import '../manager/project_bloc.dart';
import '../widgets/widget.dart';

@RoutePage()
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  void initState() {
    context.read<ProjectBloc>().add(const ProjectLoadAllUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text(
          'Project',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showAddProjectDialogue(
                context: context,
                onConfirm: (project) {
                  ProjectEntity newPrroject = project.copyWith(
                    progression: 1,
                  );
                  context
                      .read<ProjectBloc>()
                      .add(ProjectCreateEvent(newPrroject));
                },
              );
            },
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 10,
              ),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  '+ Nouveau projet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10).copyWith(top: 0),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          children: [
            CategorySection(),
            SearchBarWidget(),
            Expanded(child: ProjectSection()),
          ],
        ),
      ),
    );
  }
}
