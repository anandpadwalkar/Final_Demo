package com.iitms.cms.transactions.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.iitms.cms.masters.entity.ComplaintDepartment;

@Entity
@Table(name = "complaint_user")
public class ComplaintRepairEmployee implements Serializable{

	@Id@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	@Min(value = 1)
	@Column(name = "\"employeeId\"")
	private int employeeId;
	/*@Column(name = "\"adminId\"")
	private int adminId;*/
	@Min(value = 1)
	@Column(name = "\"deptId\"")
	private int deptId;
	@NotNull@NotEmpty
	@Column(name = "status")
	private String status;
	
	@Transient
	private String isAdmin;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "\"employeeId\"", referencedColumnName = "id",  insertable = false, updatable = false, nullable = false)
	private Employee employee;
	
	/*@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "adminId", referencedColumnName = "id",  insertable = false, updatable = false, nullable = false)
	private Employee admin;*/
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "\"deptId\"", referencedColumnName = "deptId", insertable = false, updatable = false, nullable = false)
	private ComplaintDepartment complaintDepartment;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}


	public ComplaintDepartment getComplaintDepartment() {
		return complaintDepartment;
	}

	public void setComplaintDepartment(ComplaintDepartment complaintDepartment) {
		this.complaintDepartment = complaintDepartment;
	}

	@Override
	public String toString() {
		return "ComplaintRepairEmployee [id=" + id + ", employeeId=" + employeeId +  ", deptId="
				+ deptId + ", status=" + status + ", isAdmin=" + isAdmin + "]";
	}
	
	

}
