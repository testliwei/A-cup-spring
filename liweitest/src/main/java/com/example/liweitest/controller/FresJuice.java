package com.example.liweitest.controller;

 class FresJuice {
    enum FreshJuiceSize {saml,mdedium}
    FreshJuiceSize size;
}

 class FresJuiceTest{
    public static void main(String[] args) {
        FresJuice juice = new FresJuice();
        juice.size = FresJuice.FreshJuiceSize.mdedium;
    }


}
