/*==============================================================================
 * Copyright(c) 2014 POSCO/POSCOICT
 *
 * @ProcessChain 		: L08
 * @File 				: PictvnHpActivity.java
 * @FileName 			: Common activity
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

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.posco.ict.hp.common.constant.PictvnHpConstantIF;
import com.posco.ict.hp.common.util.PictvnHpStringUtil;
import com.posdata.glue.PosException;
import com.posdata.glue.biz.activity.PosActivity;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.PosGenericDao;
import com.posdata.glue.dao.PosQueryStringHelper;
import com.posdata.glue.dao.manager.PosQueryDefinition;
import com.posdata.glue.dao.vo.PosParameter;
import com.posdata.glue.dao.vo.PosRowSet;
import com.posdata.glue.msg.PosMessage;

public abstract class PictvnHpActivity extends PosActivity implements
		PictvnHpConstantIF {

	/**
	 * The method returns a list of named parameter
	 * 
	 * @param dao
	 * @param queryId
	 * @return
	 */
	protected List getBindingNames(PosGenericDao dao, String queryId) {

		List res = null;

		if (!PictvnHpStringUtil.isEmpty(queryId)) {

			PosQueryDefinition def = dao.getQueryManager().getQueryDefinition(
					queryId);

			if (def == null) {
				logger.logFatal(new StringBuffer("[").append(queryId)
						.append("doesn't exist").toString());

			} else if (def.isIncludedNamedParameter()) {
				if (def.getNamedParameter() == null) {
					def = PosQueryStringHelper.createQueryDefinition(def,
							def.getQueryStatement(true));
				}

				res = def.getNamedParameter();

			} else {
				throw new PosException(
						"Check Query Definition. [isNamed=\"true\"]");
			}
		}

		return res;
	}

	/**
	 * The method creates a list of binding parameter. It consists of name and
	 * value.
	 * 
	 * @param message
	 * @param nameList
	 * @return PosParameter
	 */
	protected PosParameter makePosParameter(PosMessage message, List nameList) {

		String namedParam = null;
		PosParameter param = new PosParameter();

		for (int i = 0, listSize = nameList.size(); i < listSize; i++) {

			namedParam = (String) nameList.get(i);

			Object bindParam = message.get(namedParam);

			if (bindParam != null && bindParam instanceof String)
				bindParam = ((String) bindParam).trim();

			param.setNamedParamter(namedParam, bindParam);
		}

		return param;
	}

	/**
	 * This method makes a set of named parameter and binding value
	 * 
	 * @param ctx
	 *            PosContext
	 * @param names
	 *            Parameter names
	 * @param inDs
	 *            A Dataset
	 * @param idx
	 *            A row index of a dataset
	 * @return PosParameter
	 */
	protected PosParameter makePosParameter(PosContext ctx, List names) {

		PosParameter param = new PosParameter();
		int size = names.size();

		for (int i = 0; i < size; i++) {
			String namedParam = (String) names.get(i);
			Object bindParam = ctx.get(namedParam);
			// logger.logInfo("aaaa----------------------------------------- : "+ActivityUtil.convObjToStr(bindParam));
			logger.logInfo(new StringBuffer(namedParam).append(" : ")
					.append(PictvnHpStringUtil.customToString(bindParam))
					.toString());

			param.setNamedParamter(namedParam, bindParam);
		}

		return param;
	}

	/**
	 * This method makes parameter depend on PosRowSet
	 */
	protected PosParameter makePosParameter(PosContext ctx, List names,
			PosRowSet posRowSet) {

		PosParameter param = new PosParameter();
		int size = names.size();

		if (posRowSet != null && posRowSet.count() > 0) {
			for (int i = 0; i < size; i++) {
				String namedParam = (String) names.get(i);
				Object bindParam = posRowSet.getAllRow()[0]
						.getAttribute(namedParam);

				logger.logInfo(new StringBuffer(namedParam).append(" : ")
						.append(PictvnHpStringUtil.customToString(bindParam))
						.toString());

				param.setNamedParamter(namedParam, bindParam);
			}
		}

		return param;
	}

	/**
	 * The method check a column whether it's an audit column.
	 * 
	 * @param columnId
	 * @return true if the column is an audit one
	 */
	protected boolean isAuditColumn(String columnId) {

		if (columnId != null
				&& (AUDIT_OBJECT_TYPE.equals(columnId)
						|| AUDIT_OBJECT_ID.equals(columnId)
						|| AUDIT_PROGRAM_ID.equals(columnId) || AUDIT_TIMESTAMP
							.equals(columnId))) {
			return true;

		} else {
			return false;
		}
	}

	/**
	 * The method prints out each id and value item in the message
	 * 
	 * @param posMessage
	 */
	protected void logPosMessage(PosMessage posMessage) {
		Map rcvMsgMap = posMessage.getAttributes();
		Iterator iter = rcvMsgMap.keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			Object value = rcvMsgMap.get(key);

			logger.logInfo("===========>[key, value] = " + "[" + key + ", "
					+ value + "]");

		}
	}

	/**
	 * The method gets a property value. If the value is null, return default
	 * one. Otherwise, return the value.
	 * 
	 * @param propertyKey
	 * @param defaultValue
	 * @return
	 */
	protected String getProperty(String propertyKey, String defaultValue) {

		String propertyValue = super.getProperty(propertyKey);

		if (propertyValue != null) {
			return propertyValue;

		} else {
			return defaultValue;
		}
	}

	/**
	 * 
	 * @param propertyKey
	 * @return
	 */
	protected int getIntProperty(String propertyKey) {
		String propertyValue = super.getProperty(propertyKey);

		if (propertyValue != null) {
			return Integer.parseInt(propertyValue);

		} else {
			return -1;
		}
	}

}
