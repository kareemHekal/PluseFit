sealed class ChangePasswordIntent {}

class ChangePasswordRequestIntent extends ChangePasswordIntent {
  final String currentPassword;
  final String newPassword;

  ChangePasswordRequestIntent({
    required this.currentPassword,
    required this.newPassword,
  });
}