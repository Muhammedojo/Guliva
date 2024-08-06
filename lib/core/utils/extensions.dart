import 'packages.dart';

extension StringExtension on String {
  Text toText({
    bool translate = true,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 14,
    Color? color,
    TextAlign? textAlign,
    FontStyle? fontStyle,
    TextOverflow? textOverflow,
  }) {
    return Text(
      translate ? this : this,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          fontFamily: 'Switzer',
          fontStyle: fontStyle,
          color: color ?? Colors.black,
          overflow: textOverflow ?? TextOverflow.visible),
    );
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  SvgPicture toSvg({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return SvgPicture.asset(
      'assets/vectors/$this.svg',
      width: width,
      height: height,
      // ignore: deprecated_member_use
      color: color,
      fit: fit ?? BoxFit.contain,
    );
  }

  Image pngPicture({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      'assets/images/$this.png',
      width: width ?? 40,
      height: height ?? 40,
      fit: fit,
    );
  }
}
