<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

		<!-- code start here  -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Complaint Types</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<button id="add-complaint-btn"
						onclick="document.getElementById('popup').style.display=''"
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
							<div  id="table_panel_header" class="panel-heading"> </div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Action
											<th>Sr no.</th>
											<th>Complaint Type</th>
											<th>Department Name</th>

										</tr>
									</thead>
									<tbody>

										<c:set var="count" value="1" />
										<c:forEach items="${list}" var="compliant">
											<c:if test="${count%2 eq 0 }">
												<tr class="odd gradeC">
													<td>
														<button type="button" class="btn btn-danger btn-circle"
															data-toggle="modal" data-target="#myModal"
															onclick="setComplaintId(${compliant.id})">
															<i class="fa fa-times fa-fw"></i>
														</button>
														<button type="button" class="btn btn-warning btn-circle"
															id="update-compliant"
															onclick="updateComplaint(${compliant.id}, '${compliant.complaintTypeName}', ${compliant.deptId} )">
															<i class="fa fa-edit fa-fw"></i>
														</button>
													</td>
													<td>${compliant.id}</td>
													<td>${compliant.complaintTypeName}</td>
													<td>${compliant.deptName}</td>

												</tr>
											</c:if>

											<c:if test="${count%2 ne 0 }">
												<tr class="odd gradeC">
													<td>
														<button type="button" class="btn btn-danger btn-circle"
															data-toggle="modal" data-target="#myModal"
															onclick="setComplaintId(${compliant.id})">
															<i class="fa fa-times fa-fw"></i>
														</button>
														<button type="button" class="btn btn-warning btn-circle"
															id="update-item"
															onclick="updateComplaint(${compliant.id}, '${compliant.complaintTypeName}', ${compliant.deptId} )">
															<i class="fa fa-edit fa-fw"></i>
														</button>
													</td>
													<td>${compliant.id}</td>
													<td>${compliant.complaintTypeName}</td>
													<td>${compliant.deptName}</td>

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
								style="position: absolute; height: 100%; width: 100%; top: 0px; display: none; z-index: 100">
								<div class="col-sm-2"></div>

								<div class="col-sm-6">
									<div class="panel panel-primary">
										<div class="panel-heading">Department</div>
										<div class="panel-body">
											<form:form commandName="complaint" id="add-update-form"
												action="./add-complaint" method="post"
												class="simple_form form-horizontal"
												modelAttribute="complaint">
												<div id="error" class="error">
													<!-- <input name="utf8" type="hidden" value=""><input
														name="authenticity_token" type="hidden"
														value="l1ZnmS1VgwqvSJR3i7mBn76i4EUc4JwwwTqtIXwPE+o="> -->
														
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for="user_horizontal_password"> Department Type</label>
													<div class="col-sm-7">
														
														<input type="hidden" id="id" name="id" value="${complaint.id}">
														<form:select path="deptId" id="deptId"
															class="form-control">

														</form:select>
														<%-- <form:errors path="deptId" cssClass="error"/> --%>
														<label for="deptId" generated="true" class="error"></label>
													</div>
												</div>

												<div class="form-group email required user_horizontal_email">
													<label class="email required col-sm-5 control-label"
														for="user_horizontal_email"> Complaint Type</label>
													<div class="col-sm-7">
														<!-- <input class="string email required form-control"
															id="user_horizontal_email" name="user_horizontal[email]"
															placeholder="Department Name" type="email"> -->
														<form:input path="complaintTypeName"
															id="complaintTypeName" placeholder="Complaint Name"
															class="form-control" />
															<%-- <form:errors path="complaintTypeName" cssClass="error"/>
															<c:if test="${flag eq true }">
																<span id="exist-complaint-error" class="error" >Complaint Type Already Exist.</span>
															</c:if> --%>
															<label for="complaintTypeName" generated="true" class="error"></label>
													</div>
												</div>


												<div
													class="form-group password required user_horizontal_password col-sm-6">
													<input class="btn btn-default" name="commit" type="button"
														value=" Add" id="add-btn" > <input
														class="btn btn-default"
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

		<!-- delete div start -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<form action="./delete-complaint" method="post" id="delete-form">
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
    
	$(document).ready(function(){
		
		$('#dataTables-example').DataTable({
            responsive: true
    });
		
		$.ajax({
			url:"./all-complaint-department",
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
		
		
		$("#add-complaint-btn").click(function(){
			ajaxProperties.url = "./add-complaint";
		    ajaxProperties.formType = "complaint-type";
		    ajaxProperties.operationType = "add";
		    
		    $("[for='deptId']").html('');
	        $("[for='complaintTypeName']").html('');
	        
			$("#deptId").val('0');
			$("#add-btn").val('Add');
			$("#complaintTypeName").val('');
			
			
		});
		
		$("#cancel-btn").click(function(){
			$("#deptname").val('');
		});
		
		$("#add-btn").click(function(){
			//alert('Add-btn');
			var id = $("#id").val();
			var deptId = $("#deptId").val();
			var complaintTypeName = $("#complaintTypeName").val();
			
			//alert(id + " - " + deptId + " - " + complaintTypeName);
			
			if(ajaxProperties.operationType == "add")
		    	ajaxProperties.data = {"deptId": deptId, "complaintTypeName":complaintTypeName};
			else
				ajaxProperties.data = {"id":id, "deptId": deptId, "complaintTypeName":complaintTypeName};
			
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
	
	var deleteComplaintId = 0;
	
	function deleteComplaint(){
		console.log('deleteComplaintId : ' + deleteComplaintId);
		$("#deleteComplaintId").val(deleteComplaintId)
		//alert($("#delete-deptId").val());
		$("#delete-form").submit();
	}
	
	function setComplaintId(complaintId){
		console.log('complaintId : ' + complaintId);
		deleteComplaintId = complaintId;
	}
	
	function updateComplaint(id, complaintTypeName, deptId){
		$("#id").val(id);
		 $("#deptId").val(deptId);
		$("#complaintTypeName").val(complaintTypeName);
		$("#add-btn").val('Update');
		$("#popup").css('display', '');
		
		$("[for='deptId']").html('');
        $("[for='complaintTypeName']").html('');
		//location.href = "./complaint-type?complaintTypeId=" + id;
		ajaxProperties.url = "./update-complaint";
	    ajaxProperties.formType = "complaint-type";
	    ajaxProperties.operationType = "edit";
	    
	}
	

	
</script>
		<a href="#myModal" id="edit-href"
			onclick="document.getElementById('popup').style.display=''"
			hidden="hidden"></a>

	</tiles:putAttribute>
</tiles:insertDefinition>