package cn.sijay.elegant.auth.entity;

import lombok.Data;

/**
 * LoginParam
 *
 * @author sijay
 * @since 2025-05-23
 */
@Data
public class LoginParam {
    private Long module;
    private String username;
    private String password;
    private String code;
    private String uuid;
    private String openid;
}
