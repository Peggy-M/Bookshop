package com.bookshop.session.controller;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
public class SessionLisener implements HttpSessionListener {
	 
    @Override
    public void sessionCreated(HttpSessionEvent event) {
    	System.out.println("-----创建了");
    	// TODO Auto-generated method stub  
    	ServletContext context = event.getSession().getServletContext();  
    	if (context.getAttribute("count")==null) {  
    		context.setAttribute("count", 0);  
    	}else {  
    		int count = (Integer) context.getAttribute("count");  
    		context.setAttribute("count", count+1); 
    		System.out.println(context.getAttribute("count"));
    	} 
    }
 
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
    	System.out.println("------销毁了");
    	// TODO Auto-generated method stub  
    	ServletContext context = event.getSession().getServletContext();  
    	if (context.getAttribute("count")==null) {  
    		context.setAttribute("count", 0);  
    	}else {  
    		int count = (Integer) context.getAttribute("count");  
	    	if (count<1) {  
	    		count = 1;  
	    	}  
	    	context.setAttribute("count", count-1);  
	    	System.out.println(context.getAttribute("count")+"================");
    	}  
    	HttpSession session = event.getSession();  
    	String name = (String) session.getAttribute("name"); 
    	System.out.println(name+"-----------");
    	/*HashSet<String> nameSet = (HashSet<String>) context.getAttribute("nameSet");  
    	nameSet.remove(name);  */
    	}  
    }
 
