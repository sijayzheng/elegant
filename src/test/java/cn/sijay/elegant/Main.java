package cn.sijay.elegant;

import cn.sijay.elegant.common.util.BCrypt;

/**
 * Main
 *
 * @author sijay
 * @since 2025-05-27
 */
public class Main {
    public static void main(String[] args) {
        System.out.println(BCrypt.hashpw("123456"));

    }
}