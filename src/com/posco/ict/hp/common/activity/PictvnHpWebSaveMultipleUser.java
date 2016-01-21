package com.posco.ict.hp.common.activity;

import com.posco.ict.hp.common.util.PictvnHpStringUtil;
import com.posdata.glue.biz.activity.PosServiceParamIF;
import com.posdata.glue.biz.constants.PosBizControlConstants;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.vo.PosParameter;

public class PictvnHpWebSaveMultipleUser extends PictvnHpActivity {
	public String runActivity(PosContext ctx) {
		PosGenericDao dao = this
				.getDao(this.getProperty(PosServiceParamIF.DAO));
		String resultKey = getProperty(PosServiceParamIF.RESULT_KEY, "saveCnt");
		// Get input values
		String[] chkArr = (String[]) ctx.get("chk");
		String[] USR_NM = (String[]) ctx.get("USR_NM_S");
		String[] USR_DPT_NM = (String[]) ctx.get("USR_DPT_NM_S");
		String[] USR_TEL_NO = (String[]) ctx.get("USR_TEL_NO_S");
		String[] USR_PSTN = (String[]) ctx.get("USR_PSTN_S");
		String[] USR_IDX = (String[]) ctx.get("USR_IDX_S");
		if (USR_NM != null) {
			logger.logInfo("USR_NM==========++++++++++++++++=="
					+ USR_NM.toString());

		}
		int index;
		int saveCnt = 0;
		String updateSql = this.getProperty(L08_UPDATE_SQLKEY);
		PosParameter param = new PosParameter();
		String deleteSql = this.getProperty(L08_DELETE_SQLKEY);
		if (chkArr != null) {
			for (int i = 0; i < chkArr.length; i++) {
				String in = chkArr[i];
				if (in != "" || in != null) {
					index = PictvnHpStringUtil.convertStrToInt(in, 0);
					if (updateSql != null) {
						
						param.setNamedParamter("USR_NM_S", USR_NM[index]);
						param.setNamedParamter("USR_IDX", USR_IDX[index]);
						param.setNamedParamter("USR_DPT_NM_S",
								USR_DPT_NM[index]);
						param.setNamedParamter("USR_TEL_NO_S",
								USR_TEL_NO[index]);
						param.setNamedParamter("USR_PSTN_S", USR_PSTN[index]);
						saveCnt += dao.update(updateSql, param);
						
					}
					if (deleteSql != null) {
						param.setNamedParamter("USR_IDX", USR_IDX[index]);
						saveCnt += dao.delete(deleteSql, param);
					}
					
				}

			}

		}
		logger.logInfo("result save==========" + saveCnt);


		return PosBizControlConstants.SUCCESS;
	}

}
