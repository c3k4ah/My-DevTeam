import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/widget.dart';

@RoutePage()
class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

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
            onTap: () {},
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
