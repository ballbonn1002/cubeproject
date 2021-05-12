package com.cubesofttech.model;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "salary_user")
//@NamedQueries({
//    @NamedQuery(name = "salary_user.findAll", query = "SELECT t FROM salary_user t")})
public class Salary_user implements Serializable {
	public Salary_user() {
	}
	public Salary_user(Integer id_salary_user,java.sql.Timestamp start_date,java.sql.Timestamp end_date,String user,
			Integer salary,String description,String user_create,String user_update,java.sql.Timestamp time_create,java.sql.Timestamp time_update) {
		this.id_salary_user = id_salary_user;
		this.start_date = start_date;
		this.end_date = end_date;
		this.user = user;
		this.salary = salary;
		this.description = description;
		this.user_create = user_create;
		this.user_update = user_update;
		this.time_create = time_create;
		this.time_update = time_update;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_salary_user")
	private Integer id_salary_user;
	@Column(name = "start_date")
	private java.sql.Timestamp start_date;
	@Column(name = "end_date")
	private java.sql.Timestamp end_date;
	@Column(name = "user")
	private String user;
	@Column(name = "salary")
	private Integer salary;
	@Column(name = "description")
	private String description;
	@Column(name = "user_create")
	private String user_create;
	@Column(name = "user_update")
	private String user_update;
	@Column(name = "time_create")
	private java.sql.Timestamp time_create;
	@Column(name = "time_update")
	private java.sql.Timestamp time_update;
	
	public Integer getId_salary_user() {
		return id_salary_user;
	}
	public void setId_salary_user(Integer id_salary_user) {
		this.id_salary_user = id_salary_user;
	}
	
	public java.sql.Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(java.sql.Timestamp start_date) {
		this.start_date = start_date;
	}
	public java.sql.Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(java.sql.Timestamp end_date) {
		this.end_date = end_date;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUser_create() {
		return user_create;
	}
	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}
	public String getUser_update() {
		return user_update;
	}
	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}
	public java.sql.Timestamp getTime_create() {
		return time_create;
	}
	public void setTime_create(java.sql.Timestamp time_create) {
		this.time_create = time_create;
	}
	public java.sql.Timestamp getTime_update() {
		return time_update;
	}
	public void setTime_update(java.sql.Timestamp time_update) {
		this.time_update = time_update;
	}
	
	
	
	
}
