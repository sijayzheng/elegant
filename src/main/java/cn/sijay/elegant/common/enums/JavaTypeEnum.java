package cn.sijay.elegant.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * JavaTypeEnum
 *
 * @author sijay
 * @since 2025-05-13
 */
@Getter
@AllArgsConstructor
public enum JavaTypeEnum {
    BOOLEAN("Boolean", ""),

    INTEGER("Integer", ""),
    LONG("Long", ""),
    BIG_DECIMAL("BigDecimal", "java.math.BigDecimal"),
    FLOAT("Float", ""),
    DOUBLE("Double", ""),

    BYTE_ARRAY("byte[]", ""),

    LOCAL_DATE("LocalDate", "java.time.LocalDate"),
    LOCAL_DATE_TIME("LocalDateTime", "java.time.LocalDateTime"),
    LOCAL_TIME("LocalTime", "java.time.LocalTime"),

    STRING("String", ""),

    LIST_LONG("List<Long>", "java.util.List"),
    LIST_STRING("List<String>", "java.util.List"),
    ;
    private final String value;
    private final String packageName;
}
