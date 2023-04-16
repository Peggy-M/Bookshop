package com.bookshop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**订单号生成
 * @author 陈博伦
 *
 */
public class GenerateNum {
	// 使用单例模式，不允许直接创建实例
	private GenerateNum(){}
	
	// 创建一个空实例对象，类需要用的时候才赋值
	private static GenerateNum g = null;
	
	// 单例模式--懒汉模式
	public static synchronized GenerateNum getInstance(){
		if(g==null){
			g = new GenerateNum();
		}
		return g;
	}
	
	// 全局自增数
	private static int count = 0;
	// 每分钟最多生成999个订单
	private static final int total = 999;
	// 格式化的时间字符串
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
	
	//获取当前后两位年份+两位数月份+两位数天+两位数时+两位数分
	private static String getNowDateStr(){
		return sdf.format(new Date());
	}
	
	// 记录上一次的时间，用来判断是否需要递增全局数
	private static String now = null;
	
	public synchronized String generateOrder() {
		String datestr = getNowDateStr();
		if(datestr.equals(now)){
			count++;
		}else {
			count = 1;
			now = datestr;
		}
		//算补位(0)
		int countInteger = String.valueOf(total).length()-String.valueOf(count).length();
		//拼接补位字符串
		String bu = "";
		for(int i=0;i<countInteger;i++){
			bu += "0";
		}
		bu += String.valueOf(count);
		if(count>=total){
			count = 0;
		}
		//最终生成订单号
		String orderNumber = datestr+bu;
		return orderNumber;
	}
}
