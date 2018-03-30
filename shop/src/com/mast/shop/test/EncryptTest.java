/*package com.mast.shop.test;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

import com.mast.shop.tools.EncryptUtil;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;

*//**
 * 
 * 类描述： 用于测试各种加密算法 
 * 类名称：com.tz.ssspm.test.EncryptTest       
 * 创建人: tz
 * 创建时间：2016年11月9日 下午8:46:18
 * @version   V1.0
 *//*
public class EncryptTest {
	//测试不可逆加密算法MD5
	@Test
	public void testMD5(){
		String plainPsd = "123456";
		System.out.println(DigestUtils.md5Hex(plainPsd.getBytes()));
		//e10adc3949ba59abbe56e057f20f883e
	}
	
	//测试不可逆加密算法sha1
	@Test
	public void testSha1(){
		String plainPsd = "123456";
		System.out.println(DigestUtils.sha1Hex(plainPsd));
		//7c4a8d09ca3762af61e59520943dc26494f8941b
	}
	
	//测试可逆加密算法BASE64
	@Test
	public void testBASE64Encode(){
		String plainPsd = "123456";
		System.out.println(Base64.encode(plainPsd.getBytes()));
		//MTIzNDU2
	}
		
	//测试可逆加密算法BASE64
	@Test
	public void testBASE64Decode() throws Base64DecodingException{
		String encryptPsd = "MTIzNDU2";
		System.out.println(new String(Base64.decode(encryptPsd.getBytes())));
		//123456
	}
	
	//测试可逆加密算法HEX
	@Test
	public void testHEXEncode(){
		String plainPsd = "123456";
		System.out.println(Hex.encodeHex(plainPsd.getBytes()));
		//313233343536
	}
		
	//测试可逆加密算法BASE64
	@Test
	public void testHexDecode() throws Base64DecodingException, DecoderException{
		String encryptPsd = "313233343536";
		System.out.println(new String(Hex.decodeHex(encryptPsd.toCharArray())));		
		//123456
	}
	//123456	
	//1：生成一个随机数 
	//2:用可逆的加密算法加密随机数
	//3:将随机数和我们的密码 用sha1不可逆算法加密
	//4：将第三步得到的字符串值用可逆的加密算法加密
	//5：将第2步和第4步的值拼凑
	//
	//加密： encryptCode = HEX.ENCODE(RANDOM)+ HEX.ENCODE(SHA1(RANDOM+password))
	@Test
	public void testPmEncrypt(){
		EncryptUtil encryptUtil= new EncryptUtil();
		String plainPsd = "111111";
		//1
		byte[] random = encryptUtil.generateSalt(8);
		//2
		String randomHex = encryptUtil.encodeHex(random);
		//3+4
		String sha1Psd = encryptUtil.encodeHex(encryptUtil.sha1(plainPsd.getBytes(), random, 1024)); 
		//5
		String encryptPsd = randomHex + sha1Psd;
		
		System.out.println(encryptPsd);
		
	}
	
	
	//密码验证
 	@Test
 	public void testPsdValidator(){
 		String password = "111111";
 		String encryptPsd = "4ed2ed1298fd54d909a5ad00596fd3f24151daf1909a958c19f8eef9";
 		//将密文逆转 ，截取 salt盐的明文
 		byte[] salt = EncryptUtil.decodeHex(encryptPsd.substring(0, 16));
 		 		
 		//重新拼凑 盐+密码   进行sha1的加密
 	    byte[] hashPass = EncryptUtil.sha1(password.getBytes(), salt, 1024);
 	    String newEcnryptPsd= EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass);
 	    System.out.println("--"+newEcnryptPsd);
 	}
	 	
	
		
}
*/