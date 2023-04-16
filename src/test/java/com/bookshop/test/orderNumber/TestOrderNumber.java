package com.bookshop.test.orderNumber;

import org.junit.Test;

import com.bookshop.utils.GenerateNum;

public class TestOrderNumber {


	@Test
	public void test() {
		String num = GenerateNum.getInstance().generateOrder();
		System.out.println(num);
		
	}

}
