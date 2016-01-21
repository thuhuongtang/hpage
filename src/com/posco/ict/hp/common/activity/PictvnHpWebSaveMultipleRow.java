package com.posco.ict.hp.common.activity;



import com.posdata.glue.biz.activity.PosServiceParamIF;
import com.posdata.glue.biz.constants.PosBizControlConstants;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;

public class PictvnHpWebSaveMultipleRow  extends PictvnHpActivity{
	public String runActivity(PosContext ctx) {

		// Get input values
		PosGenericDao dao = this
				.getDao(this.getProperty(PosServiceParamIF.DAO));	
		 String [] chkArr = (String [])ctx.get("chk");
		 String [] usrId = (String [])ctx.get("empUpdate");
		 String [] usrNmArr = (String [])ctx.get("usrId_h");
		
		 
		
		 if(chkArr!=null){
			 for(int i=0;i<chkArr.length;i++)
			 logger.logInfo("chkArr+++++++++++++++++++++++++++"+i+"value:"+chkArr[i]);
			 
		 }
		 logger.logInfo("**************************************************");
		 if(usrNmArr!=null){
			 for(int i=0;i<usrNmArr.length;i++)
			 logger.logInfo("usrNmArr+++++++++++++++++++++++++++"+i+"value:"+usrNmArr[i]);
			 
		 }
		 logger.logInfo("**************************************************");
		 if(usrId!=null){
			 logger.logInfo("usrId class+++++++++++++++++++++++++++"+ctx.get("empUpdate").getClass());					 
			 for(int i=0;i<usrId.length;i++)
			 logger.logInfo("usrId+++++++++++++++++++++++++++"+i+"value:"+usrId[i]);
			 
		 }
		
		  
		
	
		return PosBizControlConstants.SUCCESS;
	}

}


