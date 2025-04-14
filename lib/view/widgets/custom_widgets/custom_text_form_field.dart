import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/global/global_variable.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool isCurrentPasswordField;
  final bool isPasswordField;
  final bool isConfirmPasswordField;
  final String? hintText;
  final IconData? icon;
  final bool isPassword;
  final Color? hintColor;
  final double? hintTextSize;
  final Color? textColor;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function? onChanged;
  final Function? validation;
  final Function? onSubmit;
  final Function? onFieldSubmit;
  final Function? suffixIconOnTap;
  final TextEditingController? controller;
  final bool? isReadOnly;
  final EdgeInsets? padding;
  final double? height;
  final double? fontSize;
  final String? errorText;
  final double? outLineBoarder;
  final Color? fillColor;
  final bool? isContentPadding;
  final double contentPaddingVertical;
  final double contentPaddingHorizontal;
  final double? iconPadding;
  final String? prefixIconString;
  final String? suffixIconString;
  final bool? isFilled;
  final FontWeight? fontWeight;
  final Color? iconColor;
  final bool? isErrorValidation;
  final String? labelText;
  final bool? isOutlineBoarder;
  final bool? isDigitOnly;
  final int? maxLength;
  final int ? maxLine;
  final FocusNode? focusNode;
  final bool? isAutovalidateMode;
  final Color enabledBoarderColor;
  final Color errorBoarderColor;
  final Color focusBoarderColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool onlyShowingBoarderError;
  final bool enabled;
  final bool isPhoneNumber;
  final bool isLabelShowAlways;
  final List<TextInputFormatter>? inputFormatters;
  final double boarderRadius;
  final double suffixIconSize;
  final Color? labelTextColor;
  final Color floatingLabelColor;
  final Color? textStyleColor;
  final Color? errorTextColor;

  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.icon,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.controller,
    this.hintColor,
    this.textColor = Colors.black,
    this.onChanged,
    this.onSubmit,
    this.isReadOnly = false,
    this.padding,
    this.height = 0,
    this.fontSize = 14,
    this.errorText = "please insert valid input 10",
    this.isOutlineBoarder = true,
    this.validation,
    this.fillColor,
    this.outLineBoarder,
    this.iconPadding,
    this.prefixIconString,
    this.suffixIconString,
    this.isFilled = true,
    this.fontWeight = FontWeight.w400,
    this.hintTextSize = 16,
    this.iconColor = Colors.grey,
    this.isErrorValidation = true,
    this.labelText,
    this.isDigitOnly = false,
    this.maxLength = 10000000,
    this.maxLine = 1,
    this.contentPaddingHorizontal = 15,
    this.contentPaddingVertical = 12.2,
    this.isContentPadding = false,
    this.focusNode,
    this.isAutovalidateMode = false,
    this.isCurrentPasswordField = false,
    this.isPasswordField = false,
    this.isConfirmPasswordField = false,
    this.onFieldSubmit,
    this.enabledBoarderColor = Colors.blue,
    this.focusBoarderColor = Colors.blue,
    this.onlyShowingBoarderError = false,
    this.enabled = true,
    this.isPhoneNumber = false,
    this.isLabelShowAlways = false,
    this.inputFormatters,
    this.boarderRadius = 8,
    this.suffixIconOnTap,
    this.suffixIconSize = 22,
    this.errorBoarderColor = Colors.red,
    this.prefixIconColor,
    this.suffixIconColor,
    this.labelTextColor,
    this.floatingLabelColor = Colors.deepOrange,
    this.textStyleColor,
    this.textInputAction,
    this.errorTextColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;
  Color? hintColor;
  late IconData? suffixIcon;
  late InputDecorationTheme inputDecorationTheme;
  late TextStyle textStyle;

  initialize(){
    setState(() {
      hintColor = widget.hintColor == null ? Theme.of(context).hintColor : widget.hintColor!;
    });
  }

  @override
  void initState() {
    suffixIcon = widget.suffixIcon;
    obscureText = widget.isPassword;
    WidgetsBinding.instance.addPostFrameCallback((_){
      initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        readOnly: widget.isReadOnly!,
        focusNode: widget.focusNode,
        maxLines: widget.maxLine ?? 1,
        enabled: widget.enabled,
        onTap: widget.onSubmit != null ? () => widget.onSubmit!() : null,
        autovalidateMode: widget.isAutovalidateMode! ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
        validator: widget.validation != null && !widget.onlyShowingBoarderError ? (String? txt) => widget.validation!(txt) : null,
        controller: widget.controller,
        obscureText: obscureText,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        onChanged: widget.onChanged != null ? (String txt) => widget.onChanged!(txt) : null,
        onFieldSubmitted: widget.onFieldSubmit != null ? (String txt) => widget.onFieldSubmit!(txt) : null,
        style: TextStyle(
          color: widget.textStyleColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
            errorStyle: TextStyle(
            color: widget.errorTextColor,
            ),
            prefixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
            suffixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
            counterText: "",
            isDense: false,
            //for content padding workable it needs true
            isCollapsed: true,
            //isCollapsed: isContentPadding! ? true : false,
            border: widget.isOutlineBoarder! ?  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
              // borderSide:BorderSide(
              //   width: boarderWidthVariable, color: focusBoarderColor),
            ) : InputBorder.none,
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
              borderSide:  BorderSide(
                  width: boarderWidthVariable, color: widget.focusBoarderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
              borderSide: BorderSide(
                  width:  boarderWidthVariable, color: widget.enabledBoarderColor),
            ),
            errorBorder: !widget.onlyShowingBoarderError ? null : OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
              borderSide:  BorderSide(
                width:  boarderWidthVariable,
                color: widget.errorBoarderColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.boarderRadius)),
              borderSide:  BorderSide(
                width:  boarderWidthVariable,
                color: widget.errorBoarderColor,
              ),
            ),
            labelText: widget.labelText,
            floatingLabelStyle: WidgetStateTextStyle.resolveWith(
                  (Set<WidgetState> states) {
                final Color color = states.contains(WidgetState.error)
                    ? Theme.of(context).colorScheme.error
                    : widget.floatingLabelColor;
                return TextStyle(color: color, letterSpacing: 1.3, fontSize: 14);
              },
            ),
            floatingLabelBehavior: widget.isLabelShowAlways ? FloatingLabelBehavior.always  : null,
            labelStyle: TextStyle(fontSize: 14, color: widget.labelTextColor),
            contentPadding: EdgeInsets.symmetric(horizontal: widget.contentPaddingHorizontal, vertical: widget.contentPaddingVertical/*(contentPaddingVertical+extraVerticalPadding).h*/),
            suffixIcon: widget.suffixIcon == null
                ? null
                : SizedBox(
              child: InkWell(
                onTap: (){
                  if (widget.isPassword){
                    obscureText = !obscureText;
                    suffixIcon = obscureText ? const Icon(Icons.visibility_off).icon :  const Icon(Icons.visibility).icon;
                  }else{
                    if(widget.suffixIconOnTap != null){
                      widget.suffixIconOnTap!();
                    }
                  }
                  setState(() {
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Icon(suffixIcon, color: widget.suffixIconColor, size: widget.suffixIconSize.r, ),
                ),
              ),
            ),
            prefixIcon: widget.isPhoneNumber ? Container(
              margin: const EdgeInsets.only(top: 0),
              width: 40.w,
              child:  const Center(child: Text("+88", style: TextStyle(fontSize: 14),),),
            )
                : widget.prefixIcon == null
                ? null
                : SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Icon(widget.prefixIcon, color: widget.prefixIconColor, size: 22.r, ),
              ),
            ),
            hintText: widget.hintText,
            hintStyle:  TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: hintColor),
            filled: widget.isFilled,
            fillColor: widget.fillColor,
            //outlineboarder and error text may not stay together
            errorText: widget.isErrorValidation! ? null : widget.errorText
        ),
      ),
    );
  }
}