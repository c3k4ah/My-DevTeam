import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/features/home/presentation/manager/home_bloc.dart';

class UserProfilePhotoWidget extends StatelessWidget {
  const UserProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
            return const CircularProgressIndicator();
          case HomeStatus.loading:
            return const CircularProgressIndicator();
          case HomeStatus.error:
            return const CircularProgressIndicator();
          case HomeStatus.loaded:
            if (state.user!.avatar != null && state.user!.avatar!.isNotEmpty) {
              return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(state.user!.avatar!),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              );
            }
        }
      },
    );
  }
}
