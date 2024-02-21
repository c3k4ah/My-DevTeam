part of 'auth_widget.dart';

class HorizontalLogo extends StatelessWidget {
  const HorizontalLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_black.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'My DevTeam',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
