package com.bh.train.common.rabbit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;


/**
 * 功能概要：消息产生,提交到队列中去
 *
 * @author linbingwen
 * @since  2016年1月15日
 */
public class MessageProducer {

    private Logger logger = LoggerFactory.getLogger(MessageProducer.class);

    private AmqpTemplate amqpTemplate;

    public void sendMessage(Object message){
        logger.info("to send message:{}",message);
        amqpTemplate.convertAndSend("queueTestKey",message);
    }

    public AmqpTemplate getAmqpTemplate() {
        return amqpTemplate;
    }

    public void setAmqpTemplate(AmqpTemplate amqpTemplate) {
        this.amqpTemplate = amqpTemplate;
    }
}