package com.posco.ict.hp.common.util;

import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class CustomBasicDataSource extends BasicDataSource {

	public synchronized void setConnectionProperties(Properties props) {
		this.connectionProperties = props;
	}

	public synchronized Properties getConnectionProperties() {
		return super.connectionProperties;
	}
}
