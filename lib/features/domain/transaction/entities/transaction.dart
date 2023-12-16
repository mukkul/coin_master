import 'package:coin_master/features/domain/transaction/entities/transaction_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Transaction extends Equatable {
  final int? transactionId;
  final num amount;
  final DateTime transactionDateTime;
  final TransactionType transactionType;
  final Category category;

  const Transaction({
    required this.amount,
    required this.transactionDateTime,
    required this.transactionType,
    required this.category,
    this.transactionId
  });

  @override
  List<Object?> get props =>
      [amount, transactionDateTime, transactionType, category, transactionId];
}
