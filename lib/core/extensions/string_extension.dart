extension StringExtension on String {
  // Example: 'HelloWorld' -> 'Hello World' ('HelloWorld'.capitalizeFirstLetterOfEachWord())
  String get capitalizeFirstLetter =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get capitalizeFirstLetterOfEachWord =>
      split(' ').map((str) => str.capitalizeFirstLetter).join(' ');
}
