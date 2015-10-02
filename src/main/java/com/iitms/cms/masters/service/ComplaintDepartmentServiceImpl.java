package com.iitms.cms.masters.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.cms.masters.dao.ComplaintDepartmentDao;
import com.iitms.cms.masters.entity.ComplaintDepartment;

@Service
public class ComplaintDepartmentServiceImpl implements ComplaintDepartmentService{

	@Autowired
	private ComplaintDepartmentDao complaintDepartmentDao;
	
	@Override
	@Transactional
	public boolean addComplaintDepartment(ComplaintDepartment entity) {
		entity.setDeptName(entity.getDeptName().toUpperCase());
		return complaintDepartmentDao.addComplaintDepartment(entity);
	}

	@Override
	@Transactional
	public boolean updateComplaintDepartment(ComplaintDepartment entity) {
		entity.setDeptName(entity.getDeptName().toUpperCase());
		return complaintDepartmentDao.updateComplaintDepartment(entity);
	}

	@Override
	@Transactional
	public boolean deleteComplaintDepartment(int id) {
		return complaintDepartmentDao.deleteComplaintDepartment(id);
	}

	@Override
	@Transactional
	public List<ComplaintDepartment> getComplaintDepartmentList() {
		return complaintDepartmentDao.getComplaintDepartmentList();
	}

	@Override
	@Transactional
	public List<ComplaintDepartment> getAllDepartment() {
		return complaintDepartmentDao.getAllDepartment();
	}

	@Override
	@Transactional
	public boolean isComplaintDepartmentExist(String deptName) {
		return complaintDepartmentDao.isComplaintDepartmentExist(deptName);
	}

	
}
