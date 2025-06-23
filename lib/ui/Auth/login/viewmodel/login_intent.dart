// ignore_for_file: camel_case_types

///  Auth Intent ///
// ignore_for_file: non_constant_identifier_names, dangling_library_doc_comments

sealed class AuthIntent {}

class LoginIntent extends AuthIntent {
  final String email;
  final String password;
  LoginIntent({required this.email, required this.password});
}
