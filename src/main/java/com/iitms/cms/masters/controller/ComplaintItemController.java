package com.iitms.cms.masters.controller;

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
import com.iitms.cms.masters.service.ComplaintItemService;
import com.iitms.cms.util.JsonResponse;

@Controller
//@RequestMapping("/item")
public class ComplaintItemController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComplaintDepartmentController.class);
	@Autowired
	private ComplaintItemService complaintItemService;
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value = "/complaint-items", method = RequestMethod.GET)
	public String getComplaintItemForm(@RequestParam(name = "complaint-id", required = false, defaultValue = "0") int complaintId,
			@RequestParam(name = "op", required = false, defaultValue = "") String operation,Model model){
		logger.info("Complaint Id : " + complaintId);
		List<ComplaintItemEntity> list = complaintItemService.listComplaintItem();
		ComplaintItemEntity entity = new ComplaintItemEntity();
		/*if(complaintId != 0){
			entity = complaintItemService.getComplaintItem(complaintId);
			model.addAttribute("operation", "edit");
		}
		else if(operation.equals("add")){
			model.addAttribute("operation", "add");
			entity = new ComplaintItemEntity();
		}*/
			
		
			model.addAttribute("complaintItem", entity);
		model.addAttribute("list", list);
		return "complaint-items";
		//return "register_complaint";
	}
	
	@RequestMapping(value = "/add-item", method = RequestMethod.POST)
	public @ResponseBody JsonResponse addComplaintItem(@Valid @ModelAttribute("complaintItem") ComplaintItemEntity complaintItem,
			BindingResult result, Model model){
		
		logger.info("complaintItem : " + complaintItem + " Error : " + result.hasErrors() +  " - "  + result.hasFieldErrors("itemCode"));
		
		JsonResponse response = addUpdateItem(complaintItem, result, "add");
		return response;
	}
	
	@RequestMapping(value = "/delete-item", method = RequestMethod.POST)
	public String deleteComplaintItem(@RequestParam Integer  complaintItemId){
		logger.info("Delete Item : " + complaintItemId);
		complaintItemService.deleteComplaintItem(complaintItemId);
		return "redirect:/complaint-items";
	}
	
	@RequestMapping(value = "/update-item", method = RequestMethod.POST)
	public @ResponseBody JsonResponse updateComplaintItem(@Valid @ModelAttribute("complaintItem") ComplaintItemEntity complaintItem,
			BindingResult result, @RequestParam(required  = false) Integer  itemId,  Model model){
		logger.info("complaintItem : " + complaintItem);
		
		JsonResponse response = addUpdateItem(complaintItem, result, "edit");
		return response;
	}
	
	private JsonResponse addUpdateItem(ComplaintItemEntity complaintItem, BindingResult result, String operationType){
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
				complaintItemService.addComplaintItem(complaintItem);
			else
				complaintItemService.updateComplaintItem(complaintItem);
				
			response.setStatus("SUCCESS");
			}
		return response;
	}
}
