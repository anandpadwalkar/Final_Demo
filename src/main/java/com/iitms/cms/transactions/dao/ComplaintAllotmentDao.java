package com.iitms.cms.transactions.dao;

import java.util.List;

import com.iitms.cms.masters.entity.ComplaintDepartment;
import com.iitms.cms.transactions.entity.ComplaintAllotmentEntity;
import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;

public interface ComplaintAllotmentDao {

	 public List<ComplaintRegisterEntity> getAllComplaintsAllotment();
}
