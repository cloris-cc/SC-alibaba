package cn.teamwang.auth;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 生成和校验 JWT 的工具类
 *
 * @author Jacky
 * Date: 2019/9/26 17:26
 */
@Slf4j
@Component
public class JWTHelper {

    // 应使用配置维护
    private String SECRET = "love";
    private final Algorithm algorithm = Algorithm.HMAC256(SECRET);
    @Value("${jwt.expireTime}")
    public Long expireTime;

    public String generateJWT(Map<String, String> claims) {
        JWTCreator.Builder builder = JWT.create();
        claims.forEach(builder::withClaim);
        return builder
                .withExpiresAt(new Date(System.currentTimeMillis() + expireTime * 1000))
                .sign(algorithm);
    }


    /**
     * 需要处理异常情况+判断是否过期
     */
    public Map<String, String> verifyToken(String jwt) {
        DecodedJWT decodedJWT = JWT.require(algorithm).build().verify(jwt);
        log.info("decodedJWT is : {}", decodedJWT);
        Map<String, Claim> claims = decodedJWT.getClaims();
        Map<String, String> res = new HashMap<>();
        claims.forEach((k, v) -> res.put(k, v.asString()));
        return res;
    }

    public void main(String[] args) {
        Map<String, String> claims = new HashMap<>();
        claims.put("name", "jacky");
        String jwt = generateJWT(claims);
        log.info(jwt);
        verifyToken(jwt).forEach((k, v) -> System.out.println("key: " + k + " value: " + v));
    }

}