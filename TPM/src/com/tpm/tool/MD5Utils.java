package com.tpm.tool;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;

public class MD5Utils {

	public static String md5(String plainText) {
		byte[] secretBytes = null;
		try {
			secretBytes = MessageDigest.getInstance("md5").digest(plainText.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("û��md5����㷨��");
		}
		return new BigInteger(1, secretBytes).toString(16);
	}

	public static double getTwoDecimal(double num) {
		DecimalFormat dFormat = new DecimalFormat("#.00");
		String yearString = dFormat.format(num);
		Double temp = Double.valueOf(yearString);
		return temp;
	}
}
