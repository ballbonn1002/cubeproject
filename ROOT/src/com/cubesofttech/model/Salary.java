package com.cubesofttech.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "salary")
public class Salary implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "salary_id")
	private Integer salary_id;
	@Column(name = "user")
	private String user;
	@Column(name = "name")
	private String name;
	@Column(name = "present")
	private Integer present;
	@Column(name = "leaves")
	private Integer leave;
	@Column(name = "late")
	private Integer late;
	@Column(name = "absent")
	private Integer absent;
	@Column(name = "salary")
	private Integer salary;
	@Column(name = "sumsalary")
	private BigDecimal sumsalary;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "time_create")
	private Timestamp time_create;
	
	public void setSalary_id(Integer salary_id) {
		this.salary_id = salary_id;
	}
	
	public Integer getSalary_id() {
		return salary_id;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setPresent(Integer present) {
		this.present = present;
	}
	
	public Integer getPresent() {
		return present;
	}
	
	public void setLeave(Integer leave) {
		this.leave = leave;
	}
	
	public Integer getLeave() {
		return leave;
	}
	
	public void setLate(Integer late) {
		this.late = late;
	}
	public Integer getLate() {
		return late;
	}
	
	public void setAbsent(Integer absent) {
		this.absent = absent;
	}
	public Integer getAbsent() {
		return absent;
	}
	
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	
	public Integer getsalary() {
		return salary;
	}
	
	public void setSumsalary(BigDecimal sumsalary) {
		this.sumsalary = sumsalary;
	}
	
	public BigDecimal getSumsalary() {
		return sumsalary;
	}
	
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public String getUser_create() {
		return user_create;
	}
	
	public void setTime_create(Timestamp time_create) {
		this.time_create = time_create;
	}
	public Timestamp getTime_create() {
		return time_create;
	}
	

}

