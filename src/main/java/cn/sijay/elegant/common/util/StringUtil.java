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
    public static final String EMPTY = "";

    public static String trim(String str) {
        return str == null ? null : str.trim();
    }

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

    public static String join(String comma, String... value) {
        return String.join(comma, value);
    }

    // 字节数组转十六进制字符串
    public static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b & 0xFF));
        }
        return sb.toString();
    }

    //十六进制字符串转字节数组
    public static byte[] hexToBytes(String hex) {
        int length = hex.length();
        if (length % 2 != 0) {
            throw new IllegalArgumentException("hex需要偶数位长度");
        }
        byte[] bytes = new byte[length / 2];
        for (int i = 0; i < length; i += 2) {
            String hexByte = hex.substring(i, i + 2);
            bytes[i / 2] = (byte) Integer.parseInt(hexByte, 16);
        }
        return bytes;
    }
}
