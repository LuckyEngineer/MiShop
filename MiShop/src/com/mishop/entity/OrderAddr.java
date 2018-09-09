package com.mishop.entity;

import java.util.Date;

public class OrderAddr {

	private int orderId;
	private String orderNo;
	private String receiver;
	private int status;
	private Double payment;
	private Date createTime;
	private Date updateTime;

	public OrderAddr() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderAddr(int orderId, String orderNo, String receiver, int status, Double payment, Date createTime,
			Date updateTime) {
		super();
		this.orderId = orderId;
		this.orderNo = orderNo;
		this.receiver = receiver;
		this.status = status;
		this.payment = payment;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Double getPayment() {
		return payment;
	}

	public void setPayment(Double payment) {
		this.payment = payment;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
