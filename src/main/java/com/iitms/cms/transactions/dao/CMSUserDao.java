package com.iitms.cms.transactions.dao;

import java.util.List;

import com.iitms.cms.transactions.entity.ComplaintRepairEmployee;
import com.iitms.cms.transactions.entity.Employee;

public interface CMSUserDao {

	public List<Employee> getEmployeeOfDept(int deptId);
	public boolean addEmployeeOfDept(ComplaintRepairEmployee employee);
	public boolean editEmployeeOfDept(int id, String status);
	public boolean deleteEmployeeOfDept(int id);
	public List<ComplaintRepairEmployee> getComplaintRepairEmployee();
}
