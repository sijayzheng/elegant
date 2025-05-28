package cn.sijay.elegant.auth.entity;

import cn.sijay.elegant.system.entity.SystemUser;
import lombok.Data;

/**
 * UserInfo
 *
 * @author sijay
 * @since 2025-05-23
 */
@Data
public class UserInfo {
    private SystemUser user;
    private String[] permissions;
    private String[] roles;
}
