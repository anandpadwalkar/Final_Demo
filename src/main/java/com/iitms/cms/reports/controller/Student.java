package com.iitms.cms.reports.controller;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "student")
public class Student {

	@Id@GeneratedValue( strategy = GenerationType.AUTO)
	@Column
	@Email
	@NotEmpty
//	@NotEmpty(message = "Please enter Id")	
	private String email;
	@Column
	@NotEmpty
	@NotNull
	private String name;
	@Transient
	@NotNull
	private int age;
	
	@Transient
	@Range(min=1)
	private int empId ;
	
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	@Override
	public String toString() {
		return "Student [email=" + email + ", name=" + name + ", age=" + age + ", empId=" + empId + "]";
	}
	
	
	
}
