

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../model/home_product_data.dart';


class ProductTileWidget extends StatelessWidget {                         //Card for 'best for you and fast warmup
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0,),
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  child: Center(child: Image.network(productDataModel.imageUrl,fit: BoxFit.fitWidth,)),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' '+productDataModel.name+' '),
                      SizedBox(height: 10,),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('  '+productDataModel.time+' min ')),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('  '+productDataModel.level+' ')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}