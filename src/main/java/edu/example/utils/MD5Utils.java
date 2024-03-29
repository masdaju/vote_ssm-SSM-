package edu.example.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {

    private static final String ALGORITHM = "MD5";

    public static String md5(String source) {
        if (source == null || source.length() == 0) {
            throw new IllegalArgumentException("Invalid input: source cannot be null or empty");
        }

        try {
            MessageDigest messageDigest = MessageDigest.getInstance(ALGORITHM);
            byte[] input = source.getBytes();
            byte[] output = messageDigest.digest(input);
            BigInteger bigInteger = new BigInteger(1, output);
            return String.format("%032x", bigInteger);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not available", e);
        }
    }
    public static String convertMD5(String inStr){

        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++){
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;

    }
}

