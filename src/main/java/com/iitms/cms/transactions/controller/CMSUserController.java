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

import com.iitms.cms.masters.entity.ComplaintItemEntity;
import com.iitms.cms.transactions.entity.ComplaintRepairEmployee;
import com.iitms.cms.transactions.entity.Employee;
import com.iitms.cms.transactions.service.CMSUserService;
import com.iitms.cms.util.JsonResponse;
@Controller
public class CMSUserController {

	private static final Logger logger = LoggerFactory.getLogger(CMSUserController.class);
	
	@Autowired
	private CMSUserService cmsUserService;
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = "/transaction/user-list")
	private String cmsUserList(Model model){
		List<ComplaintRepairEmployee> list = cmsUserService.getComplaintRepairEmployee();
		model.addAttribute("repairEmployee", new ComplaintRepairEmployee());
		model.addAttribute("list", list);
		logger.info("Size : " + list.size());
		return "/transaction/repair_maintain_user";
	}
	
	@RequestMapping(value = "/transaction/add-repair-user", method = RequestMethod.POST)
	private @ResponseBody JsonResponse createCMSUser(@Valid @ModelAttribute("employee") ComplaintRepairEmployee employee, BindingResult result){
		logger.info("Add employee : " + employee);
		JsonResponse response = addUpdateCMSUser(employee, result, "add");
		return response;
	}
	
	@RequestMapping(value = "/transaction/update-repair-user", method = RequestMethod.POST)
	private @ResponseBody JsonResponse updateCMSUser( @RequestParam int id, @RequestParam String status){
		logger.info("Update employee : " + id + " - " + status);
		JsonResponse response = new JsonResponse();
		List<String> errors = new ArrayList<String>();
		if(status == null){
			errors.add( "status#Please Select Employee Type" );
			response.setStatus("FAIL");
		}else{
			cmsUserService.editEmployeeOfDept(id, status);
			response.setStatus("SUCCESS");
		}
			
		return response;
	}
	
	@RequestMapping(value = "/transaction/delete-cms-user", method = RequestMethod.POST)
	public String deleteCMSUser(@RequestParam Integer id){
		logger.info("delete-cms-user : " + id);
		cmsUserService.deleteEmployeeOfDept(id);
		return "redirect:/transaction/user-list";
	}
	
	
	@RequestMapping(value = "/transaction/get-user-of-dept", method = RequestMethod.POST)
	public @ResponseBody List<Employee> getEmployeeOfDept(@RequestParam Integer deptId){
		List<Employee> list = cmsUserService.getEmployeeOfDept(deptId);
		return list;
	}
	
	private JsonResponse addUpdateCMSUser(ComplaintRepairEmployee employee, BindingResult result, String operationType){
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
				cmsUserService.addEmployeeOfDept(employee);
			/*else
				cmsUserService.editEmployeeOfDept(employee);*/
				
			response.setStatus("SUCCESS");
			}
		return response;
	}
}
