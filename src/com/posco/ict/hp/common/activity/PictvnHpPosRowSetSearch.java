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

import com.posco.ict.hp.common.util.PictvnHpStringUtil;
import com.posco.ict.hp.common.util.PictvnHpUtil;
import com.posdata.glue.biz.activity.PosServiceParamIF;
import com.posdata.glue.biz.constants.PosBizControlConstants;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.vo.PosParameter;
import com.posdata.glue.dao.vo.PosRowSet;

/**
 * @author Huong
 * Parameter List : p1:p1_v;p2:p2_v;...
 * pn_v is constant value or a value of web page 
 */
public class PictvnHpPosRowSetSearch extends PictvnHpActivity {

	public String runActivity(PosContext ctx) {

		// Get input values
		PosGenericDao dao = this.getDao(this.getProperty(PosServiceParamIF.DAO));
		PosRowSet bindResult = ctx.getRowSet(getProperty("bind-result"));
		
		// Query params
		String sqlkey = this.getProperty(PosServiceParamIF.SQLKEY);
		List bindings = getBindingNames(dao, sqlkey);
		
		String resultkey = this.getProperty(PosServiceParamIF.RESULT_KEY);
		PosRowSet rs = null;
		
		// Execute find query
		if (sqlkey != null) {
			
			rs = dao.find(sqlkey, makeCusParameter(ctx, bindings, bindResult, dao));
		}	
		
		// Store result
		ctx.put(resultkey, rs);
		logger.logInfo("Result search count==========>" + (PictvnHpUtil.isEmptyRs(rs) ? 0 : rs.count()));

		return PosBizControlConstants.SUCCESS;
	}

	/**
	 * This method makes a custom parameter.
	 * @param ctx
	 * @param bindings
	 * @param rs
	 * @param dao
	 * @return
	 */
	private PosParameter makeCusParameter(PosContext ctx, List bindings, PosRowSet rs, PosGenericDao dao) {
		
		PosParameter params = makePosParameter(ctx, bindings, rs);
		
		String sParamCnt = getProperty("param-count");
		int paramCnt = Integer.parseInt(sParamCnt);
		
		if(paramCnt > 0) {
			String[] paramValues = getProperty("param-value").split(";");

			for (int i = 0; i < paramCnt; i++) {
			
				String[] paramValue = paramValues[i].split(":");
				Object objVal = paramValue[1]; // Parameter is a constant
				
				if(paramValue[1].startsWith("#")) { // Param is retrieved from web page
					objVal = ctx.get(paramValue[1].substring(1));
				}
				
				params.setNamedParamter(paramValue[0], objVal);
				
				logger.logInfo("Custom parameter =====>" + paramValue[0] + " : " + PictvnHpStringUtil.customToString(objVal));
			}
		}
		
		return params;
	}
}
