package com.bookshop.user.md5util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {
	
	public static String formatMD5String(String param){
		String str = Integer.toHexString(param.hashCode())+param;
		String password = String.valueOf(str.hashCode());
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			//加密
			byte[] miwen = digest.digest(password.getBytes());
			StringBuilder builder = new StringBuilder();
			for(byte b:miwen) {
				String hex = Integer.toHexString(b & 0xFF);
				
				if (hex.length()==1){
					hex = 0+hex;
				}
				builder.append(hex);
			}
			return builder.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return String.valueOf(param.hashCode());
	}
}
