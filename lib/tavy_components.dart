// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, prefer_const_constructors_in_immutables, must_be_immutable, use_key_in_widget_constructors, overridden_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sliding_sheet/sliding_sheet.dart';








const String defaultFontName = "Raleway";
const ColorScheme defaultColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.black,
  onPrimary: Colors.white,
  secondary: Colors.black,
  onSecondary: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
);







// BASIC FUNCTIONS AND EXTENSIONS


extension TavyString on String {

  String capitalize() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String short(int charCount) {
    if (length <= charCount || substring(0, charCount) == this) return this;
    return "${substring(0, charCount - 2)}...";
  }
}




String convertSeconds(int seconds, {bool fourDigits = true}) {
  String resultMinutes = ( seconds / 60 ).floor().toString();
  String resultSeconds = ( seconds % 60 ).toString();
  resultMinutes = fourDigits && resultMinutes.length < 2 ? "0$resultMinutes" : resultMinutes;
  resultSeconds = resultSeconds.length < 2 ? "0$resultSeconds" : resultSeconds;
  String result = "$resultMinutes:$resultSeconds";
  return result;
}




extension TavyCircularList on List {

  next(currentValue) {
    return indexOf(currentValue) >= length - 1 ? this[0] : this[indexOf(currentValue) + 1];
  }
}








// BASIC DEVICE PROPERTIES

double screenWidth(context) => MediaQuery.of(context).size.width;
double totalScreenHeight(context) => MediaQuery.of(context).size.height;
double screenHeight(context) => totalScreenHeight(context) - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;







// DEFAULT UI WIDGETS


// DIALOG
class TavyText extends StatelessWidget {

  TavyText(
    this.data,
  {
    this.max = 5000,
    this.fontName = "Open Sans",
    this.align = TextAlign.left,
    this.size = 16,
    this.weight = FontWeight.normal,
    required this.color,
  });

  String data;
  int? max;
  TextAlign? align;
  String? fontName;
  double? size;
  FontWeight? weight;
  Color? color;


  @override
  Widget build(BuildContext context) {
    return Text(
      ( data ).short(max ?? 5000),
      textAlign: align ?? TextAlign.left,
      style: GoogleFonts.getFont(
        fontName ?? "Open Sans",
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.normal,
        color: color!,
      ),
    );
  }
}




class H2 extends TavyText {
  H2(
    data,
    {
      int? max,
      TextAlign align = TextAlign.center,
      String fontName = defaultFontName,
      double size = 22,
      FontWeight weight = FontWeight.bold,
      required Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color,
  );
}


class H3 extends TavyText {
  H3(
    data,
    {
      int? max,
      TextAlign align = TextAlign.center,
      String fontName = defaultFontName,
      double size = 24,
      FontWeight weight = FontWeight.bold,
      required Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color,
  );
}


class H4 extends TavyText {
  H4(
    data,
    {
      int? max,
      TextAlign? align,
      String fontName = defaultFontName,
      double size = 18,
      FontWeight weight = FontWeight.bold,
      required Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color,
  );
}


class H5 extends TavyText {
  H5(
    data,
    {
      int? max,
      TextAlign? align,
      String fontName = defaultFontName,
      double size = 18,
      FontWeight weight = FontWeight.bold,
      Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color ?? Colors.grey.shade600,
  );
}


class H6 extends TavyText {
  H6(
    data,
    {
      int? max,
      TextAlign align = TextAlign.center,
      String fontName = defaultFontName,
      double? size,
      FontWeight? weight,
      required Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color,
  );
}




class S1 extends TavyText {
  S1(
    data,
    {
      int? max,
      TextAlign? align,
      String? fontName,
      double? size,
      FontWeight? weight,
      Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color ?? Colors.grey.shade600,
  );
}


class S2 extends TavyText {
  S2(
    data,
    {
      int? max,
      TextAlign? align,
      String? fontName,
      double? size = 14,
      FontWeight? weight,
      Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color ?? Colors.grey.shade600,
  );
}




class P1 extends TavyText {
  P1(
    data,
    {
      int? max,
      TextAlign align = TextAlign.justify,
      String? fontName,
      double size = 18,
      FontWeight? weight,
      required Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color,
  );
}


class P2 extends TavyText {
  P2(
    data,
    {
      int? max,
      TextAlign align = TextAlign.justify,
      String? fontName,
      double size = 16,
      FontWeight? weight,
      required Color? color,
    }
  ) : super(
    data,
    max: max,
    align: align,
    fontName: fontName,
    size: size,
    weight: weight,
    color: color,
  );
}








// DEFAULT UI WIDGETS


// Large button
class TavyLargeButton extends StatelessWidget {
  const TavyLargeButton({
    required this.colorScheme,
    this.iconData = Icons.check,
    this.iconSize = 64 + 10,
    this.color,
    this.hasBorder = false,
    this.onPressed,
    this.onLongPress,
  });

  final ColorScheme colorScheme;
  final IconData iconData;
  final double iconSize;
  final Color? color;
  final bool hasBorder;
  final Function()? onPressed;
  final Function()? onLongPress;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: hasBorder ? Border.all(color: colorScheme.onSurface) : null,
      ),
      child: TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Icon(
          iconData,
          size: iconSize,
          color: color ?? colorScheme.primary.withOpacity(0.1),
        ),
      ),
    );
  }
}




// Dialog

class TavyDialog extends StatefulWidget {

  const TavyDialog({
    required this.colorScheme,
    this.formKey,
    this.width = 300,
    this.height = 300,
    this.title = "",
    this.subtitle,
    this.children = const [],
    this.buttons,
  });

  final ColorScheme colorScheme;
  final GlobalKey<FormState>? formKey;
  final String title;
  final String? subtitle;
  final List<Widget> children;
  final List<Widget>? buttons;
  final double width;
  final double height;


  @override
  _TavyDialogState createState() => _TavyDialogState();
}



class _TavyDialogState extends State<TavyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: widget.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      title: Column(
        children: [
          H2(widget.title, color: widget.colorScheme.onSurface),
          widget.subtitle == null
          ? Container()
          : Container(
            height: 50,
            padding: EdgeInsets.only(top: 16, left: 4, right: 4),
            child: S2(widget.subtitle!.short(60)),
          ),
        ],
      ),
      content: Container(
        width: widget.width,
        height: widget.height,
        child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 280,
                height: widget.height - ( widget.subtitle == null ? 75 : 125 ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: widget.children,
                ),
              ),
              Container(
                height: widget.buttons == [] ? 0 : 50,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.buttons ?? [
                    TextButton(
                      child: Icon(Icons.close_rounded,),
                      onPressed: () => setState(() => Navigator.pop(context)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Text button with primary (filled), secondary (outlined) and tertiary (text-only) variations
class TavyTextButton extends StatefulWidget {
  const TavyTextButton({
    required this.colorScheme,
    this.isOutlined = true,
    this.isTertiary = false,
    this.text = "Submit",
    this.width = 192,
    this.height = 56,
    this.color,
    this.onPressed,
    this.onLongPress,
  });

  final ColorScheme colorScheme;
  final bool isOutlined;
  final bool isTertiary;
  final String text;
  final double width;
  final double height;
  final Color? color;
  final Function()? onPressed;
  final Function()? onLongPress;


  @override
  _TavyTextButtonState createState() => _TavyTextButtonState();
}



class _TavyTextButtonState extends State<TavyTextButton> {
  @override
  Widget build(BuildContext context) {

    return widget.isTertiary
    ? TextButton(
      onPressed: widget.onPressed ?? () {},
      onLongPress: widget.onLongPress,
      child: Text(
        widget.text,
        style: GoogleFonts.getFont(
          "Open Sans",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: widget.color ?? widget.colorScheme.onSurface,
          decoration: TextDecoration.underline,
          decorationThickness: 2,
        ),
      ),
    )
    : ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(widget.width, widget.height)),
        backgroundColor: MaterialStateProperty.all(
          widget.isOutlined
          ?  Colors.transparent
          : widget.color ?? ( widget.colorScheme.brightness == Brightness.dark && false ? widget.colorScheme.onSurface.withOpacity(0.5) : widget.colorScheme.primary ),
        ),
        shape: MaterialStateProperty.all(StadiumBorder(
          side: widget.isOutlined
          ? BorderSide(width: widget.colorScheme.brightness == Brightness.dark && false ? 0 : 1, color: widget.colorScheme.onSurface)
          : BorderSide.none,
        )),
        elevation: widget.isOutlined ? MaterialStateProperty.all(0) : null,
      ),
      onPressed: widget.onPressed ?? () {},
      onLongPress: widget.onLongPress,
      child: P2(
        widget.text,
        color: widget.isOutlined ? widget.colorScheme.onBackground : widget.colorScheme.onPrimary,
      ),
    );
  }
}




// Bottom sheet

void showTavySheet(
  context,
  {
    required ColorScheme colorScheme,

    bool snapping = false,
    Duration? duration,
    Curve? animationCurve = Curves.easeInOut,
    bool expand = false,
    Color barrierColor = Colors.black54,

    Color? color,
    double cornerRadius = 16,
    EdgeInsets? padding = const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 16),
    List<double> snappings = const [0.5, 1.0],
    double? initialSnap,
    void Function(SheetState, double?)? onSnap,
    double? minimumSnappableHeight,
    double? height,
    bool isTitleSmall = true,
    double? titlePadding,
    Color? titleColor,
    String? title,
    Widget? topLeftButton,
    Widget? topRightButton,
    bool hasCheckButton = false,
    Widget? child,
    Widget? customContent,
  }
) {
  snapping
  ? showSlidingBottomSheet(
    context,
    builder: (context) => SlidingSheetDialog(
      snapSpec: SnapSpec(
        snappings: snappings,
        initialSnap: initialSnap ?? snappings[0],
        onSnap: onSnap,
      ),
      backdropColor: barrierColor,
      color: color ?? colorScheme.surface,
      cornerRadius: cornerRadius,
      padding: EdgeInsets.zero,
      headerBuilder: (context, sheetState) => Container(
        height: 6,
        width: 1.5 * 64,
        margin: EdgeInsets.only(top: 9, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      builder: (context, sheetState) => customContent ?? TavySheetContent(
        colorScheme: colorScheme,
        minimumSnappableHeight: minimumSnappableHeight ?? snappings.first,
        padding: padding,
        isTitleSmall: isTitleSmall,
        titlePadding: titlePadding,
        titleColor: titleColor,
        title: title,
        topLeftButton: topLeftButton,
        topRightButton: topRightButton,
        hasCheckButton: hasCheckButton,
        child: child,
      ),
    ),
  )
  : showMaterialModalBottomSheet(
    context: context,
    duration: duration,
    animationCurve: animationCurve,
    expand: expand,
    barrierColor: barrierColor,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(
      child: Container(
        height: ( height ?? screenHeight(context) / 2 ),
        decoration: BoxDecoration(
          color: color ?? colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(cornerRadius)),
        ),
        child: Column(
          children: [
            Container(
              height: 6,
              width: 1.5 * 64,
              margin: EdgeInsets.only(top: 9 + ( height == screenHeight(context) ? MediaQuery.of(context).padding.top : 0 ), bottom: 5),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            customContent ?? TavySheetContent(
              colorScheme: colorScheme,
              minimumSnappableHeight: minimumSnappableHeight ?? snappings.first,
              padding: padding,
              isTitleSmall: isTitleSmall,
              titlePadding: titlePadding,
              titleColor: titleColor,
              title: title,
              topLeftButton: topLeftButton,
              topRightButton: topRightButton,
              hasCheckButton: hasCheckButton,
              child: child,
            ),
          ],
        ),
      ),
    ),
  );
}




// Optional custom bottom sheet content

class TavySheetContent extends StatefulWidget {
  TavySheetContent({
    required this.colorScheme,
    this.minimumSnappableHeight = 0.5,
    this.padding = const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 16),
    this.isTitleSmall = true,
    this.titlePadding,
    this.titleColor,
    this.title,
    this.topLeftButton,
    this.topRightButton,
    this.hasCheckButton = false,
    this.child,
  });

  ColorScheme colorScheme;
  double minimumSnappableHeight;
  EdgeInsets? padding;
  bool isTitleSmall;
  double? titlePadding;
  Color? titleColor;
  String? title;
  Widget? topLeftButton;
  Widget? topRightButton;
  bool hasCheckButton;
  Widget? child;


  @override
  State<TavySheetContent> createState() => _TavySheetContentState();
}

class _TavySheetContentState extends State<TavySheetContent> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.colorScheme.surface,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight(context) * widget.minimumSnappableHeight - 25,
        ),
        child: Stack(
          children: [
            Container(
              padding: widget.padding,
              child: Column(
                children: [
                  Container(
                    margin: widget.title == null ? null : ( EdgeInsets.only(bottom: widget.titlePadding ?? ( widget.isTitleSmall ? 16 : 32 ))),
                    child: widget.title == null ? null : (
                      widget.isTitleSmall
                      ? H5(
                        widget.title!,
                        color: widget.titleColor,
                      )
                      : H2(
                        widget.title!,
                        max: defaultFontName == "IBM Plex Mono" ? 15 : 30,
                        align: TextAlign.center,
                        color: widget.titleColor ?? widget.colorScheme.onSurface,
                      )
                    ),
                  ),
                  widget.child ?? Container(),
                ],
              ),
            ),
            widget.hasCheckButton
            ? Positioned(
              child: Container(
                margin: EdgeInsets.only(top: 32),
                child: TavyLargeButton(
                  colorScheme: widget.colorScheme,
                  iconData: Icons.check,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ) : Container(),
            Positioned(
              //top: 0,
              left: 16,
              width: 64,
              child: widget.topLeftButton ?? Container(),
            ),
            Positioned(
              top: 0,
              right: 16,
              width: 64,
              child: widget.topRightButton ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}




// Snack bar

void showTavyInfoSnackBar(
  context,
  String text,
  {
    ColorScheme colorScheme = defaultColorScheme,
    Color? color,
    double fontSize = 16,
    Color? fontColor,
    Widget? action,
    Duration duration = const Duration(seconds: 3),
  }) {


  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      backgroundColor: colorScheme.secondary,
      dismissDirection: DismissDirection.horizontal,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          P2(
            text.short(35),
            size: fontSize,
            color: fontColor ?? colorScheme.background,
          ),
          action ?? IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: color == null ? Colors.grey : Colors.white70,
            ),
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ],
      ),
      //action: SnackBarAction(label: ),
      duration: duration,
    ),
  );
}




// Widget stating who developed all this

class DesignedBy extends StatelessWidget {

  const DesignedBy(
  {
    this.colorScheme = defaultColorScheme,
    this.created = false,
  });

  final ColorScheme colorScheme;
  final bool created;


  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        created ? "Created by" : "Designed by",
        textAlign: TextAlign.center,
        style: GoogleFonts.getFont(
          "Open Sans",
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: colorScheme.primary.withOpacity(0.1),
        ),
      ),
      Text(
        "Taavi Rübenhagen",
        textAlign: TextAlign.center,
        style: GoogleFonts.getFont(
          "Open Sans",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: colorScheme.primary.withOpacity(0.1),
        ),
      ),
    ],
  );
}