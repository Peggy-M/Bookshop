package com.bookshop.frontbook.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/code")
public class IdentifyingCodeController {
	private String codeChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private String codeValue;
	private Color[] colors = {Color.BLUE,Color.green,Color.black,Color.orange};
	
	private void createCode(Graphics g,Color[] colors) {
		StringBuffer sb = new StringBuffer();
		Random random = new Random();
		char ch;
		for(int i=0;i<4;i++){
			g.setColor(colors[random.nextInt(4)]);
			ch = codeChars.charAt(random.nextInt(62));
			sb.append(ch);
			g.drawString(String.valueOf(ch), (12*i+10), 15);
		}
		codeValue = sb.toString();
	}
	
	@RequestMapping("/ValidateCode")
	public void makeCode(HttpSession session,HttpServletResponse resp,Model model) throws IOException{
		resp.setHeader("ragma", "No-cache");
		resp.setHeader("Cache-Control", "no-cache");
		resp.setDateHeader("Expires", 0);
		BufferedImage image = new BufferedImage(60, 20,BufferedImage.TYPE_INT_BGR);
		Graphics gra = image.getGraphics();
		gra.setColor(Color.white);
		gra.fillRect(0, 0, 60, 20);
		Font font = new Font("Courier", Font.BOLD, 16);
		gra.setFont(font);
		createCode(gra, colors);
		gra.dispose();
		session.setAttribute("codeValue", codeValue);
		ImageIO.write(image, "png", resp.getOutputStream());	
		
	}

}
