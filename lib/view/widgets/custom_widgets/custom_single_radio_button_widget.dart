import 'package:ecommerce_app/utils/global/global_variable.dart';
import 'package:ecommerce_app/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/theme/app_colors/basic_color.dart';
import '../../../utils/global/size_box.dart';

class CustomSingleRadioButtonWidget extends StatefulWidget {
  final String buttonLabel;
  final String? selectedString;
  final bool isNeedSelectedString;
  final Function(String) onPressed;
  final Color bgColor;
  final double buttonHeight;

  const CustomSingleRadioButtonWidget({
    required this.buttonLabel,
    required this.onPressed,
    this.selectedString,
    this.isNeedSelectedString = true,
    this.bgColor = whiteOnly,
    this.buttonHeight = 45,
    super.key,
  });

  @override
  State<CustomSingleRadioButtonWidget> createState() => _CustomSingleRadioButtonWidgetState();
}

class _CustomSingleRadioButtonWidgetState extends State<CustomSingleRadioButtonWidget> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    if(widget.isNeedSelectedString && (widget.selectedString != null && widget.selectedString != "")){
      _selectedValue = widget.selectedString!;
    }
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedValue = widget.buttonLabel;
        });
        widget.onPressed(_selectedValue!);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(80, 20),
        //fixedSize: Size(80, widget.buttonHeight.h),
        fixedSize: Size.fromHeight(widget.buttonHeight.h),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            //width: 0.5,
            width: 0.5,
            color: _selectedValue == widget.buttonLabel ? appPrimaryColor : boarderColorVariable,
          ),
        ),
        side: BorderSide(
          //width: 0.8,
          width: _selectedValue == widget.buttonLabel ? 1.4 : 0.8,
          color: _selectedValue == widget.buttonLabel ? appPrimaryColor : boarderColorVariable,
        ),
        backgroundColor: widget.bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 24.0,
              width: 24.0,
              decoration: BoxDecoration(
                color: _selectedValue == widget.buttonLabel ? appPrimaryColor : null,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedValue == widget.buttonLabel ? appPrimaryColor : Colors.grey,
                  width: 1.0,
                ),
              ),
              child: AnimatedSwitcher(
                key: ValueKey<String>("${widget.buttonLabel}${DateTime.now().millisecondsSinceEpoch}"),
                duration: const Duration(milliseconds: 300),
                child: _selectedValue == widget.buttonLabel
                    ? Icon(Icons.check, color: _selectedValue == widget.buttonLabel ? whiteOnly: null, size: 18.0)
                    : Container(
                    key: ValueKey<String>(
                        'unselected_${widget.buttonLabel}')),
              ),
            ),
            szW8(), // Use your custom spacing widget
            Expanded(child: Text(widget.buttonLabel,  maxLines: 1, overflow: TextOverflow.ellipsis, style: myTxt14(),)),
          ],
        ),
      ),
    );
  }

}
