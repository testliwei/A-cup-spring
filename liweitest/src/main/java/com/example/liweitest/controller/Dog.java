package com.example.liweitest.controller;

public class Dog {
    //类的属性
    String breed;
    int size;
    String colour;
    int puppyAge;

    //类的方法
    void run(){
    }

    void  eat(){
    }
    void  name(){

    }

    //类对象，到具体的是哪个品种和颜色的狗 --称之为对象

    public Dog(String name){
        //z这是一个构造器，只有一个参数 是name，构造方法名字必须与类名相同，一个类可以有多个构造方法
        System.out.println("小狗的名字是："+name);
    }
    public void setAge(int age){
        puppyAge = age;

    }

    public int getAge(){
        System.out.println("小狗的年龄为："+puppyAge);
        return puppyAge;

    }


    public static void main(String[] args) {
        //创建一个对象
        Dog mydog = new Dog("tommy");
        //通过方法来设定age
        mydog.setAge(2);
        //调用方法来获取age
        mydog.getAge();
        //访问成员变量
        System.out.println("变量值："+mydog.puppyAge);
    }






}
