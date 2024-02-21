part of 'auth_widget.dart';

class AuthBouttonWidget extends StatelessWidget {
  final String text;
  final String iconName;
  final VoidCallback onPressed;
  final bool enable;
  final Color? color;
  final Color? textColor;
  final RoundedLoadingButtonController? controller;

  const AuthBouttonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.iconName,
    required this.enable,
    this.color,
    this.textColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RoundedLoadingButton(
        height: 60,
        width: MediaQuery.of(context).size.width,
        elevation: 0,
        color: color ?? const Color(0xFFF5F5F5),
        borderRadius: 15,
        onPressed: enable
            ? () {
                onPressed();
                Future.delayed(const Duration(seconds: 3), () {
                  controller?.reset();
                });
              }
            : () {
                controller?.reset();
              },
        controller: controller ?? RoundedLoadingButtonController(),
        valueColor: Theme.of(context).primaryColor,
        successColor: Colors.blue,
        errorColor: Colors.redAccent,
        loaderStrokeWidth: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/$iconName.svg',
              height: 28,
              width: 28,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
