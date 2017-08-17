package com.test;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/6/13.
 */
public class TestOther {

    @Test
    public void test01() {
        System.out.println(101 % 20);
        System.out.println(101 & 19);
        System.out.println(101 % 21);
        System.out.println(101 & 20);
        System.out.println(100 % 20);
        System.out.println(100 & 19);
        System.out.println(100 % 21);
        System.out.println(100 & 20);
    }

    @Test
    public void test02() {
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("-", "-");
        map.put("-", "-");
        map.get("-");
    }

}
