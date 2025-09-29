import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/Screen/Fovt.scr.dart';
class Profile_Scr extends StatefulWidget {
  const Profile_Scr({super.key});

  @override
  State<Profile_Scr> createState() => _Profile_ScrState();

}


class _Profile_ScrState extends State<Profile_Scr> {
TextEditingController Name=TextEditingController();
TextEditingController No=TextEditingController();
TextEditingController Address=TextEditingController();
String bb="";
String name="";
String no="";
String add="";
@override
  void initState() {
    bb="Save";
    name="Enter Your Name";
    no="Enter Your Phone Number";
    add="Enter Your Address";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile",style: TextStyle(fontSize: 15.sp),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 350,
                child: Image.asset("assets/food.png"),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 300.w,
                height: 60.h,
                child: TextField(
                  controller: Name,
                  decoration: InputDecoration(
                    hintText: name,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 2.w,color: Colors.black),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 2.w,color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
              Container(
                width: 300.w,
                height: 60.h,
                child: TextField(
                  controller: No,
                  decoration: InputDecoration(
                    hintText: no,
                    suffixIcon: Icon(Icons.phone),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 2.w,color: Colors.black),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 2.w,color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.h,),
              Container(
                width: 300.w,
                height: 60.h,
                child: TextField(
                  controller: Address,
                  decoration: InputDecoration(
                    hintText: add,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 2.w,color: Colors.black),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 2.w,color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Container(
                width: 300.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: (){
                      if(Name==null || Address==null || No==null){
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(title: Text("Plz Enter All Fields"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("OK"))
                            ],);
                        });
                      }
                      else{
                        setState(() {
                          bb="Edit";
                          name=Name.text.toString();
                          no=No.text.toString();
                          add= Address.text.toString();
                          No.clear();
                          Name.clear();
                          Address.clear();
                        });
                      }
                    }, child: Text(bb,style: TextStyle(fontSize: 20.sp,color: Colors.black),)),
              )
            ],
          )
        )
    );
  }

  }


