package com.bohua.test.util;


import com.bh.train.common.rabbit.MessageProducer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by zhuyy on 2016/11/22.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml",
        "classpath:mybatis/spring-mybatis.xml"})
public class RabbitMqCase {

    @Resource
    private MessageProducer messageProducer;

    @Test
    public void sendMsgTest() {
        String str = "MQ测试！";
        messageProducer.sendMessage(str);
    }

}
