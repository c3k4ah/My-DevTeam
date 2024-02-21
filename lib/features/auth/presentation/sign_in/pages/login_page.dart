import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

// ignore: unused_import
import '../../../../../../core/routes/app_router.dart';
import '../../common/widgets/auth_widget.dart';
import '../manager/sign_in_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    context.read<AuthBloc>().add(CheckIsAuthenticatedAuthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (authContext, authState) {
          return Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
            child: Container(
              // margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/images/logo_black.png',
                    width: 100,
                    height: 100,
                  ),
                  const WelcomeTextWidget(
                    mainText: 'My DevTeam',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Column(
                      children: [
                        AuthBouttonWidget(
                          enable: true,
                          key: const Key('loginButtonGoogle'),
                          controller: authContext
                              .read<AuthBloc>()
                              .loginGoogleButtonController,
                          text: 'Se connecter avec Google',
                          iconName: 'google',
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(LoginWithGoogleEvent());
                          },
                        ),
                        AuthBouttonWidget(
                          enable: true,
                          key: const Key('loginButtonFacebook'),
                          controller: authContext
                              .read<AuthBloc>()
                              .loginFacebookButtonController,
                          text: 'Se connecter avec Facebook',
                          iconName: 'facebook',
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(LoginWithFacebookEvent());
                          },
                        ),
                        AuthBouttonWidget(
                          enable: true,
                          controller: RoundedLoadingButtonController(),
                          key: const Key('loginButtonApple'),
                          text: 'Se connecter avec Apple',
                          iconName: 'apple',
                          onPressed: () {},
                        ),
                        // AuthBouttonWidget(
                        //   enable: true,
                        //   controller: RoundedLoadingButtonController(),
                        //   key: const Key('loginButtonPhone'),
                        //   text: 'Utilisez votre numéro de téléphone',
                        //   iconName: 'phone_call',
                        //   color: Colors.black,
                        //   textColor: Colors.white,
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  // const FooterRedierctWidget(
                  //   isLogin: false,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
