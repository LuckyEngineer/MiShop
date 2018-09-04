package com.mishop.service.impl;

import com.mishop.dao.impl.ColorDaoImpl;

public class ColorServiceImpl {
	private static ColorServiceImpl colorServiceImpl;
	
	private ColorServiceImpl() {
		
	}
	
	public static ColorServiceImpl getInstance() {
		if(colorServiceImpl == null) {
			synchronized (ColorServiceImpl.class) {
				if(colorServiceImpl == null) {
					colorServiceImpl = new ColorServiceImpl();
				}
			}
		}
		return colorServiceImpl;
	}
	
	public int insertColor(int productId,String color) {
		return ColorDaoImpl.getInstance().insertColoe(productId, color);
	}
}
