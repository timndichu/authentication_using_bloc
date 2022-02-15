// ignore_for_file: prefer_const_constructors

import 'package:auth_bloc/controllers/cubit/products/edit_product_cubit.dart';
import 'package:auth_bloc/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class EditProductScreen extends StatelessWidget {
  final Product todo;
  EditProductScreen({Key key, this.todo}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = "";

    return BlocListener<EditProductCubit, EditProductState>(
      listener: (context, state) {
        if (state is ProductEdited) {
          Navigator.pop(context);
        } else if (state is EditProductError) {
          Toast.show(state.error, context,
              backgroundColor: Colors.red, duration: 3, gravity: Toast.CENTER);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Product"),
          actions: [
            InkWell(
              onTap: () {
                // BlocProvider.of<EditProductCubit>(context).deleteProduct(todo);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.delete),
              ),
            )
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            autocorrect: true,
            decoration: InputDecoration(hintText: "Enter todo message..."),
          ),
          SizedBox(height: 10.0),
          InkWell(
              onTap: () {
                // BlocProvider.of<EditProductCubit>(context)
                //     .updateProduct(todo, _controller.text);
              },
              child: _updateBtn(context))
        ],
      ),
    );
  }

  Widget _updateBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          "Update Product",
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }
}
