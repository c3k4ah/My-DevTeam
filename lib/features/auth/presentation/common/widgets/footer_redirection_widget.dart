part of 'auth_widget.dart';

class FooterRedierctWidget extends StatelessWidget {
  final bool isLogin;
  const FooterRedierctWidget({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).extension<AppColors>()!;
    return Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLogin
                  ? 'Vous n\'avez aucun de compte ? '
                  : 'Vous avez déjà un compte ? ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {
                // if (isLogin) {
                //   context.pushRoute(const LoginRoute());
                // } else {
                //   context.pushRoute(const SignUpRoute());
                // }
                // context.popRoute();
              },
              child: Text(
                isLogin ? 'S\'inscrire' : 'Se connecter',
                style: TextStyle(
                  color: themeColor.secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ));
  }
}
