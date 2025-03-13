import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledTextFormField extends StatefulWidget {
  const StyledTextFormField(
      {super.key,
      required this.placeholder,
      required this.textEditingController,
      this.type = "text", // "text" (default) | "email" | "password" | "number"
      this.focused = false,
      this.compare,
      this.onSubmitted,
      this.externalTextEditingController,
      this.validator});

  // required initial state
  final String placeholder;
  final String type;
  final bool focused;
  final String? compare;
  final void Function(String)? onSubmitted;
  final TextEditingController? externalTextEditingController;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  @override
  State<StyledTextFormField> createState() => _StyledTextFormFieldState();
}

class _StyledTextFormFieldState extends State<StyledTextFormField> {
  bool _enabledClearOptions = false;
  bool _matched = false;
  bool _obscureText = false;
  bool _hasValidateError = false;
  String? validationMessage;

  @override
  void initState() {
    super.initState();
    _enabledClearOptions = widget.type.toLowerCase() == "password";
    _obscureText = widget.type.toLowerCase() == "password";
    if (widget.externalTextEditingController != null) {
      widget.externalTextEditingController!.addListener(handleOnChange);
    }
  }

  TextInputType _getKeyboardType() {
    switch (widget.type.toLowerCase()) {
      case "email":
        return TextInputType.emailAddress;
      case "number":
        return TextInputType.number;
      case "text":
      case "password":
      default:
        return TextInputType.text;
    }
  }

  handleOnChange() {
    if (widget.textEditingController.text.isNotEmpty) {
      setState(() {
        _matched = false;
        _enabledClearOptions = true;
        if (widget.textEditingController.text != null) {
          _matched = widget.textEditingController.text ==
              widget.externalTextEditingController!.text;
        }
        _hasValidateError = widget.validator != null &&
                widget.validator!(widget.textEditingController.text) != null ||
            validationMessage != null;
      });
    } else {
      setState(() {
        if (widget.type != "password") {
          _enabledClearOptions = false;
        }
        if (validationMessage == null) _hasValidateError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          bool isFocused = Focus.of(context).hasFocus;

          return IntrinsicHeight(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -4,
                  left: -4,
                  right: -4,
                  bottom: -4,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      // color: Colors.transparent
                      color: (isFocused && !_hasValidateError)
                          ? const Color(0xFF51A2FD).withOpacity(0.2)
                          : Colors.transparent,
                    ),
                  ),
                ),
                TextFormField(
                    keyboardType: _getKeyboardType(),
                    keyboardAppearance: Brightness.dark,
                    autocorrect: false,
                    enableSuggestions: true,
                    autofocus: widget.focused,
                    validator: (value) {
                      validationMessage = widget.validator?.call(value);
                      setState(() {
                        _hasValidateError = validationMessage != null;
                      });
                      return validationMessage;
                    },
                    cursorWidth: 3,
                    cursorColor: Colors.white,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        hintText: widget.placeholder,
                        hintStyle: const TextStyle(
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: const BorderSide(
                            color: Colors.white38,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(
                            color: const Color(0xFF3B73E0).withOpacity(0.9),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 14.0,
                        ),
                        filled: true,
                        fillColor: Colors.black,
                        suffixIcon: AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: _enabledClearOptions ? 1.0 : 0.0,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              widget.type.toLowerCase() != "password"
                                  ? Container(
                                      color: Colors.transparent,
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          widget.textEditingController.clear();
                                          setState(() {
                                            _enabledClearOptions = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 3, bottom: 1),
                                          child: Icon(
                                            CupertinoIcons.clear_circled_solid,
                                            size: 19,
                                            color:
                                                Colors.white.withOpacity(0.3),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        if (widget.type.toLowerCase() ==
                                            "password") {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        } else {
                                          widget.textEditingController.clear();
                                          setState(() {
                                            _enabledClearOptions = false;
                                          });
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 3, bottom: 1),
                                        child: Icon(
                                          _obscureText
                                              ? CupertinoIcons.eye_slash_fill
                                              : CupertinoIcons.eye_fill,
                                          size: 20,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                switchInCurve: Curves.ease,
                                transitionBuilder: (
                                  Widget child,
                                  Animation<double> animation,
                                ) {
                                  return SizeTransition(
                                    sizeFactor: animation,
                                    axis: Axis.horizontal,
                                    axisAlignment:
                                        -1.0, // Align animation direction
                                    child: child,
                                  );
                                },
                                child: _matched
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14, right: 15),
                                        child: Icon(
                                          CupertinoIcons.checkmark,
                                          size: 19,
                                          color: Colors.green.withOpacity(0.8),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        )),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (String value) {
                      handleOnChange();
                    },
                    controller: widget.textEditingController),
              ],
            ),
          );
        },
      ),
    );
  }
}
