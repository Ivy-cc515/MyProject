import 'package:demo/home/colors.dart';
import 'package:demo/widgets/big_text.dart';
import 'package:demo/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/icon_and_text_widget.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //用來控制頁面的滾動、監聽頁面的變化、以及直接跳轉到特定頁面
  PageController pageController = PageController(viewportFraction: 0.85);  //viewportFraction 決定頁面占據的視窗比例，影響從一個頁面的兩側看到其他頁面的程度多寡 //這裡設置為 0.85，代表頁面占據螢幕的 85%，其餘 15% 會用來顯示下一頁的部分
  var _currentPageValue=0.0;  //用來追蹤當前頁面的位置
  double _scaleFactor=0.0;

  @override
  void initState(){  //在 Flutter 中覆寫 initState() 來設置初始狀態
    super.initState();
    pageController.addListener(() {  //監聽器，每當 PageView 滾動時，會觸發監聽器執行
      setState(() {
        _currentPageValue = pageController.page!;  //目前頁面的位置信息，可以用來實時監控頁面滾動的位置  //在這行代碼中，! 是 Dart 的 null safety 操作符，表示你保證這個值不會是 null。如果這個值為 null，程式將拋出運行時錯誤
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();  //用於釋放 PageController 佔用的資源
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      height: 320,
      child: PageView.builder(  //用來創建一個可以橫向滑動的頁面視圖
          controller: pageController,
          itemCount: 5,  //這個屬性指定了頁面的數量
          itemBuilder: (context, position){
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index){   //Dart 是透過底線（_）來將屬性、方法私有化 //用於生成每個頁面的具體內容
    Matrix4 matrix = new Matrix4.identity();  //Matrix4 表示一個 4x4 的變換矩陣，可以用來處理 3D 變換（如平移、旋轉、縮放等）。   //Matrix4.identity()是一個靜態方法，它創建並返回一個 "單位矩陣"，可以把單位矩陣理解為「不變」的狀態，是矩陣變換的初始狀態。
    if(index == _currentPageValue.floor()){  //Returns the greatest integer no greater than this number. Rounds the number towards negative infinity.
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
    }else if(index == _currentPageValue.floor()+1){
      var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
    }
    return Stack(   //用在兩個物件疊在一起的時候
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10), //會影響可滑動頁面之間的距離
          decoration: BoxDecoration( //設定背景色和圓角邊框
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),  //isEven 是 Dart 中的一個屬性，用來判斷整數是否是偶數
              image:DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage(
                      "assets/image/food0.png"
                  )
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration( //設定背景色和圓角邊框
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: 10,),  //SizedBox 是 Flutter 中一個非常有用的 widget，用來設置固定大小的空間 //這裡用來形成Chinese Side 與 星星評分之間的距離
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {return Icon(Icons.star, color: AppColors.mainColor, size: 15,);}),
                        ),  //用於將子 widget 進行自動換行排列  //direction 可以改變 wrap 排列子 widget的方向
                        SizedBox(width: 10,),
                        SmallText(text: "4.5",),
                        SizedBox(width: 10,),
                        SmallText(text: "1287",),
                        SizedBox(width: 10,),
                        SmallText(text: "comments",)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                        IconAndTextWidget(icon: Icons.location_on, text: "1.7km", iconColor: AppColors.mainColor),
                        IconAndTextWidget(icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.iconColor2),
                      ]
                    )
                  ],
                ),
              ),
          ),
        )
      ],
    );
  }
}

