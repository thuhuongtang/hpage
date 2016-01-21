/*==============================================================================
 * Copyright(c) 2014 POSCO/POSCOICT
 *
 * @ProcessChain 		: L08
 * @File 				: PictvnHpWebSearchPaging.java
 * @FileName 			: Search Paging
 * Open Issues 			:
 * Change History
 * @LastModifyDate 		: 20140616
 * @Author 				: Tang Thu Huong
 * @LastModifier 		: Tang Thu Huong
 * @LastVersion 			: 0.1
 *  2014-06-16	 Tang Thu Huong	 0.1	Initial Creation
 *  
 *=============================================================================*/

package com.posco.ict.hp.common.activity;

import java.util.List;

import com.posco.ict.hp.common.util.PictvnHpStringUtil;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.vo.PosParameter;
import com.posdata.glue.dao.vo.PosRowSet;

/**
 * This is the class that executes search paging.
 */
public class PictvnHpWebSearchPaging extends PictvnHpActivity {

	public String runActivity(PosContext ctx) {

		PosGenericDao dao = getDao(getProperty("dao"));
		String sqlkey = getProperty("sqlkey");
		PosParameter param = new PosParameter();
		
		List bindings = getBindingNames(dao, sqlkey);
		logger.logInfo(new StringBuffer("listBindings").append(" : ").append(bindings.size()).toString());		
		
		param=	makePosParameter(ctx, bindings);
		
		String sPageSize = getProperty("page-size");
		String sCurPage = getProperty("cur-page");
		
		int pageSize = 5;
		int curPage = 1;
		PosRowSet rowSet = null;

		if (sPageSize != null) {
			pageSize = Integer.parseInt(sPageSize);
		}

		if (sCurPage != null) {
			curPage = Integer.parseInt(sCurPage);
		} else {
			curPage = Integer.parseInt(ctx.get("nPage") == null ? "1" : ((String[])ctx.get("nPage"))[0]);
		}
		logger.logInfo("=================>pageSize : " + pageSize);
		logger.logInfo("=================>curPage : " + curPage);
		
		rowSet = dao.findForNavigationPage(sqlkey, param, pageSize, curPage);
		
		PosRowSet rowSet2 = dao.find(sqlkey, param);
		int total = rowSet2.count();
		int totalPage = total % pageSize;
		if(totalPage > 0) {
			totalPage = total / pageSize + 1;
		} else {
			totalPage = total / pageSize;
		}
		
		if(rowSet!=null){
			logger.logInfo("=================>Result search paging found : " + rowSet.count());			
		}
		
		logger.logInfo("=================>Total page : " + totalPage);			
		
		
		ctx.setRowSet(getProperty("resultkey"), rowSet);
		ctx.put("totalPage", totalPage);
		
		return "success";
	}

}
