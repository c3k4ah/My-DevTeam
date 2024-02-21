part of 'auth_widget.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String mainText;
  const WelcomeTextWidget({
    super.key,
    required this.mainText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mainText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: 'AbrilFatface',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SelectableText.rich(
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFFA2A1AA),
            ),
            TextSpan(
              children: [
                const TextSpan(
                    text: 'Lorsque vous vous inscrivez, vous acceptez nos '),
                buildTextButton(
                  text: 'Conditions d\'utilisation ',
                  onPressed: () {},
                ),
                const TextSpan(text: 'et notre '),
                buildTextButton(
                  text: 'Politique de confidentialité',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  WidgetSpan buildTextButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
