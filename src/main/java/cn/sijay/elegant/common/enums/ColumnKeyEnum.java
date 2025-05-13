package cn.sijay.elegant.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * ColumnKeyEnum
 *
 * @author sijay
 * @since 2025-05-13
 */
@Getter
@AllArgsConstructor
public enum ColumnKeyEnum {
    NONE("无"),
    PRI("主键"),
    UNI("唯一键"),
    MUL("索引字段"),
    ;
    private final String value;
}




