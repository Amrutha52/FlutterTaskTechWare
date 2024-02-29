

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproo/presentation/product_adding_page.dart';

import '../bloc/product/product_bloc.dart';
import '../bloc/product/product_state.dart';
import '../repository/product_repository.dart';

class ProductInitialScreen extends StatefulWidget
{
  ProductInitialScreen({super.key});

  @override
  State<ProductInitialScreen> createState() => _ProductInitialScreenState();

}

class _ProductInitialScreenState extends State<ProductInitialScreen>
{
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => ProductBloc(
          productRepository:RepositoryProvider.of<ProductRepository>(context)
      ),
      child: Scaffold(
          key: scaffoldKey,
          body: BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ProductAdded) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Product added"), duration: Duration(seconds: 2),));
                }
              },
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductAdding) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(state is ProductError){
                    return const Center(child:Text("Error"));
                  }
                  return const ProductAddingPage();
                },
              )
          )
      ),
    );
  }
}