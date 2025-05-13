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
    BOOLEAN("Boolean", "", "boolean"),

    INTEGER("Integer", "", "number"),
    LONG("Long", "", "number"),
    BIG_DECIMAL("BigDecimal", "java.math.BigDecimal", "number"),
    FLOAT("Float", "", "number"),
    DOUBLE("Double", "", "number"),

    BYTE_ARRAY("byte[]", "", "any"),

    LOCAL_DATE("LocalDate", "java.time.LocalDate", "string"),
    LOCAL_DATE_TIME("LocalDateTime", "java.time.LocalDateTime", "string"),
    LOCAL_TIME("LocalTime", "java.time.LocalTime", "string"),

    STRING("String", "", "string"),

    LIST_LONG("List<Long>", "java.util.List", "number[]"),
    LIST_STRING("List<String>", "java.util.List", "string[]"),
    ;
    private final String value;
    private final String packageName;
    private final String tsType;
}
