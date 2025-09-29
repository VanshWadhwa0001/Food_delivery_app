import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/Bloc/CardEvents.dart';
import 'package:food_order_app/Bloc/CardState.dart';
import 'package:food_order_app/Bloc/Cardbloc.dart';
import 'package:food_order_app/models/MyProductModel.dart';

class CartItemModel extends StatefulWidget {
  final String img;
  final String Name;
  final  price;
  final int items;
  final titems;
  final  rating;
  final loction;
  final cat;
  final int index;
  final Color colo;

  const CartItemModel({super.key,required this.img,required this.Name,required this.index,
    required this.cat,
    required this.rating,required this.loction,required this.price,required this.items,
    required this.titems,
  required this.colo});

  @override
  State<CartItemModel> createState() => _CartItemModelState();
}

class _CartItemModelState extends State<CartItemModel> {
  @override
  Widget build(BuildContext context) {
    final Product= MyProductModel(colo: widget.colo,image: widget.img, name: widget.Name, category: widget.cat, price: widget.price, rate: widget.rating, distance: widget.loction);
    Size size = MediaQuery.of(context).size;
    return   BlocBuilder<CartBloc,CartState>(
        builder: (cont,state) {
          return SizedBox(
            height: 140.h,
            width: size.width / 1.1,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 130, width: size.width - 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Positioned(
                    top: -5,
                    left: 0,
                    child: Transform.rotate(
                      angle: 10 * pi / 3420,
                      child: SizedBox(
                        height: 130.h,
                        width: 130.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 100.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 10,
                                            spreadRadius: 5),
                                      ]
                                  ),
                                )),
                            Image.asset(widget.img, width: 130.w,),
                          ],
                        ),
                      ),
                    )),
                Positioned(left: 150,
                    right: 20,
                    top: 20,
                    child:
                    Column(
                      children: [
                        Text(widget.Name, maxLines: 1,
                          style: TextStyle(fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),),
                        SizedBox(height: 10.h,),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded, color: Colors.orange,
                                  size: 20.r,),
                                SizedBox(width: 5.w,),
                                Text("${widget.rating}", style: TextStyle(
                                    color: Colors.black87),)
                              ],
                            ),
                            SizedBox(width: 20.w,),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.pink,
                                  size: 20.r,),
                                Text("${widget.loction.toString()}",
                                  style: TextStyle(color: Colors.black87,),)
                              ],
                            )
                          ],),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rs:-${widget.price}", style: TextStyle(
                                color: Colors.black87,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                SizedBox(width: 10.w,),
                                Text("${widget.items}", style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),),
                                SizedBox(width: 5.w,),
                                GestureDetector(
                                  onTap: () {
                                  }, child: Container(
                                  width: 20.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(7)
                                      )
                                  ),
                                  child: Icon(
                                    Icons.remove, color: Colors.white,
                                    size: 20.r,),
                                ),
                                ),
                                SizedBox(width: 5.w,),
                                GestureDetector(
                                  onTap: () {
                                    cont.read<CartBloc>().add(
                                        AddQuantity(Product));
                                  }, child: Container(
                                  width: 20.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(7)
                                      )
                                  ),
                                  child: Icon(
                                    Icons.add, color: Colors.white,
                                    size: 20.r,),
                                ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          );

        });
  }
}
