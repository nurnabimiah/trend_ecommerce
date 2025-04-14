import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../utils/theme/app_colors/basic_color.dart';
import 'custom_container_widget_for_opt_screen.dart';

class CustomOtpTextFormFieldWidget extends StatefulWidget {
  final int textFormLength;
  final Function(String) returnOtpValue;

  const CustomOtpTextFormFieldWidget({
    required this.textFormLength,
    required this.returnOtpValue,
    super.key
  });

  @override
  State<CustomOtpTextFormFieldWidget> createState() => _CustomOtpTextFormFieldWidgetState();
}

class _CustomOtpTextFormFieldWidgetState extends State<CustomOtpTextFormFieldWidget> {
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();

    // Initialize TextEditingControllers and FocusNodes
    for (int i = 0; i < widget.textFormLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _updateOtpValue() {
    String otp = _controllers.map((controller) => controller.text).join();
    widget.returnOtpValue(otp);
    setState(() {

    });
  }


  void handlePaste(String text) {
    // Ensure the pasted text length does not exceed the OTP length
    if (text.length > widget.textFormLength) text = text.substring(0, widget.textFormLength);

    // Distribute the pasted characters to each TextField
    for (int i = 0; i < text.length; i++) {
      _controllers[i].text = text[i];
    }

    // Clear any remaining fields if the pasted text is shorter than the OTP length
    for (int i = text.length; i < widget.textFormLength; i++) {
      _controllers[i].clear();
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.textFormLength, (index) {
        return CustomContainerWidgetForOptScreen(
          color: _controllers[index].text.isNotEmpty ? grey300 : whiteOnly,
          child: Center(
            child: TextFormField(
              contextMenuBuilder:
                    (BuildContext context, EditableTextState editableTextState) {
                  return AdaptiveTextSelectionToolbar.editable(
                    onSelectAll: () => editableTextState.selectAll(SelectionChangedCause.toolbar),
                    onLookUp: () {}, // Required, but you can provide empty function
                    onSearchWeb: () {}, // Required, but you can provide empty function
                    onShare: () {}, // Required, but you can provide empty function
                    onLiveTextInput: () {},
                    anchors: editableTextState.contextMenuAnchors,
                    clipboardStatus: ClipboardStatus.notPasteable,
                    // to apply the normal behavior when click on copy (copy in clipboard close toolbar)
                    // use an empty function `() {}` to hide this option from the toolbar
                    onCopy: () => editableTextState
                        .copySelection(SelectionChangedCause.toolbar),
                    // to apply the normal behavior when click on cut
                    onCut: () => editableTextState
                        .cutSelection(SelectionChangedCause.toolbar),
                    onPaste: () async{
                      // HERE will be called when the paste button is clicked in the toolbar
                      // apply your own logic here

                      // to apply the normal behavior when click on paste (add in input and close toolbar)
                      //editableTextState.pasteText(SelectionChangedCause.tap);
                      ClipboardData? data = await Clipboard.getData('text/plain');
                      if (data != null && data.text != null && data.text!.length > 1) {
                        handlePaste(data.text!); // Handle paste
                      }
                    //  editableTextStateGlobal = editableTextState;
                      setState(() {

                      });
                      editableTextState.hideToolbar();
                    },

                  );
                },
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < widget.textFormLength - 1) {
                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                  } else {
                    _focusNodes[index].unfocus();
                  }
                } else {
                  if (index > 0) {
                    FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                  }
                }
                _updateOtpValue();
              },
              style: const TextStyle(
                height: 1,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0)
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onTapOutside: (PointerDownEvent b){
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        );
      }),
    );
  }
}


