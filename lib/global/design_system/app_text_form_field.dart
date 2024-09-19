// import 'package:flutter/material.dart';
import 'package:egasstation/global/themes/styles/app_colors.dart';
//
// class AppTextFormField extends FormField<String> {
//   final TextEditingController? controller;
//   final bool obscureText;
//
//   AppTextFormField({
//     super.key,
//     bool usePhone = false,
//     double elevation = 5,
//     String? value,
//     FocusNode? focusNode,
//     Color? fillColor,
//     Color? labelColor,
//     super.initialValue,
//     String? title,
//     String? labelText,
//     Widget? action,
//     String? hint,
//     super.onSaved,
//     super.validator,
//     bool autoValidate = false,
//     bool enabled = true,
//     bool selected = false,
//     bool readOnly = false,
//     bool enableInteractiveSelection = true,
//     Widget? suffixIcon,
//     Widget? icon,
//     Widget? prefixIcon,
//     bool filled = false,
//     AutovalidateMode? autovalidateMode,
//     this.obscureText = true,
//     this.controller,
//     bool isPassword = false,
//     TextInputType? inputType,
//     List<TextInputFormatter>? inputFormatters,
//     int? maxLength,
//     int? maxLine,
//     onTap,
//     bool myAutoValidate = false,
//     bool alwaysValidate = false,
//     ValueChanged<String>? onChanged,
//     int? minLines,
//     bool? autoFocus,
//     TextStyle? hintStyle,
//     TextInputAction? textInputAction,
//     bool compulsory = false,
//   }) : super(
//             autovalidateMode: alwaysValidate
//                 ? AutovalidateMode.always
//                 : myAutoValidate
//                     ? AutovalidateMode.onUserInteraction
//                     : AutovalidateMode.disabled,
//             builder: (FormFieldState field) {
//               AppTextFormFieldState state = field as AppTextFormFieldState;
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (title != null) ...[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Text(
//                                 title,
//                                 style: AppTextStyle.bodyBold12(),
//                               ),
//                               if (compulsory)
//                                 const SizedBox(
//                                   width: 2,
//                                 ),
//                               if (compulsory)
//                                 Text(
//                                   '*',
//                                   style: AppTextStyle.bodyBold12().copyWith(color: Colors.red),
//                                 ),
//                             ],
//                           ),
//                         ),
//                         if (action != null) action
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 6,
//                     )
//                   ],
//                   Material(
//                       borderRadius: BorderRadius.circular(12),
//                       elevation: elevation,
//                       child: Column(
//                         children: [
//                           TextField(
//                             key: key,
//                             enableInteractiveSelection: enableInteractiveSelection,
//                             focusNode: focusNode,
//                             readOnly: readOnly,
//                             minLines: minLines ?? 1,
//                             maxLines: maxLine ?? 1,
//                             autofocus: autoFocus ?? false,
//                             cursorColor: Colors.black,
//                             controller: state.textEditingController,
//                             obscureText: isPassword ? state._obscureText : false,
//                             style: Theme.of(state.context).textTheme.titleMedium!.copyWith(
//                                   color: readOnly ? const Color(0xff7A7A9D) : Colors.black,
//                                 ),
//                             textInputAction: textInputAction,
//                             keyboardType: inputType,
//                             inputFormatters: [
//                               ...inputFormatters ?? [],
//                               LengthLimitingTextInputFormatter(maxLength),
//                             ],
//                             onChanged: (text) {
//                               state.didChange(text);
//                               if (onChanged != null) {
//                                 onChanged(text);
//                               }
//                             },
//                             decoration: InputDecoration(
//                               hintText: hint,
//                               hintStyle: hintStyle,
//                               labelText: labelText,
//                               labelStyle: Theme.of(state.context)
//                                   .textTheme
//                                   .bodyMedium
//                                   ?.copyWith(color: Colors.black),
//                               prefixIcon: prefixIcon,
//                               contentPadding:
//                                   const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(color: Color(0xff89898b), width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(color: Color(0xff585656), width: 1),
//                               ),
//                               errorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(color: Colors.red, width: 1.5),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: const BorderSide(color: Colors.red, width: 2),
//                               ),
//                               suffixIcon: isPassword
//                                   ? Padding(
//                                       padding: const EdgeInsets.all(2.5),
//                                       child: Material(
//                                         color: fillColor ?? const Color(0xffededed),
//                                         child: InkResponse(
//                                           radius: 21,
//                                           child: state._obscureText
//                                               ? Icon(Icons.visibility_off, color: Colors.black)
//                                               : Icon(Icons.visibility, color: Colors.black),
//                                           onTap: () {
//                                             state.onChangeObscureText();
//                                           },
//                                         ),
//                                       ),
//                                     )
//                                   : suffixIcon,
//                               enabled: enabled,
//                               counterStyle: const TextStyle(height: 0, fontSize: 0),
//                             ),
//                           ),
//                         ],
//                       )),
//                   if (state.errorText != null) ...[
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       ' ${state.errorText!}',
//                       style: AppTextStyle.bodyMedium12().copyWith(color: Colors.red),
//                     ),
//                   ]
//                 ],
//               );
//             });
//
//   @override
//   AppTextFormFieldState createState() => AppTextFormFieldState();
// }
//
// class AppTextFormFieldState extends FormFieldState<String> {
//   late TextEditingController textEditingController;
//   late bool _obscureText;
//
//   void onChangeObscureText() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   @override
//   AppTextFormField get widget => super.widget as AppTextFormField;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.obscureText;
//     textEditingController = widget.controller ?? TextEditingController()
//       ..text = widget.initialValue ?? '';
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';
import '../themes/styles/app_text_styles.dart';

class AppTextFormField extends FormField<String> {
  final TextEditingController? controller;
  final bool obscureText;
  AppTextFormField({
    bool usePhone = false,
    double elevation = 5,
    String? value,
    FocusNode? focusNode,
    Key? key,
    Color? fillColor,
    String? initialValue,
    String? title,
    String? labelText,
    Widget? action,
    String? hint,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool selected = false,
    bool readOnly = false,
    bool enableInteractiveSelection = true,
    Widget? suffixIcon,
    Widget? icon,
    Widget? prefixIcon,
    bool filled = false,
    AutovalidateMode? autovalidateMode,
    this.obscureText = true,
    this.controller,
    bool isPassword = false,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    int? maxLine,
    onTap,
    bool myAutoValidate = false,
    bool alwaysValidate = false,
    ValueChanged<String>? onChanged,
    int? minLines,
    bool? autoFocus,
    TextStyle? hintStyle,
    TextInputAction? textInputAction,
  }) : super(
            key: key,
            validator: validator,
            onSaved: onSaved,
            initialValue: initialValue,
            autovalidateMode: alwaysValidate
                ? AutovalidateMode.always
                : myAutoValidate
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
            builder: (FormFieldState field) {
              AppTextFormFieldState state = field as AppTextFormFieldState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: AppTextStyle.bodyBold14(),
                          ),
                        ),
                        if (action != null) action
                      ],
                    ),
                    kSpacingHeight6,
                  ],
                  Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: elevation,
                    child: TextField(
                      key: key,
                      enableInteractiveSelection: enableInteractiveSelection,
                      focusNode: focusNode,
                      readOnly: readOnly,
                      minLines: minLines ?? 1,
                      maxLines: maxLine ?? 1,
                      autofocus: autoFocus ?? false,
                      cursorColor: Colors.black,
                      controller: state.textEditingController,
                      obscureText: isPassword ? state._obscureText : false,
                      style: Theme.of(state.context).textTheme.titleMedium!.copyWith(
                            color:
                                readOnly ? const Color(0xff7A7A9D) : AppColors.current.blackColor,
                          ),
                      textInputAction: textInputAction,
                      keyboardType: inputType,
                      inputFormatters: [
                        ...inputFormatters ?? [],
                        LengthLimitingTextInputFormatter(maxLength),
                      ],
                      onChanged: (text) {
                        state.didChange(text);
                        if (onChanged != null) {
                          onChanged(text);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: hintStyle,
                        labelText: labelText, // Sẽ hiển thị khi trường có giá trị hoặc focus
                        labelStyle: Theme.of(state.context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.current.blackColor),
                        prefixIcon: prefixIcon,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff89898b), width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff585656), width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red, width: 1.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red, width: 2),
                        ),
                        suffixIcon: isPassword
                            ? Padding(
                                padding: const EdgeInsets.all(2.5),
                                child: Material(
                                  color: fillColor ?? AppColors.current.bgCardColor,
                                  child: InkResponse(
                                    radius: 21,
                                    child: state._obscureText
                                        ? Icon(Icons.visibility_off,
                                            color: AppColors.current.blackColor)
                                        : Icon(Icons.visibility,
                                            color: AppColors.current.blackColor),
                                    onTap: () {
                                      state.onChangeObscureText();
                                    },
                                  ),
                                ),
                              )
                            : suffixIcon,
                        enabled: enabled,
                        counterStyle: const TextStyle(height: 0, fontSize: 0),
                      ),
                    ),
                  ),
                  if (state.errorText != null) ...[
                    kSpacingHeight8,
                    Text(
                      ' ${state.errorText!}',
                      style: AppTextStyle.bodyMedium12(),
                    ),
                  ]
                ],
              );
            });
  @override
  AppTextFormFieldState createState() => AppTextFormFieldState();
}

class AppTextFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  late bool _obscureText;

  void onChangeObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  AppTextFormField get widget => super.widget as AppTextFormField;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    textEditingController = widget.controller ?? TextEditingController()
      ..text = widget.initialValue ?? '';
  }
}
