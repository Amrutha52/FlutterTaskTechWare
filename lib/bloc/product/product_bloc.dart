

import 'package:bloc/bloc.dart';
import 'package:myproo/bloc/product/product_event.dart';
import 'package:myproo/bloc/product/product_state.dart';

import '../../repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(ProductAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await productRepository.create(
            name: event.name, measurement: event.measurement, price: event.price, qrcode: event.qrcode);
        emit(ProductAdded());
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

  }
}