//package cn.teamwang.nacos.discovery;
//
//import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
//import com.alibaba.cloud.nacos.ribbon.NacosServer;
//import com.alibaba.nacos.api.exception.NacosException;
//import com.alibaba.nacos.api.naming.pojo.Instance;
//import com.netflix.client.config.IClientConfig;
//import com.netflix.loadbalancer.AbstractLoadBalancerRule;
//import com.netflix.loadbalancer.BaseLoadBalancer;
//import com.netflix.loadbalancer.Server;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//
///**
// * @author Jacky
// * Date: 2020/8/29 23:35
// */
//@Configuration
//@Slf4j
//public class NacosWeightRule extends AbstractLoadBalancerRule {
//
//    @Autowired
//    private NacosDiscoveryProperties nacosDiscoveryProperties;
//
//    @Override
//    public void initWithNiwsConfig(IClientConfig iClientConfig) {
//    }
//
//    /**
//     * 服务名->服务实例->服务
//     */
//    @Override
//    public Server choose(Object o) {
//        BaseLoadBalancer loadBalancer = (BaseLoadBalancer) this.getLoadBalancer();
//        String serviceName = loadBalancer.getName();
//
//        try {
//            // 基于 nacos 权重的负载均衡算法
//            Instance serviceInstance = nacosDiscoveryProperties.namingServiceInstance().selectOneHealthyInstance(serviceName);
//            return new NacosServer(serviceInstance);
//        } catch (NacosException e) {
//            e.printStackTrace();
//            log.error(e.getErrMsg());
//            return null;
//        }
//
//    }
//}
