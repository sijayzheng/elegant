package cn.sijay.elegant.common.util;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * StringUtil
 *
 * @author sijay
 * @since 2025-05-13
 */
@Slf4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class StringUtil {
    public static boolean isEmpty(String str) {
        return str == null || str.isEmpty();
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static boolean isBlank(String str) {
        return isEmpty(str) || str.trim().isEmpty();
    }

    public static boolean isNotBlank(String str) {
        return !isBlank(str);
    }

    public static boolean containsAnyIgnoreCase(String str, String... testStrings) {
        if (isEmpty(str) || testStrings == null) {
            return false;
        }
        for (String test : testStrings) {
            if (str.contains(test)) {
                return true;
            }
        }
        return false;
    }
}
