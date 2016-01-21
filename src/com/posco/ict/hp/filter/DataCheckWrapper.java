package com.posco.ict.hp.filter;

import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.vo.PosRow;
import com.posdata.glue.dao.vo.PosRowSet;

public class DataCheckWrapper extends HttpServletRequestWrapper {
	private PosRow row = null;
    
	public DataCheckWrapper(HttpServletRequest request) {
		super(request);
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		if (ctx != null) {
			PosGenericDao dao = (PosGenericDao) ctx.getBean("dao");
			if (dao != null) {
				System.out.println("I've got a DAO ^_^");
				String uri = getRequestURI();
				uri = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
				String sql = "select * from web_pages where request_uri = '" + uri + "'";
				System.out.println("sql : " + sql);
				PosRowSet rs = dao.findByQueryStatement(sql);
				if (rs != null) {
					System.out.println("row set count : " + rs.count());
					if (rs.hasNext()) {
						row = rs.next();
					}
				}
			}
		}
	}

	@Override
	public String getParameter(String paramName) {
		String value = super.getParameter(paramName);
		System.out.println(paramName + " : " + value);
		if ("ServiceName".equals(paramName)) {
			if (value == null) {
				if (row != null) {
					value = (String) row.getAttribute("service_name");
				}
			}
		} else if ("content_tp".equals(paramName)) {
			if (value == null) {
				if (row != null) {
					value = (String) row.getAttribute("content_tp");
				}
			}
		}

		return value;
	}

	@Override
	public String[] getParameterValues(String paramName) {
		String[] values = super.getParameterValues(paramName);

		if ("ServiceName".equals(paramName)) {
			if (values == null) {
				if (row != null) {
					values = new String[] { (String) row
							.getAttribute("service_name") };
				}
			}
		} else if ("content_tp".equals(paramName)) {
			if (values == null) {
				if (row != null) {
					values = new String[] { (String) row
							.getAttribute("param_value_1") };
				}
			}
		}

		return values;
	}

	@Override
	public Enumeration<String> getParameterNames() {
		return Collections.enumeration(getParameterMap().keySet());
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		Map<String, String[]> params = new HashMap<String, String[]>();
		Map<String, String[]> originalParams = super.getParameterMap();

		for (Object o : originalParams.entrySet()) {
			Map.Entry<String, String[]> pairs = (Map.Entry<String, String[]>) o;
			params.put(pairs.getKey(), pairs.getValue());
		}

		if (!params.containsKey("content_tp")) {
			String aVal = (String) ((row != null) ? row
					.getAttribute("param_value_1") : "");
			System.out.println("a val " + aVal);
			params.put("content_tp", new String[] { aVal });
		} else {
			String[] paramVal = params.get("content_tp");
			System.out.println("param val : " + paramVal[0]);
			if ("".equals(paramVal[0])) {
				paramVal[0] = (String) ((row != null) ? row.getAttribute("param_value_1") : "");
				params.put("content_tp", paramVal);
			}
		}

		return params;
	}
}
