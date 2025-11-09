enum PatternKind {
  circle,
  spiral,
  spirograph,
}

extension PatternKindX on PatternKind {
  String get title {
    switch (this) {
      case PatternKind.circle:
        return 'Circle';
      case PatternKind.spiral:
        return 'Spiral';
      case PatternKind.spirograph:
        return 'Spirograph';
    }
  }
}
