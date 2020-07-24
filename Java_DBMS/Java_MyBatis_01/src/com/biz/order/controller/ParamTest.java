package com.biz.order.controller;

import com.biz.order.model.OrderVO;

public class ParamTest {
	
	public void add(int num1, int num2) {
		
		num1 = 100;
		num2 = 200;
		
		int sum = num1 + num2;
	}
	
	
	public void add(OrderVO orderVO) {
		
		orderVO.setO_pcode("알수 없음");
	}
	
	
	public void add(int[] intArray) {
		
		if(intArray.length > 0) {
			intArray[0] = 1000_000_000;
		}
	}
	
	public void add(String str) {
		str = "Republic of Korea";
	}
	
	public void add(Integer integer) {
		integer = 5555_5555;
	}
	
	
	public void non(OrderVO orderVO) {
		orderVO = new OrderVO();
		orderVO.setO_pcode("나는 누구게?");
	}
	
	
	public void non(int[] intArray) {
		intArray = new int[3];
		intArray[0] = 3333_3333;
	}
	
	
	// return 을 이용하여 값을 반환
	 
	public OrderVO ret(OrderVO orderVO) {
		orderVO = new OrderVO();
		orderVO.setO_pcode("나는 누구게?");
		return orderVO;
	}
	
	
	public int[] ret(int[] intArray) {
		intArray = new int[3];
		intArray[0] = 3333_3333;
		return intArray;
	}

}
