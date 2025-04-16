class MonthYearView {
  int month;
  int year;

  MonthYearView({
    required this.month,
    required this.year,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MonthYearView && other.month == month && other.year == year;
  }

  @override
  int get hashCode => month.hashCode ^ year.hashCode;
}
