package cn.sijay.elegant.common.util;

import jakarta.servlet.http.HttpServletResponse;

import java.io.InputStream;
import java.util.List;

/**
 * ExcelUtil
 *
 * @author sijay
 * @since 2025-05-21
 */
public class ExcelUtil {

    public static <T> void exportExcel(List<T> list, String fileName, Class<T> clazz, HttpServletResponse response) {
    }

    public static <T> List<T> importExcel(InputStream inputStream, Class<T> clazz) {
        return null;
    }
}
