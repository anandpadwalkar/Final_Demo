package com.iitms.cms.transactions.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.iitms.cms.masters.controller.ComplaintDepartmentController;
import com.iitms.cms.masters.entity.ComplaintItemEntity;
import com.iitms.cms.transactions.dao.ComplaintRegisterDao;
import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;
import com.iitms.cms.util.JsonResponse;

@Service
public class ComplaintRegisterServiceImpl implements ComplaintRegisterService{

	private static final Logger logger = LoggerFactory.getLogger(ComplaintRegisterServiceImpl.class);
	
	@Autowired
	private ComplaintRegisterDao complaintRegisterDao;
	@Autowired
	private MessageSource messageSource;
	
	@Override
	@Transactional
	public boolean addComplaint(ComplaintRegisterEntity entity) {
		return complaintRegisterDao.addComplaint(entity);
	}
	
	@Override
	@Transactional
	public boolean updateComplaint(ComplaintRegisterEntity entity) {
	   	return complaintRegisterDao.updateComplaint(entity);
	}
	

	@Override
	@Transactional
	public List<ComplaintRegisterEntity> getAllComplaints() {
		return complaintRegisterDao.getAllComplaints();
	}

	
	/*code to add  and edit start */
	@Override
	@Transactional
	public JsonResponse addUpdateComplaintRegister(ComplaintRegisterEntity complaintReg, BindingResult result, String operationType){
		JsonResponse response = new JsonResponse();
		List<String> errors = new ArrayList<String>();
		
		if(result.hasErrors() ){
			for (Object object : result.getAllErrors()) {
			    if(object instanceof FieldError) {
			        FieldError fieldError = (FieldError) object;
			        String message = messageSource.getMessage(fieldError, null);
			        logger.info("Error : " +  message + " - "  + fieldError.getField());
			        errors.add(fieldError.getField() + "#" + message);
			    }
			}
			response.setStatus("FAIL");
			response.setResult(errors);
			return response;
		} else{
			if(operationType.equals("add"))
				this.addComplaint(complaintReg);
	 		else
				this.updateComplaint(complaintReg);
				
			response.setStatus("SUCCESS");
			}
		return response;
	}
	/*cod to add and edit end*/
	
	
	@Override
	@Transactional
	public boolean deleteComplaintRegsiter(int complaintId) {
		return this.deleteComplaint(complaintId);
	}
	
	@Override
	@Transactional
	public boolean deleteComplaint(int complaintId) {
		return complaintRegisterDao.deleteComplaint(complaintId);
	}
}
