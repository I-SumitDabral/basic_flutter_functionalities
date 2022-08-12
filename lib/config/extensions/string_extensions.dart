extension StringExtension on String {
  String get intelliTrimForcategory {
    return length > 8 ? '${substring(0, 8)}.' : this;
  }

  String get intelliTrimOfSubTitle {
    return length > 40 ? '${substring(0, 40)}...' : this;
  }
}
