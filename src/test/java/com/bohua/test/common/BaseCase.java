package com.bohua.test.common;

import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.lang.reflect.ParameterizedType;

/**
 * Created by zhuyy on 2016/11/23.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml",
        "classpath:mybatis/spring-mybatis.xml"})
public class BaseCase<T> {

    private   Class<T> cls;

    protected Logger logger;

    {
        ParameterizedType type = (ParameterizedType) getClass() .getGenericSuperclass();
        cls = (Class<T>) type.getActualTypeArguments()[0];
        logger = Logger.getLogger(cls);
    }
}
