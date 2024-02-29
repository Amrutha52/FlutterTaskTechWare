

import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Create extends ProductEvent {
  final String name;
  final String measurement;
  final String price;
  final String qrcode;

  Create(this.name, this.measurement, this.price,this.qrcode);
}