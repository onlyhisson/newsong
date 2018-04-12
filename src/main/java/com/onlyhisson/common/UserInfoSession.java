package com.onlyhisson.common;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("userinfo")
@Scope("session")
public class UserInfoSession {
	
	private String email;
	private String name;
	private String age;
	private String acc_lv;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAcc_lv() {
		return acc_lv;
	}
	public void setAcc_lv(String acc_lv) {
		this.acc_lv = acc_lv;
	}
	
}
