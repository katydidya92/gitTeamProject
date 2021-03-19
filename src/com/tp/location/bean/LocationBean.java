package com.tp.location.bean;

import java.sql.Timestamp;

public class LocationBean {
	private int locationID;
	private String location_spot;
	private String userID;
	private Timestamp location_date;

	public int getLocationID() {
		return locationID;
	}

	public void setLocationID(int locationID) {
		this.locationID = locationID;
	}

	public String getLocation_spot() {
		return location_spot;
	}

	public void setLocation_spot(String location_spot) {
		this.location_spot = location_spot;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public Timestamp getLocation_date() {
		return location_date;
	}

	public void setLocation_date(Timestamp location_date) {
		this.location_date = location_date;
	}

}
