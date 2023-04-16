package com.bookshop.order.service.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.order.bean.CompanyDTO;
import com.bookshop.order.bean.OrderDTO;
import com.bookshop.order.dao.IOrderDAO;
import com.bookshop.order.service.IOrderService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Service
public class OrderServiceImpl implements IOrderService {
	private IOrderDAO OrderDAO;
    public static final String DEF_CHATSET = "UTF-8";
    public static final int DEF_CONN_TIMEOUT = 30000;
    public static final int DEF_READ_TIMEOUT = 30000;
    public static String userAgent =  "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";
 
    //配置您申请的KEY
    public static final String APPKEY ="82ea2d0ac742934648235706d0d1ca18";
	@Autowired
	public void setOrderDAO(IOrderDAO orderDAO) {
		OrderDAO = orderDAO;
	}

	@Override
	public OrderDTO queryOrder(Integer id) {
		return OrderDAO.queryOrder(id);
	}

	@Override
	public int getUserOrderCount(Integer id) {
		return OrderDAO.getUserOrderCount(id);
	}

	@Override
	public List<OrderDTO> getUserOrder(Integer userId, Integer pageno) {
		return OrderDAO.getUserOrder(userId, pageno);
	}

	@Override
	public int getAllOrderCount() {
		return OrderDAO.getAllOrderCount();
	}

	@Override
	public List<OrderDTO> getAllOrder(Integer pageno) {
		return OrderDAO.getAllOrder(pageno);
	}

	@Override
	public void addOrderInfo(OrderDTO order) {
		OrderDAO.addOrderInfo(order);
	}

	@Override
	public void deleteOrderInfo(Integer id) {
		OrderDAO.deleteOrderInfo(id);
	}

	@Override
	public List<OrderDTO> getAllUserOrder(Integer id) {
		return OrderDAO.getAllUserOrder(id);
	}

	@Override
	public OrderDTO getOrderByOrderNumber(String orderNumber) {
		return OrderDAO.getOrderByOrderNumber(orderNumber);
	}

	public static JSONObject getRequest1(String id,String company) {
		String result =null;
        String url ="http://v.juhe.cn/exp/index";//请求接口地址
        Map<String, Object> params = new HashMap<String, Object>();//请求参数
            params.put("com",company);//需要查询的快递公司编号
            params.put("no",id);//需要查询的订单号
            params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
            params.put("dtype","json");//返回数据的格式,xml或json，默认json
        try {
            result =net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                JSONObject object1 = JSONObject.fromObject(object.get("result"));
                return object1;
            }else{
            	System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
	}

	public static void getRequest2() {
        String result =null;
        String url ="http://v.juhe.cn/exp/com";//请求接口地址
        Map<String, Object> params = new HashMap<String, Object>();//请求参数
        params.put("key",APPKEY);//应用APPKEY(应用详细页查询)
        try {
            result =net(url, params, "GET");
            System.out.println(result);
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
                JSONArray array = object.getJSONArray("result");
                for (int i = 0; i <array.size(); i++) {
                	JSONObject interestJsonObj = array.getJSONObject(i);
                	String name = interestJsonObj.getString("com");
                	System.out.println(name);
                }
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}
    /**
    *
    * @param strUrl 请求地址
    * @param params 请求参数
    * @param method 请求方法
    * @return  网络请求字符串
    * @throws Exception
    */
   public static String net(String strUrl, Map<String, Object> params,String method) throws Exception {
       HttpURLConnection conn = null;
       BufferedReader reader = null;
       String rs = null;
       try {
           StringBuffer sb = new StringBuffer();
           if(method==null || method.equals("GET")){
               strUrl = strUrl+"?"+urlencode(params);
           }
           URL url = new URL(strUrl);
           conn = (HttpURLConnection) url.openConnection();
           if(method==null || method.equals("GET")){
               conn.setRequestMethod("GET");
           }else{
               conn.setRequestMethod("POST");
               conn.setDoOutput(true);
           }
           conn.setRequestProperty("User-agent", userAgent);
           conn.setUseCaches(false);
           conn.setConnectTimeout(DEF_CONN_TIMEOUT);
           conn.setReadTimeout(DEF_READ_TIMEOUT);
           conn.setInstanceFollowRedirects(false);
           conn.connect();
           if (params!= null && method.equals("POST")) {
               try {
                   DataOutputStream out = new DataOutputStream(conn.getOutputStream());
                       out.writeBytes(urlencode(params));
               } catch (Exception e) {
                   // TODO: handle exception
               }
           }
           InputStream is = conn.getInputStream();
           reader = new BufferedReader(new InputStreamReader(is, DEF_CHATSET));
           String strRead = null;
           while ((strRead = reader.readLine()) != null) {
               sb.append(strRead);
           }
           rs = sb.toString();
       } catch (IOException e) {
           e.printStackTrace();
       } finally {
           if (reader != null) {
               reader.close();
           }
           if (conn != null) {
               conn.disconnect();
           }
       }
       return rs;
   }

   //将map型转为请求参数型
   public static String urlencode(Map<String,Object>data) {
       StringBuilder sb = new StringBuilder();
       for (Map.Entry i : data.entrySet()) {
           try {
               sb.append(i.getKey()).append("=").append(URLEncoder.encode(i.getValue()+"","UTF-8")).append("&");
           } catch (UnsupportedEncodingException e) {
               e.printStackTrace();
           }
       }
       return sb.toString();
   }

	@Override
	public void updateBakById(OrderDTO dto) {
		OrderDAO.updateBakById(dto);
	}

	@Override
	public List<OrderDTO> getStatusOrder(String status, Integer pageno) {
		return OrderDAO.getPayedOrder(status, pageno);
	}

	@Override
	public int getStatusOrderCount(String status) {
		return OrderDAO.getStatusOrderCount(status);
	}

	@Override
	public List<CompanyDTO> getCompanyList(Integer pageno) {
		return OrderDAO.getCompanyList(pageno);
	}

	@Override
	public Integer getCompanyCount() {
		return OrderDAO.getCompanyCount();
	}

	@Override
	public void insertCompany(CompanyDTO dto) {
		OrderDAO.insertCompany(dto);
	}

	@Override
	public void updateCompanyById(CompanyDTO dto) {
		OrderDAO.updateCompanyById(dto);
	}

	@Override
	public void deleteCompanyById(Integer id) {
		OrderDAO.deleteCompanyById(id);
	}

	@Override
	public CompanyDTO getCompanyById(Integer id) {
		return OrderDAO.getCompanyById(id);
	}

	@Override
	public void updateOrderStatus(Integer orderId, String orderStatus) {
		OrderDAO.updateOrderStatus(orderId, orderStatus);
	}
	
}
