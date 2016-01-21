package com.posco.ict.hp.resource;

import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

import com.posdata.glue.util.log.PosLog;
import com.posdata.glue.util.log.PosLogFactory;

public class Text {
	private static PosLog logger = PosLogFactory.getLogger(Text.class);
	
	public static String getText(String baseName, String key, String format,
			Locale locale) {
		
		logger.logInfo("=====================> baseName, key : " + baseName + ", " + key);
		
		String text = "";
		
		try {
			ResourceBundle resourceBundle = PropertyResourceBundle.getBundle(
					baseName, locale, new Utf8Control());
			text = resourceBundle.getString(key);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return text;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String baseName="HPResource";
		System.out.println(getText(baseName, "index000", null, new Locale("en", "US")));
		System.out.println(getText(baseName, "index001", null, new Locale("en", "US")));
		System.out.println(getText(baseName, "menu000", null, Locale.KOREA));
	}

}
