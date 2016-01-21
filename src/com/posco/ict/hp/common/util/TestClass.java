/*** Eclipse Class Decompiler plugin, copyright (c) 2012 Chao Chen (cnfree2000@hotmail.com) ***/
package com.posco.ict.hp.common.util;

import com.posdata.glue.PosException;
import com.posdata.glue.bean.PosBeanFactory;
import com.posdata.glue.bean.PosBeanFactoryImpl;
import com.posdata.glue.cache.PosCacheManagerJCS;
import com.posdata.glue.context.PosContext;
import com.posdata.glue.dao.vo.PosAuditAttributes;
import com.posdata.glue.dao.vo.PosCursorBasedRowSet;
import com.posdata.glue.dao.vo.PosRowSet;
import com.posdata.glue.msg.PosMessage;
import com.posdata.glue.util.log.PosLog;
import com.posdata.glue.util.log.PosLogFactory;
import com.posdata.glue.web.control.PosMultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.MissingResourceException;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Set;

public class TestClass extends PosContext {
	private static final long serialVersionUID = 1L;
	private Map a;
	private Map b;
	private Map c;
	private PosMultipartRequest d;
	private static PosLog e = PosLogFactory.getLogger(PosContext.class);
	private static Properties f = System.getProperties();
	private static Properties g = null;
	private static Properties h;
	private static Map i = new HashMap(5);
	private PosAuditAttributes j;
	private String k;
	private String[] l;
	private Throwable m;
	private PosMessage n;
	private PosMessage[] o;
	private static Locale p = null;
	private static Locale q = null;
	private boolean r;
	private boolean s;

	

	public static void reloadGlueProperties() {
		FileInputStream localFileInputStream = null;
		try {
			String str1 = getConfigPath();
			localFileInputStream = new FileInputStream(new File(
					new File(str1).getPath() + File.separator
							+ "glue.properties"));
			g.clear();
			g = new Properties();
			g.load(localFileInputStream);
			e.logInfo("re-Loaded glue properties count: " + g.size());
			e.logInfo(g);

			String str2 = g.getProperty("glue.custom.property");
			h.clear();
			h = new Properties();
			if (str2 == null) {
				e.logInfo("Does not exist custom property file: " + str2);
			} else {
				try {
					localFileInputStream = new FileInputStream(new File(str2));
					h.load(localFileInputStream);
					e.logInfo("Loaded custom properties count: " + h.size());
					e.logInfo(h);
				} catch (Exception localException4) {
					e.logInfo(localException4.getMessage());
				}
			}

			String str3 = g.getProperty("default.ui.locale");
			String[] arrayOfString;
			if (str3 != null) {
				arrayOfString = str3.split("_");
				if ((arrayOfString != null) && (arrayOfString.length > 1)) {
					p = new Locale(arrayOfString[0], arrayOfString[1]);
					e.logInfo("Set Default UI Locale is " + p);
				} else {
					e.logInfo("Check Default UI Locale Info at glue.properties(default.ui.locale)! current : "
							+ str3);
				}
			}
			str3 = g.getProperty("default.msg.locale");
			if (str3 != null) {
				arrayOfString = str3.split("_");
				if ((arrayOfString != null) && (arrayOfString.length > 1)) {
					q = new Locale(arrayOfString[0], arrayOfString[1]);
					e.logInfo("Set Default Message Locale is " + q);
				} else {
					e.logInfo("Check Default Message Locale Info at glue.properties(default.msg.locale)! current : "
							+ str3);
				}
			}
		} catch (Exception localException3) {
			//e.logInfo(localException2.getMessage());
		} finally {
			if (localFileInputStream != null) {
				try {
					localFileInputStream.close();
				} catch (Exception localException5) {
				}
			}
		}
	}

	public static String getGlueProperty(String paramString) {
		String str = null;
		if (g != null) {
			str = g.getProperty(paramString);
		}
		return str;
	}

	public static String getSystemProperty(String paramString) {
		return f.getProperty(paramString);
	}

	public static String getServerHostName() {
		return g.getProperty("host.name");
	}

	public static String getConfigPath() {
		return f.getProperty("CONFIG_PATH");
	}

	public static PosBeanFactory getBeanFactory() {
		ClassLoader localClassLoader = Thread.currentThread()
				.getContextClassLoader();
		Object localObject = (PosBeanFactory) i.get(localClassLoader);
		if (localObject == null) {
			localObject = new PosBeanFactoryImpl();
			i.put(localClassLoader, localObject);
		}
		return ((PosBeanFactory) localObject);
	}

	public void setMultiPartRequest(PosMultipartRequest paramPosMultipartRequest) {
		this.d = paramPosMultipartRequest;
	}

	public PosMultipartRequest getMultiPartRequest() {
		return this.d;
	}

	public void setRequestParameters(Map paramMap) {
		this.a = paramMap;
	}

	public void setSessionAttr(Map paramMap) {
		this.c = paramMap;
	}

	public void setSessionUserData(String paramString, Object paramObject) {
		if (this.c != null) {
			this.c.put(paramString, paramObject);
		} else
			throw new PosException("Session not exist!");
	}

	public Object getSessionUserData(String paramString) {
		if (this.c != null) {
			return this.c.get(paramString);
		}

		return null;
	}

	public void setRequestAttr(Map paramMap) {
		this.b = paramMap;
	}

	public Map getAllRequestParameters() {
		return this.a;
	}

	public Map getAllSessionAttrs() {
		return this.c;
	}

	public Map getAllRequestAttrs() {
		return this.b;
	}

	public String[] findRequestParam(Object paramObject) {
		String[] arrayOfString = null;
		if (this.a != null) {
			arrayOfString = (String[]) (String[]) this.a.get(paramObject);
		}
		return arrayOfString;
	}

	public Object findSessionAttr(Object paramObject) {
		return this.c.get(paramObject);
	}

	public Object findRequestAttr(Object paramObject) {
		return this.b.get(paramObject);
	}

	public Object get(Object paramObject) {
		Object localObject = super.get(paramObject);
		if ((localObject == null) && (this.b != null)) {
			localObject = this.b.get(paramObject);
			if ((localObject == null) && (this.a != null)) {
				localObject = this.a.get(paramObject);
			}
		}
		return localObject;
	}

	public Object put(Object paramObject1, Object paramObject2) {
		return super.put(paramObject1, paramObject2);
	}

	public PosMessage getMessage() {
		return this.n;
	}

	public void setMessage(PosMessage paramPosMessage) {
		this.n = paramPosMessage;
	}

	public PosRowSet getRowSet(Object paramObject) {
		PosRowSet localPosRowSet = (PosRowSet) super.get(paramObject);
		return localPosRowSet;
	}

	public void setRowSet(Object paramObject, PosRowSet paramPosRowSet) {
		super.put(paramObject, paramPosRowSet);
	}

	public String[] getShowMessage() {
		return this.l;
	}

	public Throwable getException() {
		return this.m;
	}

	public void setShowMessage(String[] paramArrayOfString) {
		this.l = paramArrayOfString;
	}

	public void setException(Throwable paramThrowable) {
		this.m = paramThrowable;
	}

	public String getExceptionMessage() {
		return ((this.m != null) ? this.m.getMessage() : null);
	}

	public PosMessage[] getMessages() {
		return this.o;
	}

	public void setMessages(PosMessage[] paramArrayOfPosMessage) {
		this.o = paramArrayOfPosMessage;

		this.n = paramArrayOfPosMessage[0];
	}

	public String getMessagesFileName() {
		return this.k;
	}

	public void setMessagesFileName(String paramString) {
		this.k = paramString;
	}

	public void setAuditAttribute(PosAuditAttributes paramPosAuditAttributes) {
		this.j = paramPosAuditAttributes;
	}

	public PosAuditAttributes getAuditAttribute() {
		return this.j;
	}

	public static String getCustomProperty(String paramString) {
		return h.getProperty(paramString);
	}

	public void setEdgeServerEvent() {
		this.r = true;
	}

	public boolean isEdgeServerEvent() {
		return this.r;
	}

	public static String getResourceMessage(String paramString1,
			String paramString2, Object[] paramArrayOfObject, Locale paramLocale) {
		if (paramLocale == null) {
			paramLocale = Locale.getDefault();
		}
		PosCacheManagerJCS localPosCacheManagerJCS = (PosCacheManagerJCS) getBeanFactory()
				.getBeanObject("cacheManager");
		String str = (String) localPosCacheManagerJCS.getCacheObject(
				paramString2 + paramLocale.toString(), "region-user-message");

		if (str == null) {
			if (paramString1 == null) {
				throw new NullPointerException("Resource File Name is null");
			}

			ResourceBundle localResourceBundle = ResourceBundle.getBundle(
					paramString1, paramLocale, Thread.currentThread()
							.getContextClassLoader());
			try {
				str = localResourceBundle.getString(paramString2);
			} catch (MissingResourceException localMissingResourceException) {
				e.logError(paramString1 + "_" + paramLocale.toString()
						+ ".properties do not have the key " + paramString2);
			}
			if (str == null) {
				return null;
			}
			localPosCacheManagerJCS.putCacheObject(
					paramString2 + paramLocale.toString(), str,
					"region-user-message");
		}
		if (paramArrayOfObject == null) {
			return str;
		}

		return formatMessage(str, paramArrayOfObject);
	}

	public static String formatMessage(String paramString,
			Object[] paramArrayOfObject) {
		String str = MessageFormat.format(paramString, paramArrayOfObject);
		return str;
	}

	public Locale getUserLocale() {
		Locale localLocale = null;
		if (this.c != null) {
			localLocale = (Locale) this.c.get("UserUILocale");
		}
		return localLocale;
	}

	public static Locale getDefaultUILocale() {
		return p;
	}

	public static Locale getLogMsgLocale() {
		if (q == null) {
			q = Locale.getDefault();
		}
		return q;
	}

	public static Locale getSystemLocale() {
		return Locale.getDefault();
	}

	

	public void clearCursorBasedRowset() {
		for (Iterator localIterator = entrySet().iterator(); localIterator
				.hasNext();) {
			Map.Entry localEntry = (Map.Entry) localIterator.next();
			Object localObject = localEntry.getValue();
			if (localObject instanceof PosCursorBasedRowSet) {
				((PosCursorBasedRowSet) localObject).clear();
				if (e.isDebugEnabled())
					e.logDebug("PosCursorBasedRowSet is removed.. ["
							+ localEntry.getKey() + "]");
			}
		}
	}

	public boolean isThrowedException() {
		return this.s;
	}

	public void registerExceptionEvent(Throwable paramThrowable) {
		this.s = (paramThrowable != null);
	}

	
}