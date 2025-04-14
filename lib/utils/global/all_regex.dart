
RegExp uppercaseRegex = RegExp(r'[A-Z]');
RegExp lowercaseRegex = RegExp(r'[a-z]');
RegExp digitRegex = RegExp(r'[0-9]');
RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
final RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
);
