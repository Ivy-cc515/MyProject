import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;
  //TextOverflow overflow; //當文本溢出其容器寬度時,指定如何顯示溢出的部分
  SmallText({Key? key, this.color = const Color(0xFFccc7c5), required this.text, this.size= 12, this.height = 1.2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(      //這個build方法返回一個Text部件，用來顯示文本
      text,
      //overflow: overflow,
      style: TextStyle(
          fontFamily: 'Roboto', //指定字體為Roboto
          color: color, //指定文本顏色
          fontSize: size, //指定字體的大小
          height: height,
          //fontWeight: FontWeight.w400 //指定字體的粗細程度
      ),
    );
  }
}

