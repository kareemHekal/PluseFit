// ignore_for_file: camel_case_types

///  Auth Intent ///
// ignore_for_file: non_constant_identifier_names, dangling_library_doc_comments

sealed class CompleteRegisterIntent {}

class UpdateIndex extends CompleteRegisterIntent {
  bool isBackButton;

  UpdateIndex({required this.isBackButton});
}

class UpdateUserIntent extends CompleteRegisterIntent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final num? age;
  final num? weight;
  final num? height;
  final String? activityLevel;
  final String? goal;

  UpdateUserIntent({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
  });
}
