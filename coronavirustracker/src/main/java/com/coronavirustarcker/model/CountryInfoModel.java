package com.coronavirustarcker.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CountryInfoModel {

	private int _id;
	private String iso2;
	private String iso3;
	private int lat;
	
	@JsonProperty("long")
	private int longt;
	private String flag;
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getIso2() {
		return iso2;
	}
	public void setIso2(String iso2) {
		this.iso2 = iso2;
	}
	public String getIso3() {
		return iso3;
	}
	public void setIso3(String iso3) {
		this.iso3 = iso3;
	}
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLongt() {
		return longt;
	}
	public void setLongt(int longt) {
		this.longt = longt;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
}
