/// UI model for a dashboard transaction row.
class TransactionItem {
  const TransactionItem({
    required this.title,
    required this.dateLabel,
    required this.amount,
    required this.isDeposit,
  });

  final String title;
  final String dateLabel;
  final String amount;
  final bool isDeposit;
}
