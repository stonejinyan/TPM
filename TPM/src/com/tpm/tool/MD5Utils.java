package com.tpm.tool;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
	/**
	 * ʹ��md5���㷨���м���
	 * 
	 * @param plainText
	 *            ����ԭ��
	 * @return ��������
	 */
	public static String md5(String plainText) {
		byte[] secretBytes = null;
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(
					plainText.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("û��md5����㷨��");
		}
		return new BigInteger(1, secretBytes).toString(16);
	}
}
