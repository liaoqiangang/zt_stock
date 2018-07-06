package com.niuniu.ym.util;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

public class EncryptUtil {

    public static final byte[] desKey = { 64, -77, 35, -45, 16, -22, 121, -15 };// []
    
    public static final String encryptString(String value, byte[] desKey) {
        // 用密钥加密明文
        String tmp = value;
        try {
            Cipher c1 = Cipher.getInstance("DES");
            DESKeySpec dks = new DESKeySpec(desKey);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成
            // 一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(dks);
            c1.init(Cipher.ENCRYPT_MODE, key);
            byte[] cipherByte = c1.doFinal(value.getBytes());
            tmp = encodeHex(cipherByte);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return tmp;
    }
    
    public static final String encryptString(String userName, String password) {
        // 用密钥加密明文
        String tmp = userName + '\000' + password;
        try {

            Cipher c1 = Cipher.getInstance("DES");

            DESKeySpec dks = new DESKeySpec(desKey);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成
            // 一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(dks);

            c1.init(Cipher.ENCRYPT_MODE, key);
            byte[] cipherByte = c1.doFinal(tmp.getBytes());

            tmp = encodeHex(cipherByte);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tmp;
    }
    
    public static final String encryptString(String value) {
        // 用密钥加密明文
        String tmp = value;
        try {

            Cipher c1 = Cipher.getInstance("DES");

            DESKeySpec dks = new DESKeySpec(desKey);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成
            // 一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(dks);

            c1.init(Cipher.ENCRYPT_MODE, key);
            byte[] cipherByte = c1.doFinal(value.getBytes());

            tmp = encodeHex(cipherByte);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tmp;
    }

    public static final String decryptString(String source) {
        // 用密钥解密密文
        String tmp = source;
        try {
            byte[] bytes = decodeHex(tmp);

            DESKeySpec dks = new DESKeySpec(desKey);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成
            // 一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(dks);
            Cipher c1 = Cipher.getInstance("DES");
            c1.init(Cipher.DECRYPT_MODE, key);
            byte[] cipherByte = c1.doFinal(bytes);

            tmp = new String(cipherByte);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return tmp;
    }
    
    public static final String decryptString(String source, byte[] desKey) {
        // 用密钥解密密文
        String tmp = source;
        try {
            byte[] bytes = decodeHex(tmp);
            DESKeySpec dks = new DESKeySpec(desKey);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成
            // 一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(dks);
            Cipher c1 = Cipher.getInstance("DES");
            c1.init(Cipher.DECRYPT_MODE, key);
            byte[] cipherByte = c1.doFinal(bytes);
            tmp = new String(cipherByte);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return tmp;
    }

    /**
     * Turns an array of bytes into a String representing each byte as an
     * unsigned hex number.
     * <p>
     * Method by Santeri Paavolainen, Helsinki Finland 1996<br>
     * (c) Santeri Paavolainen, Helsinki Finland 1996<br>
     * Distributed under LGPL.
     * 
     * @param bytes an array of bytes to convert to a hex-string
     * @return generated hex string
     */
    public static final String encodeHex(byte[] bytes) {
        StringBuffer buf = new StringBuffer(bytes.length * 2);
        int i;
        // sb.append(Character.forDigit((buffer[i] & 0xf0) >> 4, 16));
        // sb.append(Character.forDigit(buffer[i] & 0x0f, 16));
        for (i = 0; i < bytes.length; i++) {
            if (((int) bytes[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            buf.append(Long.toString((int) bytes[i] & 0xff, 16));
        }
        return buf.toString();
    }

    /**
     * Turns a hex encoded string into a byte array. It is specifically meant to
     * "reverse" the toHex(byte[]) method.
     * 
     * @param hex a hex encoded String to transform into a byte array.
     * @return a byte array representing the hex String[
     */
    public static final byte[] decodeHex(String hex) {
        char[] chars = hex.toCharArray();
        byte[] bytes = new byte[chars.length / 2];
        int byteCount = 0;
        for (int i = 0; i < chars.length; i += 2) {
            int newByte = 0x00;
            newByte |= hexCharToByte(chars[i]);
            newByte <<= 4;
            newByte |= hexCharToByte(chars[i + 1]);
            bytes[byteCount] = (byte) newByte;
            byteCount++;
        }
        return bytes;
    }

    /**
     * Returns the the byte value of a hexadecmical char (0-f). It's assumed
     * that the hexidecimal chars are lower case as appropriate.
     * 
     * @param ch a hexedicmal character (0-f)
     * @return the byte value of the character (0x00-0x0F)
     */
    private static final byte hexCharToByte(char ch) {
        switch (ch) {
            case '0':
                return 0x00;
            case '1':
                return 0x01;
            case '2':
                return 0x02;
            case '3':
                return 0x03;
            case '4':
                return 0x04;
            case '5':
                return 0x05;
            case '6':
                return 0x06;
            case '7':
                return 0x07;
            case '8':
                return 0x08;
            case '9':
                return 0x09;
            case 'a':
                return 0x0A;
            case 'b':
                return 0x0B;
            case 'c':
                return 0x0C;
            case 'd':
                return 0x0D;
            case 'e':
                return 0x0E;
            case 'f':
                return 0x0F;
        }
        return 0x00;
    }

    public static boolean md5PasswordCheck(String dbPassword, String password) {
        if (password == null)
            return false;
        MD5 m = new MD5();
        if (m.getMD5ofStr(password).equalsIgnoreCase(dbPassword))
            return true;
        return false;
    }
    
    public static void main(String[] args) {
    	EncryptUtil e = new EncryptUtil();
    	String str1 = e.encryptString("5354");
    	str1+="1213";
    	System.out.println(str1);
    	String str2 = e.decryptString(str1);
		if(ValidateUtil.isInteger(str2)){
			System.out.println(str2+"====");
		}else{
			System.out.println("111111");
		}
	}
}
