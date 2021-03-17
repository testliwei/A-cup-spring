package com.example.liweitest.controller;

public class EmployeeTest {
    public static void main(String[] args) {
        //使用构造器创建两个对象
        Employee empOne = new Employee("RUNOOB1");

        //调用以上两个对象的成员方法
        empOne.emAge(26);
        empOne.empDesignation("高级测试人员");
        empOne.emSalary(1000);
        empOne.printEEmployee();
    }
}
