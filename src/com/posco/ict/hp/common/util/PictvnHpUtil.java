/**
 * 
 */
package com.posco.ict.hp.common.util;

import com.posdata.glue.dao.vo.PosRowSet;

/**
 * @author Tang Thu Huong
 *
 */
public class PictvnHpUtil {
	
	public static boolean isEmptyRs(PosRowSet rs) {
		boolean isEmpty = false;
		
		if(rs == null) {
			isEmpty = true;
		
		} else if(rs.count() < 1) {
			isEmpty = true;
		}
		
		return isEmpty;
	}
	
	public static void main(String[] args) {
				
//		System.out.println(PictvnHpUtil.addDate(Calendar.getInstance().getTime(), 2));
	}
}
