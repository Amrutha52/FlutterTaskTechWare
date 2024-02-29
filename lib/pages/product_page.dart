

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproo/bloc/product/product_bloc.dart';
import 'package:myproo/presentation/product_initial_screen.dart';
import 'package:myproo/repository/product_repository.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
  final ProductRepository productRepository;
    return BlocProvider(
      create: (context) => ProductBloc(productRepository: RepositoryProvider.of<ProductRepository>(context)),
      child: ProductInitialScreen(),
    );
  }
}