import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/Bloc/CardState.dart';
import 'package:food_order_app/Bloc/Cardbloc.dart';
import 'package:food_order_app/Screen/Home_screen.dart';
import 'package:food_order_app/Screen/Main_scr.dart';
import 'package:food_order_app/models/CartModel.dart';
import 'package:food_order_app/models/Cart_item_model.dart';
class Card_scr extends StatefulWidget {
  const Card_scr({super.key});

  @override
  State<Card_scr> createState() => _Card_scrState();
}

class _Card_scrState extends State<Card_scr> {
  @override
  Widget build(BuildContext context) {
   final carts = context.read<CartBloc>().state.carts;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border:Border.all(
                    color: Colors.black87
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                  },
                  child: Icon(Icons.arrow_back,color: Colors.black87,),
                ),),
              ),
              Text("My Cart",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 22.sp),
              ),
              SizedBox(),
            ],
          ),),
          BlocBuilder<CartBloc,CartState>(
            builder: (context,state){
            return Expanded(child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(carts.length, (index)=>
                Container(
                  height: 145.h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: index ==0? 30:0,
                    right: 25,
                    left: 25,
                    bottom: 30
                  ),
                  child: Stack(alignment: Alignment.bottomCenter,
                  children: [
                    CartItemModel(
                      colo: state.carts[index].productModel.colo,
                      rating:state.carts[index].productModel.rate,
                      loction: state.carts[index].productModel.distance,
                      img:state.carts[index].productModel.image,
                    Name: state.carts[index].productModel.name,
                      price: state.carts[index].productModel.price,
                    items: state.items,
                    titems: state.total,
                      cat: state.carts[index].productModel.category,
                      index: index,
                    )
                  ],),
                )),
              ],
            ),),
          );

            }),
        ],
      )),
      floatingActionButton: Container(
        width: 350,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: (){}, child: Text("${context.read<CartBloc>().state.total}",style: TextStyle(color: Colors.white,fontSize: 20.sp),))),
    );
  }
}
