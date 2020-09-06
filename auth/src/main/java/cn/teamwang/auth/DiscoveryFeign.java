package cn.teamwang.auth;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jacky
 * Date: 2020/9/5 20:38
 */
@FeignClient(name = "service-provider", configuration = DiscoveryFeign.FeignInterceptor.class)
public interface DiscoveryFeign {

    @GetMapping("/echo/{string}")
    String echo(@PathVariable("string") String string);


    /**
     * 也可改写成:
     *
     * @Bean public xxxIntercetor xxx() {
     * return new xxxIntercetor();
     * }
     */
    class FeignInterceptor implements RequestInterceptor, HandlerInterceptor {
        @Override
        public void apply(RequestTemplate requestTemplate) {
            System.out.println("经过feign拦截器了");

            // 1. 获取 request
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();

            // 2. (feign)传递 token
            requestTemplate.header("Authorization", request.getHeader("Authorization"));
        }

    }
}
