package com.iitms.cms.transactions.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;
import com.iitms.cms.util.JsonResponse;

public interface ComplaintRegisterService {

	public boolean addComplaint(ComplaintRegisterEntity entity);
	public List<ComplaintRegisterEntity> getAllComplaints();
	public JsonResponse addUpdateComplaintRegister(ComplaintRegisterEntity complaintRegisterEntity,
			BindingResult result, String string);
	boolean updateComplaint(ComplaintRegisterEntity entity);
	public boolean deleteComplaint(int complaintId);
	public boolean deleteComplaintRegsiter(int complaintId);
}
