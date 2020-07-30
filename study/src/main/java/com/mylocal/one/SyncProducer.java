package com.mylocal.one;

/**
 * @Auther: liwei
 * @Date: 2020/07/03/下午3:27
 * @Description:
 */

import org.apache.rocketmq.client.producer.DefaultMQProducer;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.Message;
import org.apache.rocketmq.remoting.common.RemotingHelper;

public class SyncProducer {
    public static void main(String[] args) throws Exception {

        // 实例化 producer，指定一个唯一的组名
        DefaultMQProducer producer = new
                DefaultMQProducer("please_rename_unique_group_name");

        // 指定 name server 地址
        producer.setNamesrvAddr("10.32.64.13:9876");

        // 启动 producer
        producer.start();

        for (int i = 0; i < 100; i++) {

            // 创建消息实例, 指定 topic, tag 和 message
            Message msg = new Message("TopicTest",
                    "TagA",
                    ("Hello RocketMQ " +
                            i).getBytes(RemotingHelper.DEFAULT_CHARSET)
            );

            // 发送消息，同步方式，等待返回结果
            SendResult sendResult = producer.send(msg);
            System.out.printf("%s%n", sendResult);
        }

        // 关闭
        producer.shutdown();
    }
}