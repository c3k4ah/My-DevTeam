import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mydevteam/features/home/presentation/manager/home_bloc.dart';

import '../../../../core/routes/app_router.dart';
import '../../../auth/presentation/sign_in/manager/sign_in_bloc.dart';

class Sidebar extends StatelessWidget {
  final List<Widget> children;
  const Sidebar({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 70,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo_white.png',
            height: 50,
            width: 50,
          ),
          const SizedBox(
            height: 150,
          ),
          ...children,
          const Expanded(child: SizedBox()),
          const Icon(
            Ionicons.settings,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              context.read<HomeBloc>().add(DeleteUserEvent());
              context.read<AuthBloc>().add(ResetAuthStateEvent());
              context.router.push(const LoginRoute());
            },
            child: const Icon(
              Ionicons.log_out,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
