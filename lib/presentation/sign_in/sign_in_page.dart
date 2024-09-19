import 'package:egasstation/global/constants/app_constants.dart';
import 'package:egasstation/global/extensions/context_extension.dart';
import 'package:egasstation/global/extensions/form_valicator_mixin.dart';
import 'package:egasstation/global/themes/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../gen/assets.gen.dart';
import '../../global/design_system/app_button_widget.dart';
import '../../global/design_system/app_text_form_field.dart';
import '../../global/themes/styles/app_colors.dart';
import 'bloc/Auth_cubit.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin, FormValidatorMixin {
  late final TextEditingController _userController;
  late final TextEditingController _passController;
  late final GlobalKey<FormState> _formKey;
  late final AuthBloc _bloc;

  late AnimationController _animationController;
  late Animation<Offset> _userFieldAnimation;
  late Animation<Offset> _passFieldAnimation;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    _userController = TextEditingController();
    _passController = TextEditingController();
    _formKey = GlobalKey();
    _bloc = context.read();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _userFieldAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.4, curve: Curves.fastOutSlowIn),
    ));

    // Animation cho Pass TextField
    _passFieldAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.6, curve: Curves.fastOutSlowIn),
    ));

    _buttonAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 0.8, curve: Curves.fastOutSlowIn),
    ));

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.current.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Assets.images.imgLogoPng.image(width: 200, height: 100),
              Container(
                padding: kPadding[0],
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position: _userFieldAnimation,
                        child: AppTextFormField(
                          controller: _userController,
                          labelText: 'Tài khoản',
                          textInputAction: TextInputAction.next,
                          maxLength: 30,
                          validator: validateUsername,
                        ),
                      ),
                      kSpacingHeight16,
                      SlideTransition(
                        position: _passFieldAnimation,
                        child: AppTextFormField(
                          controller: _passController,
                          labelText: 'Mật khẩu',
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          validator: validatePassword,
                        ),
                      ),
                      kSpacingHeight16,
                      SlideTransition(
                        position: _passFieldAnimation,
                        child: Row(
                          children: [
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: AppColors.current.grayColor,
                              ),
                              child: Checkbox(
                                value: _bloc.rememberMe,
                                checkColor: AppColors.current.whiteColor,
                                activeColor: AppColors.current.primaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    _bloc.setRememberMe(value!);
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Lưu đăng nhập',
                              style: AppTextStyle.bodySemiBold14(),
                            ),
                          ],
                        ),
                      ),
                      kSpacingHeight16,
                      SlideTransition(
                        position: _buttonAnimation,
                        child: AppButtonWidget(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              _bloc.setRememberMe(true);
                              await _bloc.rememberMe;
                              await context.runTask(
                                _bloc.loginGetUrl(
                                    username: _userController.text.replaceAll(' ', ''),
                                    password: _passController.text),
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.current.orangeColor,
                          title: 'ĐĂNG NHẬP',
                          titleColor: AppColors.current.whiteColorLock,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
