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

/**
 * This is the class that execute insert, update, delete command Input : a
 * form, kinds of queries (I: Insert, U: Update, D: Delete) Output : count of
 * executed rows
 */
public class PictvnHpWebSave extends PictvnHpActivity {

	public String runActivity(PosContext ctx) {

		// Get input values
		PosGenericDao dao = this
				.getDao(this.getProperty(PosServiceParamIF.DAO));
		String resultKey = getProperty(PosServiceParamIF.RESULT_KEY, "saveCnt");

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
		if (insertSql != null)

			saveCnt += dao.insert(insertSql,
					makePosParameter(ctx, insertBindings));
		
		// Execute UPDATE query
		if (updateSql != null)
			saveCnt += dao.update(updateSql,
					makePosParameter(ctx, updateBindings));
		// Execute DELETE query
		if (deleteSql != null)
			saveCnt += dao.delete(deleteSql,
					makePosParameter(ctx, deleteBindings));

		// Store result
		ctx.put(resultKey, saveCnt);
		logger.logInfo("result save=========="+saveCnt);

		return PosBizControlConstants.SUCCESS;
	}

}
