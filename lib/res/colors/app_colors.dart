part of 'base_colors.dart';

class AppColors implements BaseColors {
  final Map<int, Color> _primary = const {
    50: Color.fromRGBO(22, 134, 206, 0.1),
    100: Color.fromRGBO(22, 134, 206, 0.2),
    200: Color.fromRGBO(22, 134, 206, 0.3),
    300: Color.fromRGBO(22, 134, 206, 0.4),
    400: Color.fromRGBO(22, 134, 206, 0.5),
    500: Color.fromRGBO(22, 134, 206, 0.6),
    600: Color.fromRGBO(22, 134, 206, 0.7),
    700: Color.fromRGBO(22, 134, 206, 0.8),
    800: Color.fromRGBO(22, 134, 206, 0.9),
    900: Color.fromRGBO(22, 134, 206, 1.0),
  };

  @override
  MaterialColor get accent => Colors.amber;

  @override
  MaterialColor get primary => MaterialColor(0xff1686ce, _primary);

  @override
  Color get primaryText => const Color(0xff49ABFF);

  @override
  Color get secondaryText => const Color(0xff3593FF);

  @override
  Color get white => const Color(0xffffffff);

  @override
  Color get black => const Color(0xff000000);

  @override
  Color get green => const Color(0xFF00BF6D);
}
