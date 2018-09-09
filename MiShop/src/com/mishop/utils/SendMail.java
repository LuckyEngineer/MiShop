package com.mishop.utils;

import org.apache.commons.mail.HtmlEmail;
/**
 * 发送邮件的工具类
 * @author Administrator
 */
public class SendMail {
	private static SendMail sendMail;
	private SendMail() {
		
	}
	public static SendMail getSendMail() {
		if(sendMail==null) {
			sendMail = new SendMail();
		}
		return sendMail;
	}
	/**
	 * 
	 * @param emailaddress   用户的邮箱
	 * @param code           验证码
	 * @return
	 */
	public boolean sendEmail(String emailaddress,int code){
		try {
			HtmlEmail email = new HtmlEmail();//不用更改
			email.setHostName("smtp.qq.com");//需要修改，126邮箱为smtp.126.com,163邮箱为163.smtp.com，QQ为smtp.qq.com
			email.setCharset("UTF-8");
			email.addTo(emailaddress);// 收件地址
			email.setFrom("zengzh1996@qq.com", "发送人的姓名");//此处填邮箱地址和用户名,用户名可以任意填写
			email.setAuthentication("zengzh1996@qq.com", "nuwklakagdnnebde");//此处填写邮箱地址和客户端授权码
			email.setSubject("小米官网的注册验证码");//此处填写邮件名，邮件名可任意填写
			email.setMsg("尊敬的用户:您好,欢迎您注册小米官网，您本次注册的验证码是:" + code);//此处填写邮件内容
			email.send();
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}