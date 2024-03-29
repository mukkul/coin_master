import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_master/features/transaction/domain/entities/transaction_type.dart';
import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String? transactionId;
  final double amount;
  final Timestamp transactionDateTime;
  final TransactionType transactionType;
  final String? category;
  final String? description;

  const TransactionEntity({
    required this.amount,
    required this.transactionDateTime,
    required this.transactionType,
    required this.category,
    this.transactionId,
    this.description,
  });

  @override
  List<Object?> get props =>
      [transactionId, amount, transactionDateTime, transactionType, category, description];
}
