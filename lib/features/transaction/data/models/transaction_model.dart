import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String transactionId;
  final num transactionAmount;
  final String category;
  final String icon;
  final String created;
  final String updated;
  const TransactionModel({
    required this.transactionAmount,
    required this.category,
    required this.created,
    required this.icon,
    required this.transactionId,
    required this.updated,
  });

  // factory TransactionModel.fromFirstoreDocumentCollection(
  //  CollectionReference<Map<String, dynamic>> firestoreTransaction) {
  //   firestoreTransaction.get().then((event) {
  //     for(var transaction in event.docs){
  //        return TransactionModel(
  //         transactionAmount: transaction.data()['transactionAmount'],
  //         category: transaction.data()['transactionAmount'],
  //         created: transaction.data()['transactionAmount'],
  //         icon: transaction.data()['transactionAmount'].,
  //         transactionId: transaction.data()['transactionAmount'],
  //         updated: transaction.data()['updated'],
  //       );
  //     }
  //   });
  // }

  // Transaction toEntity(){
  //   return Transaction(
  //     amount: transactionAmount,
  //     transactionDateTime: DateTime.fromMillisecondsSinceEpoch(created),
  //     transactionType: transactionType,
  //     category: category,
  //   );
  // }

  @override
  List<Object?> get props => [
    transactionId,
    transactionAmount,
    category,
    icon,
    created,
    updated,
  ];
}
