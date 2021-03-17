package com.example.liweitest.controller;

class OuterClass {//外部类

    int x =10;

    //内部类\嵌套类（有两种类型，非静态内部类、静态内部类）
    class InnerClass{
        int y = 5;

    }

    //定义一个匿名类
    //object1 = new void Type(parameterList) {
        // 匿名类代码
    //};
}

//由于内部类嵌套在外部类，因此必须首先实例化外部类，然后创建内部类的对象来实现
public class  MyMainClass{
    public static void main(String[] args) {
        OuterClass myOuter = new OuterClass();
        OuterClass.InnerClass myInner = myOuter.new InnerClass();
        System.out.println(myInner.y + myOuter.x);
    }
}