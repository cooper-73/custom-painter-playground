enum PatternKind {
  circle,
  spiral,
  spirograph,
}

extension PatternKindX on PatternKind {
  String get title {
    return switch (this) {
      PatternKind.circle => 'Circle',
      PatternKind.spiral => 'Spiral',
      PatternKind.spirograph => 'Spirograph',
    };
  }

  static PatternKind fromString(String value) {
    final lowerCaseValue = value.toLowerCase();

    return switch (lowerCaseValue) {
      'circle' => PatternKind.circle,
      'spiral' => PatternKind.spiral,
      'spirograph' => PatternKind.spirograph,
      _ => throw ArgumentError('Invalid PatternKind: $value'),
    };
  }
}
