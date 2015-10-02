<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 <!-- code start here  -->
          
     <div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Register Complaint</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<button onclick="document.getElementById('popup').style.display=''"
						style="margin-bottom: 5px" type="button"
						class="btn btn-success btn-sm" id="add-item-btn">
						<i class="fa fa-plus"></i> &nbsp;&nbsp;&nbsp; ADD
					</button>
				</div>
				<div class="col-lg-3 col-md-6"></div>
				<div class="col-lg-3 col-md-6"></div>

			</div>



			<!--Table Start Here  -->
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
							<div  id="table_panel_header" class="panel-heading"> </div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table col-sm-12 table-bordered table-striped table-condensed cf"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Action
											<th>Sr no.</th>
											<th>Complaint Date</th>
											<th>Name of Complainer</th>
											<th>Department</th>
											<th>Complaint Type</th>
											<th>Contact</th>
										</tr>
									</thead>
									
									<tbody>
									
									<c:set var="count" value="1"/>
									<c:forEach items="${list}" var="creg" > 
									<c:if test="${count %2 eq 0}">
										<tr class="odd gradeX">
											<td>
												<button type="button" class="btn btn-danger btn-circle"
												onclick="setComplaintId(${creg.id})"  data-toggle="modal" data-target="#myModal">
													<i class="fa fa-times fa-fw" ></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle"
												onclick="updateItem('${creg.id}','${creg.complaintDate}', '${creg.employeeName}', '${creg.deptId}', '${creg.complaintTypeId}','${creg.complaintDetails}','${creg.complaintLocation}','${creg.complainteePhoneNumber}')">
													<i class="fa fa-pencil fa-fw"></i>
												</button>
												<button type="button" class="btn btn-info btn-circle">
													<i class="fa fa-eye fa-fw"></i>
												</button>
											</td>
											<td>${creg.id}</td>
											<td>${creg.complaintDate}</td>
											<td>${creg.employeeName}</td>
											<td class="center">${creg.complaintDepartment}</td>
											<td class="center">${creg.complaintStatus}</td>
											<td class="center">${creg.complainteePhoneNumber}</td>
							 			</tr>
										</c:if>
										<c:if test="${count %2 ne 0}">
										<tr class="even gradeC">
											<td>
												<button type="button" class="btn btn-danger btn-circle"
												onclick="setComplaintId(${creg.id})" data-toggle="modal" data-target="#myModal">
													<i class="fa fa-times fa-fw"></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle"
												onclick="updateItem('${creg.id}','${creg.complaintDate}', '${creg.employeeName}', '${creg.deptId}', '${creg.complaintTypeId}','${creg.complaintDetails}','${creg.complaintLocation}','${creg.complainteePhoneNumber}')">
													<i class="fa fa-pencil fa-fw"></i>
												</button>
												<button type="button" class="btn btn-info btn-circle">
													<i class="fa fa-eye fa-fw"></i>
												</button>
											</td>
											<td>${creg.id}</td>
											<td>${creg.complaintDate}</td>
											<td>${creg.employeeName}</td>
											<td class="center">${creg.complaintDepartment}</td>
											<td class="center">${creg.complaintStatus}</td>
											<td class="center">${creg.complainteePhoneNumber}</td>
										</tr>
										</c:if>
										<c:set var="count" value="${count +1}"/>
										
										</c:forEach>
										


									</tbody>
								</table>
							</div>

							<!--Table End Here  -->

							<!-- Popup Start Here -->

							<div class="row" id="popup"
								style="position: absolute; width: 100%; top: 0px; display: none; z-index: 100">
								<div class="col-sm-2"></div>

								<div class="col-sm-6">
									<div class="panel panel-primary">
										<div class="panel-heading">Register Complaint</div>
										<div class="panel-body">
											<form:form commandName="complaint" action="./add-complaint-registration"	method="post" class="simple_form form-horizontal" modelAttribute="complaint">
											
											<!-- hidden fields defined here -->
											<input type="hidden" name="regId" id="regId" value="">
											
												<div style="display: none">
													<input name="utf8" type="hidden" value=""><input
														name="authenticity_token" type="hidden"
														value="l1ZnmS1VgwqvSJR3i7mBn76i4EUc4JwwwTqtIXwPE+o=">
												</div>

                                                  

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Complaint Date</label>
													<div class="col-sm-7">
														<div class='input-group date' >
															<input type="text" id="complainteDate" class="form-control"> <span
																class="input-group-addon"> <span
																class="glyphicon glyphicon-calendar"></span>
															</span>
														
														</div>
                                                         	<label for="complainteDate" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Name of Compaliner</label>
													<div class="col-sm-7">
														<input id="complainerName"  class="form-control" placeholder=" Compaliner"
															type="text">
<label for="complainerName" generated="true" class="error"></label>
													</div>
												</div>



												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Department :</label>
													<div class="col-sm-7">
														<form:select id="deptId" path="deptId" class="form-control">
															<option value="0" selected="selected">Disabled select</option>
														</form:select>
<label for="deptId" generated="true" class="error"></label>
													</div>
												</div>

												<div style=""
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Complaint Type :</label>
													<div class="col-sm-7">
														<select id="complaintTypeId" class="form-control">
																<option value="0" selected="selected">Disabled select</option>
														</select>
										<label for="complaintTypeId" generated="true" class="error"></label>
													</div>
												</div>


												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Complaint Details
														:</label>
													<div class="col-sm-7">
														<textarea id="complaintDetails" class="form-control" rows="3"
															style="margin: 0px -4px 0px 0px;"></textarea>
                                                      <label for="complaintDetails" generated="true" class="error"></label>
													</div>
												</div>


												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Location of
														Complaint :</label>
													<div class="col-sm-7">
														<input id="locationofComplaint" class="form-control"
															placeholder="Location of Complaint" type="text">
													  <label for="locationofComplaint" generated="true" class="error"></label>
													</div>
												</div>


												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Contact Number :</label>
													<div class="col-sm-7">
														<input id="contactNumber" class="form-control" placeholder="Contact Number"
															type="text">
 														<label for="complainteePhoneNumber" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password col-sm-6">
													<input class="btn btn-default" name="commit" type="button"
														value=" Add" id="add-btn"> <input class="btn btn-default"
														onclick="document.getElementById('popup').style.display='none'"
														name="commit" type="button" value="Cancel">

												</div>


											</form:form>
										</div>


									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>



<!-- delete div start -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<form action="../transaction/delete-complaint-registration" method="post" id="delete-form">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">Confirmation</h4>
						</div>
						<div class="modal-body">Delete this Item ?</div>
						<input type="hidden" name="id" id="deleteComplaintId">
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="cancel-btn">Cancel</button>
							<button type="button" class="btn btn-primary"
								onclick="deleteComplaint()">Delete</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</form>
		</div>
		<!-- delete div end -->
							<script type="text/javascript">
							var tempComplaintTypeId = '';
							
						            $(document).ready(function () {
						               
						            	$.ajax({
						        			url:"../all-complaint-department",
						        			type:"POST",
						        			success:function(response){
						        				//alert(JSON.stringify(response));
						        				var text = '';
						        				text += '<option value="0" selected="selected">Select Department</option>'
						        				$.each(response, function(index, dept){
						        					text += '<option value="'+dept.deptId+'">'+dept.deptName+'</option>'
						        				});
						        				$("#deptId").html(text);
						        				if("${complaint.deptId}" != 0)
						        					$("#deptId").val("${complaint.deptId}");	
						        			//	$("#deptId").val($("#deptId option:first").val());
						        			},
						        			error:function(){
						        				
						        			}
						        		});
						            	
						            	/* to add the calender on date */
						                $('#complainteDate').datepicker({
						                    format: "dd-mm-yyyy"
						                });  
						            	
						            	
						                $("#deptId").change(function(){
						        			var deptValue = $("#deptId").val();
						        			$("#complaintTypeId").empty();
						        			
						        			if(deptValue != 0){
						        				$.ajax({
						        					url:"../get-complaints",
						        					type:"POST",
						        					data:{"deptId" : deptValue},
						        					success:function(response){
						        						var text = '';
						        						text += '<option value="0" selected="selected">Select Complaint</option>';
						        						if(JSON.stringify(response) != '[]'){
						        							$.each(response, function(index, complaint){
						        								text += '<option value="'+complaint.id+'">'+complaint.complaintTypeName+'</option>'
						        							});
						        						}
						        						
						        						$("#complaintTypeId").html(text);
						        						if(tempComplaintTypeId != ''){
						        							$("#complaintTypeId").val(tempComplaintTypeId);
						        						}
						        						
						        					},
						        					error:function(){
						        						
						        					}
						        				});
						        			}else{
						        				$("#complaintTypeId").empty();
						        				var text = '';
						        				text += '<option value="0" selected="selected">Select Complaint</option>';
						        				$("#complaintTypeId").html(text);
						        			}
						        			
						                });		
						        			
						        			/* outer add button start action */
						        			
						        			/* click add button  start validation */
						        			
						        		
						        			
						        			/*clik add button end validation*/
						        			
						        			
						        			
						        			
						        			/* add action start  */
						        			$("#add-btn").click(function(){
												// 	alert('Add-btn');
						        				var complainteDate = $("#complainteDate").val();
						        				var complainerName = $("#complainerName").val();
						        				var regId = $("#regId").val();
						        				var complainerId = 1;
						        				
						        				//hardcoded status pending
						        				var complaintStatusId = 1;
						        				var complaintTypeId = $("#complaintTypeId").val();
						        				var complaintDetails = $("#complaintDetails").val();
						        				var locationofComplaint = $("#locationofComplaint").val();
						        				var contactNumber = $("#contactNumber").val();
						        				var deptId = $("#deptId").val();
						        				alert(complainerId +'  - ' +regId+' - '+
						        						complainteDate + " - " + complainerName + " - " + complaintTypeId
						        						+ ' -  ' +complaintDetails + " - " + locationofComplaint + " - " + contactNumber
						        						);
						        				
						        				
						        				/* if(ajaxProperties.operationType == "add")
						        			    	ajaxProperties.data = {"deptId": deptId, };
						        				else */
						        					ajaxProperties.data = {"complaintDate":complainteDate, "deptId":deptId, "complaintTypeId":complaintTypeId,  "complaintDetails":complaintDetails,
						        						"id":regId, "complaintStatusId":complaintStatusId,"complainteeId":complainerId,"complaintLocation":locationofComplaint, "complainteePhoneNumber":contactNumber};
						        				
						        				doAjaxPost();
						        			});
						        			
						        			/* add end here */
						        			
// 						        		});
						            	
	
	 $("#add-item-btn").click(function(){
		$("#regId").val('0');
		$("#complainteDate").val('');
		$("#complainerName").val('');
		$("#complaintTypeId").val('');
		$("#complaintTypeId").val($("#complaintTypeId option:first").val());
		$("#complaintDetails").val('');
		$("#locationofComplaint").val('');
		$("#contactNumber").val('');
		
		ajaxProperties.url = "../transaction/add-complaint-registration";
	    ajaxProperties.formType = "complaint-register";
	    ajaxProperties.operationType = "add";
	    
	    $("[for='regId']").html('');
        $("[for='complainteDate']").html('');
        $("[for='complainerName']").html('');
        $("[for='complaintTypeId']").html('');
        $("[for='complaintDetails']").html('');
        $("[for='locationofComplaint']").html('');
        $("[for='contactNumber']").html('');
        
		$("#add-btn").val('Add');
		$("#popup").css('display', '');
		/* $("#itemId").val(0);
		
		validator.resetForm(); */
		/* tempComplaintTypeId = ''; */
	});
					        			/* outer add button end  */
						            });
						            
						            
		
								/* To Add record ajax start */

						            var ajaxProperties = {url:"", data:"", formType:"", operationType:""};

						            function doAjaxPost() {

						            	    $.ajax({
						            	        type: "POST",
						            	        url: ajaxProperties.url,
						            	        data: ajaxProperties.data,
						            	        success: function(response){
						            	            alert(JSON.stringify(response));
						            	        	setResponse(ajaxProperties.formType, JSON.stringify(response));
						            	         },
						            	         error: function(e){
						            	             alert('Error: ' + e);
						            	         }
						            	    });
						            	}

						            function setResponse(formType, response){
						            	
						            	response = JSON.parse(response);
						            	
						            	switch(formType){
						            		
						            	case "complaint-register":{
						            		
						            		// remove the error label if any before action
						            		 $("[for='regId']").html('');
						            	        $("[for='complainteDate']").html('');
						            	        $("[for='complainerName']").html('');
						            	        $("[for='complaintTypeId']").html('');
						            	        $("[for='complaintDetails']").html('');
						            	        $("[for='locationofComplaint']").html('');
						            	        $("[for='contactNumber']").html('');
						            	        
						            	        
						                   // console.log(response);
						                    if(response.status == "SUCCESS"){
						                        location.href = '../transaction/complaints-register';
						                     }else{
						                    	 $.each(response.result, function(index, errorString){
						                    		 
						                    		 var array = errorString.split("#");
						                    		 $('[for="' +array[0]+ '"]').html(array[1]);
						                    	 });
						                    	 
						                     }
						            	}
						            	break;
						            
						            	}
						            }
										/* To Add record ajax End  */
						            	/*set data on popup start */
							function updateItem(regId, complaintDate, employeeName, deptId, complaintTypeId, complaintDetails, complaintLocation, complainteePhoneNumber)
							{
// 							alert(regId+" - "+complaintDate+ " - "+employeeName+ " - "+deptId+ " - "+complaintTypeId+ " - "+complaintDetails+ " - "+complaintLocation + " - "+ complainteePhoneNumber + " - " + complainteePhoneNumber);
							tempComplaintTypeId =  complaintTypeId;
							
							$("#regId").val(regId);
							$("#deptId").val(deptId).change();
							$("#complaintTypeId").val(complaintTypeId).change();
							$("#complainteDate").val(complaintDate);
							$("#complainerName").val(employeeName);
							$("#complaintDetails").val(complaintDetails);
							$("#locationofComplaint").val(complaintLocation);
							$("#contactNumber").val(complainteePhoneNumber);
							
							ajaxProperties.url = "../transaction/update-complaint-registration";
						    ajaxProperties.formType = "complaint-register";
						    ajaxProperties.operationType = "update";
						    
						    $("[for='regId']").html('');
					        $("[for='deptId']").html('');
					        $("[for='itemCode']").html('');
					        $("[for='complainteDate']").html('');
					        $("[for='complaintDetails']").html('');
					        $("[for='locationofComplaint']").html('');
					        $("[for='contactNumber']").html('');
// 					        $("[for='currentStock']").html('');
					        
							//$("#deptId").val('0');
							$("#add-btn").val('Update');
							//$("#complaintTypeName").val('');
							$("#popup").css('display', '');
							
						}
											           
											         
						/* set data on popup end */
						
						/* delete start */
						function setComplaintId(complaintId){
		console.log('complaintId : ' + complaintId);
		deleteComplaintId = complaintId;
	}
						
						
						var deleteComplaintId = 0;
						
						function deleteComplaint(){
							console.log('deleteComplaintId : ' + deleteComplaintId);
							$("#deleteComplaintId").val(deleteComplaintId)
							//alert($("#delete-deptId").val());
							$("#delete-form").submit();
						}
						/* delete start */    
						        </script>
							<!--Popup End Her  -->
							
							<!-- /.row -->

							<!-- /.panel-footer -->
						</div>
						<!-- /.panel .chat-panel -->
					</div>
					<!-- /.col-lg-4 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /#page-wrapper -->

		</div>
		<!-- /#wrapper -->
     <!-- Code End here -->
 
 
 
    </tiles:putAttribute>
</tiles:insertDefinition>