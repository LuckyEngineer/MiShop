package com.mishop.utils;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

/**
 * 获取一串验证码
 * 
 * @author Administrator
 *
 */
public class RandomUtil {
	private static RandomUtil randomUtil;

	private RandomUtil() {

	}

	public static RandomUtil getRandomUtil() {
		if (randomUtil == null) {
			randomUtil = new RandomUtil();
		}
		return randomUtil;
	}

	/**
	 * 获取一个六位随机数
	 * 
	 * @return Set<Integer>
	 */
	public int GetRandomNumber() {
		//
		int ran = (int) (Math.random() * 900000) + 100000;
		return ran;
	}

	public static void main(String[] args) {
		RandomUtil a = new RandomUtil();
		System.out.println(a.GetRandomNumber());
	}
}