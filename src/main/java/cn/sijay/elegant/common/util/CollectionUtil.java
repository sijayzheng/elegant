package cn.sijay.elegant.common.util;

import java.util.Collection;

/**
 * CollectionUtil
 *
 * @author sijay
 * @since 2025-05-21
 */
public class CollectionUtil {
    /**
     * 是否不为空
     *
     * @param collection 需要校验的集合
     * @return 校验结果
     */
    public static boolean isNotEmpty(Collection<?> collection) {
        return !isEmpty(collection);
    }

    /**
     * 是否为空
     *
     * @param collection 需要校验的集合
     * @return 校验结果
     */
    public static boolean isEmpty(Collection<?> collection) {
        return collection == null || collection.isEmpty();
    }
}
