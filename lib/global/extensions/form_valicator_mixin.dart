mixin FormValidatorMixin {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bạn chưa nhập email';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Định dạng email không hợp lệ';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bạn chưa nhập số điện thoại';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa nhập tên khách hàng';
    } else {
      return null;
    }
  }

  String? validateUserName(String? value) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa nhập tài khoản';
    } else {
      return null;
    }
  }

  String? validateCurrentPassword(String? value) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa nhập mật khẩu hiện tại';
    }
    return null;
  }

  String? validateNewPassword(String? value, bool isDuplicateCurrentPass) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa nhập mật khẩu mới';
    } else if (value!.length < 6) {
      return 'Mật khẩu mới phải có ít nhất 6 ký tự';
    } else if (isDuplicateCurrentPass) {
      return 'Mật khẩu mới phải khác mật khẩu hiện tại';
    }
    return null;
  }

  String? validateConfirmPassword(String? value, bool isDuplicateNewPassword) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa xác nhận mật khẩu mới';
    } else if (value!.length < 6) {
      return 'Xác nhận mật khẩu phải có ít nhất 6 ký tự';
    } else if (isDuplicateNewPassword) {
      return 'Mật khẩu mới và xác nhận mật khẩu không khớp';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa nhập mật khẩu';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value?.replaceAll(' ', '').isEmpty ?? true) {
      return 'Bạn chưa nhập tài khoản';
    }
    return null;
  }
}
