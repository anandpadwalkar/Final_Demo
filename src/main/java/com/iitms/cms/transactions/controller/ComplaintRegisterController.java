package com.iitms.cms.transactions.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iitms.cms.masters.entity.ComplaintTypeEntity;
import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;
import com.iitms.cms.transactions.service.ComplaintRegisterService;
import com.iitms.cms.util.JsonResponse;

@Controller
public class ComplaintRegisterController {

	private static final Logger logger = LoggerFactory.getLogger(ComplaintRegisterController.class);
	@Autowired
	private ComplaintRegisterService complaintRegisterService;
	@Autowired
	private MessageSource messageSource;
	
	
	@RequestMapping(value = "/transaction/complaints-register")
	public String getComplaintForm(Model model){
		model.addAttribute("complaint", new ComplaintRegisterEntity());
		
		 List<ComplaintRegisterEntity> list = complaintRegisterService.getAllComplaints();
	      	model.addAttribute("list", list);
		return "/transaction/complaint-register";
	}
	
	@RequestMapping(value = "/transaction/complaint/list", method = RequestMethod.POST)
	public @ResponseBody List<ComplaintRegisterEntity> getAllComplaints(){
		return complaintRegisterService.getAllComplaints();
	}
	
	
	
	@RequestMapping(value = "/transaction/add-complaint-registration", method = RequestMethod.POST)
	public @ResponseBody JsonResponse addRegisterComplaint(@Valid @ModelAttribute("complaint") ComplaintRegisterEntity complaintRegisterEntity,
			BindingResult result, Model model){
		
		/*logger information*/
		logger.info("complaint : " + complaintRegisterEntity + " Error : " + result.hasErrors() +  " - "  + result.hasFieldErrors("itemCode"));
		
		/*create json response and list error object*/
		JsonResponse response = new JsonResponse();
		List<String> errors = new ArrayList<String>();
		
		//check has error on server side
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
		
		}else{
	 	 response =complaintRegisterService.addUpdateComplaintRegister(complaintRegisterEntity, result, "add");
		return response;
		}
	}
	
	
	
	@RequestMapping(value = "/transaction/update-complaint-registration", method = RequestMethod.POST)
	public @ResponseBody JsonResponse updateRegisterComplaint(@Valid @ModelAttribute("complaint") ComplaintRegisterEntity complaintRegisterEntity,
			BindingResult result, Model model){
		
		/*logger information*/
		logger.info("complaint : " + complaintRegisterEntity + " Error : " + result.hasErrors() +  " - "  + result.hasFieldErrors("itemCode"));
		
		/*create json response and list error object*/
		JsonResponse response = new JsonResponse();
		List<String> errors = new ArrayList<String>();
		
		//check has error on server side
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
		
		}else{
			 logger.info("this means inside update");
	 	 response =complaintRegisterService.addUpdateComplaintRegister(complaintRegisterEntity, result, "update");
		return response;
		}
	}
	
	
	
	@RequestMapping(value = "/transaction/delete-complaint-registration", method = RequestMethod.POST)
	public String deleteComplaint(@RequestParam Integer id){
		logger.info("Complaint : " + id);
		complaintRegisterService.deleteComplaint(id);
		return "redirect:/transaction/complaints-register";
	}
	
	
	
	
	

	
	
	
}
