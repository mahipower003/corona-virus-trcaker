package com.coronavirustarcker.model;

import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan
public class StatewiseInfoModel {

	private String loc;
	private int confirmedCasesIndian;
	private int confirmedCasesForeign;
	private int discharged;
	private int deaths;
	private int totalConfirmed;
	private String iso2;
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public int getConfirmedCasesIndian() {
		return confirmedCasesIndian;
	}
	public void setConfirmedCasesIndian(int confirmedCasesIndian) {
		this.confirmedCasesIndian = confirmedCasesIndian;
	}
	public int getConfirmedCasesForeign() {
		return confirmedCasesForeign;
	}
	public void setConfirmedCasesForeign(int confirmedCasesForeign) {
		this.confirmedCasesForeign = confirmedCasesForeign;
	}
	public int getDischarged() {
		return discharged;
	}
	public void setDischarged(int discharged) {
		this.discharged = discharged;
	}
	public int getDeaths() {
		return deaths;
	}
	public void setDeaths(int deaths) {
		this.deaths = deaths;
	}
	public int getTotalConfirmed() {
		return totalConfirmed;
	}
	public void setTotalConfirmed(int totalConfirmed) {
		this.totalConfirmed = totalConfirmed;
	}
	public String getIso2() {
		return iso2;
	}
	public void setIso2(String iso2) {
		this.iso2 = iso2;
	}
	
	
}
