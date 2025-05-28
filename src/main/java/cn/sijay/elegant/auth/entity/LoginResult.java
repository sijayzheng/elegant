package cn.sijay.elegant.auth.entity;

import lombok.Data;

/**
 * LoginResult
 *
 * @author sijay
 * @since 2025-05-23
 */
@Data
public class LoginResult {
    /**
     * 授权令牌
     */
    private String accessToken;
    /**
     * 授权令牌的有效期
     */
    private Long expireIn;
    /**
     * 用户 openid
     */
    private String openid;
}
