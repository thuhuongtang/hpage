/*==============================================================================
 * Copyright(c) 2014 POSCO/POSCOICT
 *
 * @ProcessChain 		: L08
 * @File 				: PictvnHpWebSearch.java
 * @FileName 			: Common web search
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

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.vo.PosParameter;
import com.posdata.glue.dao.vo.PosRowSet;

/**
 * This is the class that execute search for a web page
 */
public class PictvnHpWebSearch extends PictvnHpActivity {

	@Override
	public String runActivity(PosContext ctx) {

		String sqlkey = getProperty("sqlkey");
		PosGenericDao localPosGenericDao = getDao(getProperty("dao"));
		
		List listBindings = getBindingNames(localPosGenericDao, sqlkey);
		try {
			logger.logInfo(new StringBuffer("Binding list size").append(" : ").append(listBindings.size()).toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			logger.logInfo(e.getMessage());
		}		

		PosParameter param = new PosParameter();
		param =	makePosParameter(ctx, listBindings);
		
		PosRowSet rowSet = null;
		
		rowSet = localPosGenericDao.find(sqlkey, param);
		logger.logInfo("Found row count : " + ((rowSet == null) ? 0 : rowSet.count()));
		
		// Store result
		ctx.setRowSet(getProperty("resultkey"), rowSet);
		
		return "success";
	}
}
