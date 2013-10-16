package org.nhnnext.util;

/**
 * 
 * @author josunghwan
 *
 */
public class EncryptUtil {

	/**
	 * src String을 기반으로 MD5 암호화 후 결과값을 반환
	 * @param src
	 * @return temp 	암호화된 String
	 */
	public static String encryptString(String src) {
		java.security.MessageDigest md5 = null;
		try {
			md5 = java.security.MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			return "";
		}

		String eip;
		byte[] bip;
		String temp = "";
		String tst = src;

		bip = md5.digest(tst.getBytes());
		for (int i = 0; i < bip.length; i++) {
			eip = "" + Integer.toHexString(bip[i] & 0x000000ff);
			if (eip.length() < 2)
				eip = "0" + eip;
			temp = temp + eip;
		}
		return temp;
	}

}
