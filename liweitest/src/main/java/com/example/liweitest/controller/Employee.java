package com.example.liweitest.controller;

public class Employee {
    String name;
    int age;
    String designation;
    double salary;
    //Employee类的构造器
    public Employee(String name){
        this.name = name;
    }

    //设置age的
    public void  emAge(int emAge){
        age = emAge;
    }


    public void emSalary(double emSalary){
        salary = emSalary;
    }

    /* 设置designation的值*/
    public void empDesignation(String empDesig){
        designation = empDesig;
    }

    public void printEEmployee(){
        System.out.println("名字:"+ name );
        System.out.println("年龄:" + age );
        System.out.println("职位:" + designation );
        System.out.println("薪水:" + salary);
    }

    //为了运行这个程序，必须包含main方法并且创建一个实例对象，则会有EmployeeTest类


}
