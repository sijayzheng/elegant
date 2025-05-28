package cn.sijay.elegant.common.constants;

/**
 * RedisConstants
 *
 * @author sijay
 * @since 2025-05-27
 */
public interface RedisConstants {
    /**
     * 全局
     */
    String GLOBAL_REDIS_KEY = "global:";

    /**
     * 验证码
     */
    String CAPTCHA_CODE_KEY = "captcha_codes:";

    /**
     * 防重提交
     */
    String REPEAT_SUBMIT_KEY = "repeat_submit:";

    /**
     * 限流
     */
    String RATE_LIMIT_KEY = "rate_limit:";

    /**
     * 参数管理
     */
    String SYS_CONFIG_KEY = "sys_config:";

    /**
     * 字典管理
     */
    String SYS_DICT_KEY = "sys_dict:";

    /**
     * 登录账户密码错误次数
     */
    String PWD_ERR_CNT_KEY = "pwd_err_cnt:";
}
