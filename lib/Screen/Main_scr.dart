import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/Bloc/CardState.dart';
import 'package:food_order_app/Bloc/Cardbloc.dart';
import 'package:food_order_app/Screen/Card_scr.dart';
import 'package:food_order_app/Widgets/Food_product_items.dart';
import 'package:food_order_app/models/CategoryModel.dart';
import 'package:food_order_app/models/MyProductModel.dart';

class Main_scr extends StatefulWidget {
  const Main_scr({super.key});

  @override
  State<Main_scr> createState() => _Main_scrState();
}

class _Main_scrState extends State<Main_scr> {
  int slectedIndex=0;
  String category='';
  List<MyProductModel>productmodel=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(myCategories.isNotEmpty){
      category=myCategories[0].name;
      productmodelbycategory(category);
    }
  }
  void productmodelbycategory(String slectedCategory){
    setState(() {
      category = slectedCategory;
      productmodel= myProductModel.where((element)=>
      element.category.toLowerCase()==slectedCategory.toLowerCase()).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 11.h,),
              Row(
                children: [
                  Text("Your Location",
                    style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w600)
                    ,),
                  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 20.r,)
                ],
              ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: Colors.orange,size: 20.r,),
                        SizedBox(width: 5.w,),
                        Text("Punjab, India",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.w600),)
                      ],
                    )
            ],)
            ),
          ],
        ),
        ),
        SizedBox(height: 35.h,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text("Let's finds the best food around you",
          style: TextStyle(fontSize: 35.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
          color: Colors.black),),),
        SizedBox(height: 25.h,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Find by Category",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600,color: Colors.black),),
            Text("See All",style: TextStyle(color: Colors.orange),)
          ],
        ),
        ),
        SizedBox(height: 25.h,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(myCategories.length, (index)=>GestureDetector(
              onTap: (){
                productmodelbycategory(myCategories[index].name);
              },
              child: Container(height: 105.h,
              width:85.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: category==myCategories[index].name?Border.all(width: 2.w,color: Colors.orange):
                Border.all(color: Colors.white),
              ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(width: 45.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow:[ BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0,10),
                              blurRadius: 12,
                              spreadRadius: 5,
                            )]
                          ),),
                          Image.asset(myCategories[index].image,width: 70.w,
                          height: 65.h,
                          fit: BoxFit.cover,)
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Text(myCategories[index].name,
                        style: TextStyle(color: Colors.black,),),

                    ],
                  ),
              ),
            ))
          ],
        ),),
        SizedBox(height: 25.h,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text("Result (${productmodel.length})",
          style: TextStyle(color: Colors.black54,
              fontWeight: FontWeight.w600,letterSpacing: 2),),),
        SizedBox(height: 20.h,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              ...List.generate(productmodel.length, (index)=>Padding(
                  padding:index==0?EdgeInsets.only(left: 25,right: 25)
                      :EdgeInsets.only(right: 25),
              child: FoodProductItems(productModel: productmodel[index],),))
            ],
          ),
        )
      ],
    ));
  }
}
