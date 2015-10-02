<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
    
    	<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">User Credential</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<button id="add-repair-user-btn" onclick="document.getElementById('popup').style.display=''"
						style="margin-bottom: 5px" type="button"
						class="btn btn-success btn-sm">
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
						<div class="panel-heading">Item Master</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Action
											<th>Sr no.</th>
											<!-- <th>Admin Name</th> -->
											<th>Employee Name</th>
											<th>Status</th>											
											<th>Department</th>
										</tr>
									</thead>
									<tbody>
									<c:set var="count" value="1" />
										<c:forEach items="${list}" var="user">
											<c:if test="${count%2 eq 0 }">
												<tr class="even gradeC">
													<td>
														<button type="button" class="btn btn-danger btn-circle"
															data-toggle="modal" data-target="#myModal"
															onclick="setRepairUser(${user.id})">
															<i class="fa fa-times fa-fw"></i>
														</button>
														<button type="button" class="btn btn-warning btn-circle"
															id="update-compliant"
															onclick="updateRepairUser(${user.id}, '${user.deptName}','${user.employee}', '${user.status}' )">
															<i class="fa fa-edit fa-fw"></i>
														</button>
													</td>
													<td>${count}</td>
													<td>${user.employee}</td>
													<td>${user.status}</td>
													<td>${user.deptName}</td>
													

												</tr>
											</c:if>

											<c:if test="${count%2 ne 0 }">
												<tr class="odd gradeC">
													<td>
														<button type="button" class="btn btn-danger btn-circle"
															data-toggle="modal" data-target="#myModal"
															onclick="setRepairUser(${user.id})">
															<i class="fa fa-times fa-fw"></i>
														</button>
														<button type="button" class="btn btn-warning btn-circle"
															id="update-compliant"
															onclick="updateRepairUser(${user.id}, '${user.deptName}','${user.employee}', '${user.status}' )">
															<i class="fa fa-edit fa-fw"></i>
														</button>
													</td>
													<td>${count}</td>
													<td>${user.employee}</td>
													<td>${user.status}</td>
													<td>${user.deptName}</td>

												</tr>
											</c:if>
											<c:set var="count" value="${count + 1 }" />
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
										<div class="panel-heading">User Credential</div>
										<div class="panel-body">
											<form:form commandName="repairEmployee" action=""
												method="post" class="simple_form form-horizontal"
												modelAttribute="repairEmployee">
												<!-- <div style="display: none">
													<input name="utf8" type="hidden" value=""><input
														name="authenticity_token" type="hidden"
														value="l1ZnmS1VgwqvSJR3i7mBn76i4EUc4JwwwTqtIXwPE+o=">
												</div> -->

												<input type="hidden" id="id" name="id" value="${repairEmployee.id}">
												<div class="form-group email required user_horizontal_email">
													<label class="email required col-sm-5 control-label"
														for="user_horizontal_email"> Department Name</label>
													<div class="col-sm-7">
														<form:select path="deptId" id="deptId" class="form-control">

														</form:select>
														<label for="deptId" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Employee Name</label>
													<div class="col-sm-7">
														<form:select path="employeeId" id="employeeId" class="form-control">
																<option value="0" selected="selected">Select Employee</option>
														</form:select>
														<label for="employeeId" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password">Employee </label>
													<div class="col-sm-3">
														<!-- <input type="radio" name="status" value="Employee"></input> -->
														<form:radiobutton path="status" id="status" value="Employee" class="radio"/>		
													</div>
													
													
													<label class="password required  control-label"
														for="user_horizontal_password">Admin</label>
														
														<!-- <input type="radio" name="status" value="Admin"></input> -->
														<form:radiobutton path="status" id="status" value="Admin" class="radio"/>
													
													<label for="status" generated="true" class="error"></label>
												</div>



												<!-- <div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Entry For :</label>
													<div class="col-sm-7">
														<select id="disabledSelect" class="form-control">
															<option>Disabled select</option>
														</select>

													</div>
												</div> -->
												<div
													class="form-group password required user_horizontal_password col-sm-6">
													<input id="add-btn" class="btn btn-default" name="commit" type="button"
														value=" Create"> <input class="btn btn-default"
														onclick="document.getElementById('popup').style.display='none'"
														name="commit" type="button" value="Cancel">

												</div>


											</form:form>
										</div>


									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
							<!--Popup End Her  -->
							<!-- /.row -->

						<div class="row" id="edit-popup"
								style="position: absolute; width: 100%; top: 0px; display: none; z-index: 100">
								<div class="col-sm-2"></div>

								<div class="col-sm-6">
									<div class="panel panel-primary">
										<div class="panel-heading">User Credential</div>
										<div class="panel-body">
											
												<form action="" class="simple_form form-horizontal">

												<input type="hidden" id="repair-user-id" name="id" value="${repairEmployee.id}">
												<div class="form-group email required user_horizontal_email">
													<label class="email required col-sm-5 control-label"
														for="user_horizontal_email"> Department Name</label>
													<div class="col-sm-7">
														<input type="text" id="repair-user-dept-name" class="form-control" disabled="disabled">
													</div>
												</div>
												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Employee Name</label>
													<div class="col-sm-7">
														<input type="text" id="repair-user-employee-name" class="form-control" disabled="disabled">
														<label for="employeeId" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password">Employee </label>
													<div class="col-sm-3">
														<!-- <input type="radio" name="status" value="Employee"></input> -->
														<input type="radio" id="repair-user-status" name="repair-user-status" value="Employee">		
													</div>
													
													
													<label class="password required  control-label"
														for="user_horizontal_password">Admin</label>
														
													<input type="radio" id="repair-user-status" value="Admin" name="repair-user-status">
													<label for="repair-user-status" generated="true" class="error"></label>
												</div>



												<!-- <div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Entry For :</label>
													<div class="col-sm-7">
														<select id="disabledSelect" class="form-control">
															<option>Disabled select</option>
														</select>

													</div>
												</div> -->
												<div
													class="form-group password required user_horizontal_password col-sm-6">
													<input id="update-btn" class="btn btn-default" name="commit" type="button"
														value=" Create"> <input class="btn btn-default"
														onclick="document.getElementById('edit-popup').style.display='none'"
														name="commit" type="button" value="Cancel">

												</div>


											</form>
										</div>


									</div>
								</div>
							</div>
							
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
    
    <!-- Model Dialog -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<form action="./delete-cms-user" method="post" id="delete-form">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">Confirmation</h4>
                                        </div>
                                        <div class="modal-body">
                                            Delete this Item ?
                                        </div>
                                        <input type="hidden" name="id" id="deleteRepairUserId">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel-btn">Cancel</button>
                                            <button type="button" class="btn btn-primary" onclick="deleteRepairUser()">Delete</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                    </form>            
                            </div>
                            
    <script
			src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
		
		<script
			src="<c:url value="/resources/utils/add-record-ajax.js"/>"></script>
		
		<style type="text/css">
.error {
	color: red;
}
</style>

		<script type="text/javascript">
    var validator;
    var tempEmployeeId;
    
	$(document).ready(function(){
		
		$('#dataTables-example').DataTable({
            responsive: true
    });
		
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
				
			//	$("#deptId").val($("#deptId option:first").val());
			},
			error:function(){
				
			}
		});
		
		$("#deptId").change(function(){
			var deptValue = $("#deptId").val();
			$("#employeeId").empty();
			
			if(deptValue != 0){
				$.ajax({
					url:"./get-user-of-dept",
					type:"POST",
					data:{"deptId" : deptValue},
					success:function(response){
						var text = '';
						text += '<option value="0" selected="selected">Select Complaint</option>';
						if(JSON.stringify(response) != '[]'){
							$.each(response, function(index, employee){
								text += '<option value="'+employee.id+'">'+employee.employeeName+'</option>'
							});
						}
						
						$("#employeeId").html(text);
						/* if(tempeId != ''){
							$("#employeeId").val(tempEmployeeId);
						} */
						
					},
					error:function(){
						
					}
				});
			}else{
				//alert('change');
				$("#employeeId").empty();
				var text = '';
				text += '<option value="0" selected="selected">Select Employee</option>';
				$("#employeeId").html(text);
			}
			
		});
		
		$("#add-repair-user-btn").click(function(){
			ajaxProperties.url = "./add-repair-user";
		    ajaxProperties.formType = "create-user";
		    ajaxProperties.operationType = "add";
		    
		    $("[for='deptId']").html('');
	        $("[for='employeeId']").html('');
	        $("[for='status']").html('');
	        
			$("#deptId").val('0');
			$("#add-btn").val('Add');
			
			$('.radio').prop('checked', false);
		});
		
		$("#cancel-btn").click(function(){
			//$("#deptname").val('');
		});
		
		$("#add-btn").click(function(){
			//alert
			var id = $("#id").val();
			var deptId = $("#deptId").val();
			var employeeId = $("#employeeId").val();
			var status = $('input[type="radio"]:checked:first').val();
		//	alert(status);
				ajaxProperties.data = {"id":id, "deptId": deptId, "employeeId":employeeId, "status":status};
		
			doAjaxPost();
		});
		
		$("#update-btn").click(function(){
			
			var id = $("#repair-user-id").val();
			var status = $('input:radio[name=repair-user-status]:checked').val();
			//alert(status);
				ajaxProperties.data = {"id":id, "status":status};
		
			doAjaxPost();
		});
		
		
		if("${operation}" == "add"){
			$("#popup").css('display', '');
			$("#add-update-form").prop("action", "./add-complaint");
			$("#add-btn").val('Add');
		}
		
		if("${operation}" == "edit"){
			$("#popup").css('display', '');
			$("#add-update-form").prop("action", "./update-complaint");
			$("#add-btn").val('Update');
		}
		
		
		//
		if($("#complaintTypeName").val() == ''){
			$("#exist-complaint-error").hide();
		}
	});
	
	var deleteRepairUserId = 0;
	
	function deleteRepairUser(){
		console.log('deleteComplaintId : ' + deleteRepairUserId);
		$("#deleteRepairUserId").val(deleteRepairUserId)
		//alert($("#delete-deptId").val());
		$("#delete-form").submit();
	}
	
	function setRepairUser(id){
		console.log('deleteRepairUser : ' + id);
		deleteRepairUserId = id;
	}
	
	function updateRepairUser(id, deptName, employee, status){
		tempEmployeeId =  id;
	//	alert(status == 'Employee');
		$("#repair-user-id").val(id);
		$("#repair-user-dept-name").val(deptName);
		$("#repair-user-employee-name").val(employee);
		if(status == 'Employee'){
			$('[value="Employee"]').attr('checked',true);
		}else
			$('[value="Admin"]').attr('checked',true);
		
	//	$("#repair-user-status").val(id);
		 //$("#deptId").val(deptId);
		//$("#employeeId").val(complaintTypeName);
		$("#update-btn").val('Update');
		//$("#popup").css('display', '');
		
		$("[for='deptId']").html('');
        $("[for='employeeId']").html('');
        $("[for='repair-user-status']").html('');
		//location.href = "./complaint-type?complaintTypeId=" + id;
		ajaxProperties.url = "./update-repair-user";
	    ajaxProperties.formType = "create-user";
	    ajaxProperties.operationType = "edit";
	    
	    $("#edit-popup").css('display', '');
	}
	

	
</script>
     </tiles:putAttribute>
</tiles:insertDefinition>   


