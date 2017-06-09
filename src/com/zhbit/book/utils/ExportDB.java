package com.zhbit.book.utils;

import java.sql.Timestamp;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;


public class ExportDB {
	public static void main(String[] args) {
		Configuration con = new Configuration().configure();
		
		SchemaExport export = new SchemaExport(con);

		export.create(true, true);
	}
	
	
	
	
}
