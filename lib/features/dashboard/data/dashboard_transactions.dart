import 'package:love_lock/features/dashboard/models/transaction_item.dart';

/// Sample transaction data for dashboard and transactions list.
abstract final class DashboardTransactions {
  static const List<TransactionItem> all = [
    TransactionItem(
      title: 'Deposit',
      dateLabel: 'Today',
      amount: '+\$100.00',
      isDeposit: true,
    ),
    TransactionItem(
      title: 'Withdrawal',
      dateLabel: 'Yesterday',
      amount: '-\$50.00',
      isDeposit: false,
    ),
    TransactionItem(
      title: 'Deposit',
      dateLabel: 'June 15, 2024',
      amount: '+\$200.00',
      isDeposit: true,
    ),
  ];
}
