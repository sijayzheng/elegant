package cn.sijay.elegant.common.util;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

/**
 * FileUtil
 *
 * @author sijay
 * @since 2025-05-13
 */
@Slf4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class FileUtil {
    /**
     * 获取文件扩展名
     *
     * @param file 文件
     * @return 扩展名
     */
    public static String getExtension(File file) {
        return getExtension(file.getName());
    }

    /**
     * 获取文件扩展名
     *
     * @param filename 文件名
     * @return 扩展名
     */
    public static String getExtension(String filename) {
        return filename.substring(filename.lastIndexOf("."));
    }

    /**
     * 写入文件
     *
     * @param file    文件
     * @param content 内容
     */
    public static void writeFile(File file, String content) {
        try {
            Files.writeString(file.toPath(), content);
        } catch (Exception e) {
            log.error("write file error", e);
        }
    }

    /**
     * 写入文件
     *
     * @param path    文件路径
     * @param content 内容
     */
    public static void writeFile(String path, String content) {
        File file = new File(path);
        if (!file.exists()) {
            try {
                if (!file.getParentFile().exists()) {
                    Files.createDirectories(file.getParentFile().toPath());
                }
                Files.createFile(file.toPath());
            } catch (Exception e) {
                log.error("create file error", e);
            }
        }
        writeFile(file, content);
    }

    /**
     * 拼接路径
     *
     * @param path 路径
     * @return 拼接后的路径
     */
    public static String concatPath(String... path) {
        return String.join(File.separator, path);
    }

    public static List<File> listFile(String path) {
        List<File> list = new ArrayList<>();
        File file = new File(path);
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            if (files != null) {
                for (File f : files) {
                    list.addAll(listFile(f.getPath()));
                }
            }
        } else {
            list.add(file);
        }
        return list;
    }
}
