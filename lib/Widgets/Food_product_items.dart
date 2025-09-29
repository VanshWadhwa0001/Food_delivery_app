import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/Bloc/CardEvents.dart';
import 'package:food_order_app/Bloc/Cardbloc.dart';
import 'package:food_order_app/models/MyProductModel.dart';
class FoodProductItems extends StatefulWidget {
  final MyProductModel productModel;
  const FoodProductItems({super.key, required this.productModel});

  @override
  State<FoodProductItems> createState() => _FoodProductItemsState();
}

class _FoodProductItemsState extends State<FoodProductItems> {
  Color colo=Colors.red;
  int isfovt=1;
  @override
  void initState() {
    isfovt=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [Container(
        height: 225.h,width:size.width/2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
        Container(height: 285.h,
          width:size.width/2.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.rotate(
              angle: 10*pi/3420,
              child: SizedBox(height: 165.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(child: Container(height: 50.h,width: 100.w,
                  decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.black26,spreadRadius: 10,
                  blurRadius: 30)]),)),
                Image.asset(widget.productModel.image,
                height: 150.h,)
                ],
              ),),
            ),
            SizedBox(height: 10.h, ),
            Text(widget.productModel.name,maxLines:1,style:  TextStyle(fontSize: 19.sp,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 10.h,),
            Row(children: [
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    size: 22.r,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(widget.productModel.rate.toString(),style:
                  TextStyle(color:Colors.black87),),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Row(
                children: [
                  Icon(Icons.location_on,color: Colors.orange,size: 20.r,),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("${widget.productModel.distance}M",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),)
                ],
              )
            ],),
            SizedBox(
              height: 20.h,
            ),
            Text("Rs:-${widget.productModel.price}",style:
            TextStyle(color: Colors.black87,
                fontWeight: FontWeight.bold,fontSize: 20.r),
            ),
          ],
        ),),),
        Positioned(
          right: 0,bottom: 0,
            child: GestureDetector(onTap: (){
              context.read<CartBloc>().add(AddCart(widget.productModel));
            },
        child: Container(padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )
        ),
          child: Icon(Icons.shopping_cart_outlined,size: 16.r,color: Colors.white,),
        ),))

      ],
    );
  }
}
