package cn.sijay.elegant.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * QueryTypeEnum
 *
 * @author sijay
 * @since 2025-05-13
 */
@Getter
@AllArgsConstructor
public enum QueryTypeEnum {
    NONE("无"),
    EQUAL("等于"),
    BETWEEN("介于"),
    LIKE("包含"),
    ;
    private final String value;
}
