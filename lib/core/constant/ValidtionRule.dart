abstract class CustomValidationRule {
  final String name;
  final int strength;

  const CustomValidationRule(this.name, this.strength);

  bool validate(String value);
}

class CustomDigitValidationRule extends CustomValidationRule {
  const CustomDigitValidationRule() : super('Contains Digit', 1);

  @override
  bool validate(String value) {
    return RegExp(r'\d').hasMatch(value);
  }
}

class CustomUppercaseValidationRule extends CustomValidationRule {
  const CustomUppercaseValidationRule() : super('Contains Uppercase', 2);

  @override
  bool validate(String value) {
    return RegExp(r'[A-Z]').hasMatch(value);
  }
}

class CustomLowercaseValidationRule extends CustomValidationRule {
  const CustomLowercaseValidationRule() : super('Contains Lowercase', 2);

  @override
  bool validate(String value) {
    return RegExp(r'[a-z]').hasMatch(value);
  }
}

class CustomSpecialCharacterValidationRule extends CustomValidationRule {
  const CustomSpecialCharacterValidationRule()
      : super('Contains Special Character', 3);

  @override
  bool validate(String value) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }
}

class CustomMinCharactersValidationRule extends CustomValidationRule {
  final int minCharacters;

  const CustomMinCharactersValidationRule(this.minCharacters)
      : super('Minimum Characters', 1);

  @override
  bool validate(String value) {
    return value.length >= minCharacters;
  }
}

class CustomMaxCharactersValidationRule extends CustomValidationRule {
  final int maxCharacters;

  const CustomMaxCharactersValidationRule(this.maxCharacters)
      : super('Maximum Characters', 1);

  @override
  bool validate(String value) {
    return value.length <= maxCharacters;
  }
}
