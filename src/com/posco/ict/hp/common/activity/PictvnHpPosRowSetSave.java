/*==============================================================================
 * Copyright(c) 2014 POSCO/POSCOICT
 *
 * @ProcessChain 		: L08
 * @File 				: PictvnHpXPlatformSave.java
 * @FileName 			: Common save method
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

import com.posdata.glue.biz.activity.PosServiceParamIF;
import com.posdata.glue.biz.constants.PosBizControlConstants;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.vo.PosParameter;
import com.posdata.glue.dao.vo.PosRowSet;

/**
 * This is the class that execute insert, update, delete command Input : a
 * form, kinds of queries (I: Insert, U: Update, D: Delete) Output : count of
 * executed rows
 */
public class PictvnHpPosRowSetSave extends PictvnHpActivity {

	public String runActivity(PosContext ctx) {

		// Get input values
		PosGenericDao dao = this.getDao(this.getProperty(PosServiceParamIF.DAO));
		PosRowSet bindResult = ctx.getRowSet(getProperty("bind-result"));
		
//		String resultKey = getProperty(PosServiceParamIF.RESULT_KEY, "saveCnt");

		// Insert params
		String insertSql = this.getProperty(L08_INSERT_SQLKEY);
		List insertBindings = getBindingNames(dao, insertSql);
		
		// Update params
		String updateSql = this.getProperty(L08_UPDATE_SQLKEY);
		List updateBindings = getBindingNames(dao, updateSql);
		
		// Delete params
		String deleteSql = this.getProperty(L08_DELETE_SQLKEY);
		List deleteBindings = getBindingNames(dao, deleteSql);
		
		int saveCnt = 0;

		// Execute INSERT query
		if (insertSql != null) {
			
			saveCnt += dao.insert(insertSql
									, makeCusParameter(ctx, insertBindings, bindResult, dao));
		}	
		
		// Execute UPDATE query
		if (updateSql != null) {
			saveCnt += dao.update(updateSql
									, makeCusParameter(ctx, updateBindings, bindResult, dao));
		}	

		// Execute DELETE query
		if (deleteSql != null) {
			saveCnt += dao.delete(deleteSql
									, makeCusParameter(ctx, deleteBindings, bindResult, dao));
		}	

		// Store result
//		ctx.put(resultKey, saveCnt);
		logger.logInfo("result save=========="+saveCnt);

		return PosBizControlConstants.SUCCESS;
	}

	private PosParameter makeCusParameter(PosContext ctx, List bindings, PosRowSet rs, PosGenericDao dao) {
		
		PosParameter params = makePosParameter(ctx, bindings, rs);
		
		String sParamCnt = getProperty("param-count");
		int paramCnt = Integer.parseInt(sParamCnt);
		
		if(paramCnt > 0) {
			String[] paramValues = getProperty("param-value").split(";");
			for (int i = 0; i < paramCnt; i++) {
				String[] paramValue = paramValues[i].split(":");
				params.setNamedParamter(paramValue[0], paramValue[1]);
				
				logger.logInfo("Custom parameter =====>" + paramValue[0] + " : " + paramValue[1]);
			}
		}
		
		return params;
	}
}
