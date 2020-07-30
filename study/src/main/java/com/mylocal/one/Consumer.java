package com.mylocal.one;

/**
 * @Auther: liwei
 * @Date: 2020/07/03/下午4:27
 * @Description:
 */

import java.util.List;

import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyContext;
import org.apache.rocketmq.client.consumer.listener.ConsumeConcurrentlyStatus;
import org.apache.rocketmq.client.consumer.listener.MessageListenerConcurrently;
import org.apache.rocketmq.client.exception.MQClientException;
import org.apache.rocketmq.common.message.MessageExt;

public class Consumer {
    public static void main(String[] args) throws InterruptedException, MQClientException {

        // 实例化 consumer，指定 consumer 组名
        DefaultMQPushConsumer consumer = new DefaultMQPushConsumer("please_rename_unique_group_name");

        // 指定 name server
        consumer.setNamesrvAddr("10.32.64.13:9876");

        // 订阅1个或多个topic
        consumer.subscribe("TopicTest", "*");

        // 注册回调，当收到消息时执行
        consumer.registerMessageListener(new MessageListenerConcurrently() {

            @Override
            public ConsumeConcurrentlyStatus consumeMessage(final List<MessageExt> msgs,
                                                            final ConsumeConcurrentlyContext context) {
                System.out.printf("%s Receive New Messages: %s %n", Thread.currentThread().getName(), msgs);

                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
            }
        });

        // 启动 consumer
        consumer.start();

        System.out.printf("Consumer Started.%n");
    }
}