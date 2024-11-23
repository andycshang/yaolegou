package edu.ustb.yaolegou.utils;

import java.util.Random;

public class CheckCodeUtil {
    /**
     * @param len 位数
     * @return
     */
    public static String getCode(int len) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; sb.length() < len; i++) {
            int num = new Random().nextInt(10);
            sb.append(num);
        }
        return sb.toString();
    }
}
