import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String categoryName;
  final String categoryIcon;

  const Category({
    required this.categoryIcon,
    required this.categoryName,
  });
  
  @override
  List<Object?> get props => [categoryName, categoryName];
}
