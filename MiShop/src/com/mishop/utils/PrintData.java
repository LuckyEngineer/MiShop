package com.mishop.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrintData {
	public static void printData(HttpServletRequest request, HttpServletResponse response) {
		Map map = request.getParameterMap();

		Set set = map.keySet();

		Iterator it = set.iterator();

		String parameterNames = null;

		while (it.hasNext()) {

			parameterNames = (String) it.next();

			String values[] = request.getParameterValues(parameterNames);

			System.out.println(parameterNames);

		}
	}
}
