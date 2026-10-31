class Account {
  final String id;
  final String accountTitle;
  final String? category;
  final int? customer;
  final String? accountType;
  final String? currency;
  final double? workBalance;
  const Account({required this.id, this.accountType, this.currency, this.workBalance, required this.accountTitle, this.category, this.customer,});

  factory Account.fromJson(Map<String, dynamic> data) => Account(
    id: data['id'] as String? ?? '',
    accountType: data['accountType'] as String? ?? '',
    currency: data['currency'] as String? ?? '',
    workBalance: data['workBalance'] as double? ?? 0.00,
    accountTitle: data['accountTitle'] as String? ?? '',
    category: data['category'] as String? ?? '',
    customer: data['customer'] as int? ?? 0,
  );
}





