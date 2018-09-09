package com.mishop.entity;
//首页的广告
public class Adver {
	private int adverId;
	private int adverType;
	private String adverHref;
	public int getAdverId() {
		return adverId;
	}
	public void setAdverId(int adverId) {
		this.adverId = adverId;
	}
	public int getAdverType() {
		return adverType;
	}
	public void setAdverType(int adverType) {
		this.adverType = adverType;
	}
	public String getAdverHref() {
		return adverHref;
	}
	public void setAdverHref(String adverHref) {
		this.adverHref = adverHref;
	}
}