package com.mishop.entity;

import java.util.Date;

public class OrderDetail {
	private int orderId;
	private long orderNo;
	private Date createTime;
	private String receiver;
	private String province;
	private String city;
	private String addr;
	private String tel;
	private Double payment;

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int orderId, long orderNo, Date createTime, String receiver, String province, String city,
			String addr, String tel, Double payment) {
		super();
		this.orderId = orderId;
		this.orderNo = orderNo;
		this.createTime = createTime;
		this.receiver = receiver;
		this.province = province;
		this.city = city;
		this.addr = addr;
		this.tel = tel;
		this.payment = payment;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Double getPayment() {
		return payment;
	}

	public void setPayment(Double payment) {
		this.payment = payment;
	}

}
