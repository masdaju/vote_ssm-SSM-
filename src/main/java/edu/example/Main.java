package edu.example;

import edu.example.utils.MD5Utils;
import org.junit.Test;

public class Main {
    public static void main(String[] args) {
//        MD5Utils md5Utils=new MD5Utils();
        System.out.println("Hello world!");
        String input = "bdjhsfzv";
        String encrypted = MD5Utils.md5(input);
        System.out.println(MD5Utils.convertMD5(input));
    }
    @Test
    public void test1(){
        String input = "1234";
        String encrypted = MD5Utils.convertMD5(input);
        System.out.println(MD5Utils.md5(encrypted));

    }
}