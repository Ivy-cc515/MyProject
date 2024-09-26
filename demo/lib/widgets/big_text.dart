import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget { //statelessWidget用於不會改變狀態的靜態 UI 元素
  final Color color;
  final String text;
  double size;
  TextOverflow overflow; //當文本溢出其容器寬度時,指定如何顯示溢出的部分
  BigText({super.key, this.color = const Color(0xFF332d2b), required this.text, this.size= 20,this.overflow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(      //這個build方法返回一個Text部件，用來顯示文本
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto', //指定字體為Roboto
        color: color, //指定文本顏色
        fontSize: size, //指定字體的大小
        fontWeight: FontWeight.w400 //指定字體的粗細程度
      ),
    );
  }
}

