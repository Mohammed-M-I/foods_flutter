import 'package:flutter/material.dart';
import 'package:foods_rouni/app/core/network/models/paged_list.dart';

import '../../domain/entities/product.dart';

class ProductsUiState {
  final List<Product> products;
  final PagedList pagedList;

  final bool isLoading;

  final int categoryId;
  final String search;

  final ScrollController scrollController;

  ProductsUiState({
    required this.products,
    required this.pagedList,
    required this.isLoading,
    required this.categoryId,
    required this.search,
    required this.scrollController,
  });

  ProductsUiState.defaultObj()
      : this(
          products: [],
          pagedList: PagedList.defaultObj().copyWith(
            pageSize: 4,
          ),
          isLoading: false,
          categoryId: -1,
          search: '',
          scrollController: ScrollController(),
        );

  ProductsUiState copyWith({
    List<Product>? products,
    PagedList? pagedList,
    bool? isLoading,
    int? categoryId,
    String? search,
    ScrollController? scrollController,
  }) =>
      ProductsUiState(
        products: products ?? this.products,
        pagedList: pagedList ?? this.pagedList,
        isLoading: isLoading ?? this.isLoading,
        categoryId: categoryId ?? this.categoryId,
        search: search ?? this.search,
        scrollController: scrollController ?? this.scrollController,
      );
}
