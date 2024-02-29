


import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproo/bloc/product/product_event.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bloc/product/product_bloc.dart';

class ProductAddingPage extends StatefulWidget {
  const ProductAddingPage({Key? key}) : super(key: key);

  @override
  _ProductAddingPageState createState() => _ProductAddingPageState();
}

class _ProductAddingPageState extends State<ProductAddingPage>
{
// text fields' controllers
  String? data;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _measurementController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

 // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> _create() async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _measurementController,
                    decoration: const InputDecoration(labelText: 'Measurement'),
                  ),
                  TextField(
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                    controller: _priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    print('Insideqrgenerator');
                    setState(() {
                      data = _nameController.text;
                    });
                  }, child: Text('Generate QR')),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child:  QrImageView(
                      data: '$data',
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    // child: RepaintBoundary(
                    //   key: _scaffoldKey,
                    //   child: QrImageView(
                    //     data: '$data',
                    //     version: QrVersions.auto,
                    //     size: 200.0,
                    //   ),
                    // ),
                  ),
                  ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final double? price =
                      double.tryParse(_priceController.text);
                      if (price != null) {
                       // _postData(context);

                        BlocProvider.of<ProductBloc>(context).add(
                          Create(_nameController.text, _measurementController.text,_priceController.text, ""),
                        );
                        _nameController.text = '';
                        _nameController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          );

        });
  }

  void _postData(context)

  {

    // RenderRepaintBoundary? boundary = _scaffoldKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    // ui.Image image = await boundary!.toImage();
    // ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // // Uint8List pngBytes = byteData!.buffer.asUint8List();
    // var qrString = byteData?.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    // BlocProvider.of<ProductBloc>(context).add(
    //   Create(_nameController.text, _measurementController.text,_priceController.text, ""),
    // );

  }

  Future<void> _captureAndSharePng() async {

   //  RenderRepaintBoundary? boundary = _scaffoldKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
   //  ui.Image image = await boundary!.toImage();
   //  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
   // // Uint8List pngBytes = byteData!.buffer.asUint8List();
   //  var abc = byteData?.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    // final tempDir = await getExternalStorageDirectory();
    // final file = await new File('${tempDir!.path}/shareqr.png').create();
    // await file.writeAsBytes(pngBytes);
    // await Share.shareFiles([file.path]);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Add Product')),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}