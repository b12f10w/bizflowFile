package com.addon.bizflow.db;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;

public class SqlMapConfig {
    public static SqlSessionFactory sqlSession;

    static {
        String resource = "com/addon/bizflow/db/bizflowConfiguration.xml";
        Reader reader;

        try {
            reader = Resources.getResourceAsReader(resource);
            sqlSession = new SqlSessionFactoryBuilder().build(reader);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    public static SqlSessionFactory getSqlSession() {
        return sqlSession;
    }
}
