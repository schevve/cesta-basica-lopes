class Payment {
  final int id;
  final String method;
  final double amount;
  final DateTime date;

  Payment({
    required this.id,
    required this.method,
    required this.amount,
    required this.date,
  });
}
