package hxy.ajax.test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

/**
 * Servlet implementation class Test
 */
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.print("ajax的请求");
		
		synYxGoods(response, request);
		
	}
	public void synYxGoods(HttpServletResponse response, HttpServletRequest request) throws IOException {
		// String json = request.getParameter("param"); //这是通过通过get方式去url
		// 拼接的键值对，post方式取不到值。
		request.setCharacterEncoding("UTF-8"); // 返回页面防止出现中文乱码
		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));// post方式传递读取字符流
		String jsonStr = null;
		StringBuilder result = new StringBuilder();
		try {
			while ((jsonStr = reader.readLine()) != null) {
				result.append(jsonStr);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		reader.close();// 关闭输入流
		JSONObject jsonObject = JSONObject.parseObject(result.toString()); // 取一个json转换为对象
		//System.out.format("version:%s\nusername:%s\n", jsonObject.get("version"), jsonObject.get("shopname"));
		//send data to client
		String info="callback data";
		org.json.JSONObject user_data = new org.json.JSONObject();
		user_data.put("key", "today");
		user_data.put("key2", "today4");
		user_data.put("key3", "today2");
		user_data.put("key4", "today3");
		user_data.put("key5", "today5");
		String jsonStr2 = user_data.toString();
		
		
		response.setCharacterEncoding("UTF-8");
		/*
		if ("receive".concat(version).equals(jsonObject.get("version"))) {
			info = DataAnalyze.send(jsonObject);
		}
		// receive data from client
//		else if("send".concat(version).equals(jsonObject.get("version"))) {
		else if("1.17.5".equals(jsonObject.get("version"))) {
			info = DataAnalyze.receive(jsonObject);
		}
		*/
		response.getWriter().append(jsonStr2);
		
		
//		response.getWriter().append("successful!\tServed at: ").append(request.getContextPath());
		// 获取数组的数据

//    ArrayList<Object> aList =  normal.toList();

//    for (int i = 0; i < aList.size(); ++i) {
//      HashMap<String, Object> goods_datas = (HashMap<String, Object>) aList.get(i);
//      Object goods_id = goods_datas.get("goodsid");
//      String goods_name = (String) goods_datas.get("goodsname");
//      String price = (String)goods_datas.get("price");
//      System.out.format("goodsid:%s\t goodsname:%s\t price:%s\n", goods_id, goods_name,price);
//
//    }

		// logger.info(jsonObject);
//	GoodsInfo goodsInfo = new GoodsInfo();
//	Date date = new Date();
//	goodsInfo.setAccess_code1("001");
//	                goodsInfo.setAccess_code1("001");
//	                goodsInfo.setGoodsName(jsonObject.getString("goodsName"));     //通过键取到值，再将值封装到类里面。
//	               goodsInfo.setType(Integer.parseInt(jsonObject.getString("type")));
//	List<ResultData<String>> data = yxGoodsService.synYxGoodsInfo(goodsInfo);
//	String json_str = JSON.toJSONString(data);
//	return write(response, json_str);
	}

}
