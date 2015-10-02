<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
 
 <!-- code start here  -->
          <div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Complaint Item</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<!-- <button id="add-item-btn" onclick="document.getElementById('popup').style.display=''" style="margin-bottom: 5px" type="button"
						class="btn btn-success btn-sm"> -->
						<button id="add-item-btn"  style="margin-bottom: 5px" type="button"
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
											<th>Item Code</th>
											<th>Item Name</th>
											<th>Current Stock</th>
											<th>Unit</th>
											<th>Department</th>
										</tr>
									</thead>
									<tbody>
										<!-- <tr class="odd gradeX">
											<td>
												<button type="button" class="btn btn-danger btn-circle">
													<i class="fa fa-times fa-fw"></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle">
													<i class="fa fa-edit fa-fw"></i>
												</button>
											</td>
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
											<td class="center">X</td>
										</tr> -->
									
									<c:forEach items="${list}" var="item">
										<tr class="odd gradeX">
											<td>
												<button type="button" class="btn btn-danger btn-circle" data-toggle="modal" data-target="#myModal" onclick="setItemId(${item.itemId})">
													<i class="fa fa-times fa-fw"></i>
												</button>
												<button type="button" class="btn btn-warning btn-circle" id="update-item" 
												onclick="updateItem(${item.itemId}, '${item.itemCode}', '${item.itemName}', ${item.minStock}, ${item.maxStock}, ${item.currentStock}, '${item.itemUnit}', ${item.deptId }, ${item.complaintTypeId } )">
													<i class="fa fa-edit fa-fw" ></i>
												</button>
											</td>
											<td>${item.itemId}</td>
											<td>${item.itemCode}</td>
											<td>${item.itemName}</td>
											<td class="center">${item.currentStock}</td>
											<td class="center">${item.itemUnit}</td>
											<td class="center">${item.deptName}</td>
										</tr>
									</c:forEach>	
										

									</tbody>
								</table>
							</div>

							<!--Table End Here  -->

							<!-- Popup Start Here -->

							<div class="row"   id="popup" style=" position: absolute; width: 100%;top: 0px;display:none;z-index: 100">
								<div class="col-sm-2"></div>

								<div class="col-sm-6">
									<div class="panel panel-primary">
										<div class="panel-heading" id="popup-title">Add Item</div>
										<div class="panel-body">
											<form:form commandName="complaintItem" action="./add-item" method="post" class="simple_form form-horizontal"  id="add-update-form">
												<div style="display: none">
													<!-- <input name="utf8" type="hidden" value=""><input
														name="authenticity_token" type="hidden"
														value="l1ZnmS1VgwqvSJR3i7mBn76i4EUc4JwwwTqtIXwPE+o="> -->
												</div>


												<div class="form-group email required user_horizontal_email">
												<input type="hidden" name="itemId" id="itemId" value="${complaintItem.itemId}">
													<label class="email required col-sm-5 control-label"
														for=""> Department Name</label>
													<div class="col-sm-7">
														<form:select id="deptId" path="deptId" itemValue="deptId"  class="form-control">
															<!-- <option>Disabled select</option> -->
														</form:select>
														<%-- <form:errors path="deptId" cssClass="error"/> --%>
														<label for="deptId" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Complaint Type</label>
													<div class="col-sm-7">
														<form:select id="complaintTypeId" path="complaintTypeId" class="form-control">
															<!-- <option>Disabled select</option> -->
															<form:option value="0" selected="selected"></form:option>
														</form:select>
														<label for="complaintTypeId" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Item Code</label>
													<div class="col-sm-7">
														<!-- <input class="password required form-control"
															id="user_horizontal_password"
															name="user_horizontal[password]" placeholder=" Item Code"
															type="password"> -->
														<form:input path="itemCode" id="itemCode" placeholder=" Item Code" class="form-control"/>
														<%-- <form:errors path="itemCode" cssClass="error"/> --%>
														<label for="itemCode" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Item Name</label>
													<div class="col-sm-7">
														<!-- <input class="password required form-control"
															id="user_horizontal_password"
															name="user_horizontal[password]" placeholder="Item Name"
															type="password"> -->
														<form:input path="itemName" id="itemName" placeholder=" Item Name" class="form-control"/>
														<%-- <form:errors path="itemName" cssClass="error"/> --%>
														<label for="itemName" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Item Unit</label>
													<div class="col-sm-7">
														<form:select path="itemUnit" id="itemUnit" class="form-control" >
															<form:option value="" selected="selected">Select Item Unit</form:option>
															<form:option value="Qty">Qty</form:option>
															<form:option value="kg">kg</form:option>
														</form:select>
														<%-- <form:errors path="itemUnit" cssClass="error"/> --%>
														<label for="itemUnit" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Maximum Stock</label>
													<div class="col-sm-7">
														<!-- <input class="password required form-control"
															id="user_horizontal_password"
															name="user_horizontal[password]"
															placeholder="Maximum Stock" type="password"> -->
														<form:input path="maxStock" id="maxStock" value="" class="password required form-control" placeholder="Maximum Stock"/>
													    <%-- <form:errors path="maxStock" cssClass="error"/> --%>
													    <label for="maxStock" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Minimum Stock</label>
													<div class="col-sm-7">
														<!-- <input class="password required form-control"
															id="user_horizontal_password"
															name="user_horizontal[password]"
															placeholder=" Minimum Stock" type="password"> -->
														<form:input path="minStock" id="minStock" value="" class="password required form-control" placeholder=" Minimum Stock"/>
													     <%-- <form:errors path="minStock" cssClass="error"/> --%>
													     <label for="minStock" generated="true" class="error"></label>
													</div>
												</div>

												<div
													class="form-group password required user_horizontal_password">
													<label class="password required col-sm-5 control-label"
														for=""> Current Stock</label>
													<div class="col-sm-7">
														<!-- <input class="password required form-control"
															id="user_horizontal_password"
															name="user_horizontal[password]"
															placeholder="Current Stock" type="password"> -->
														<form:input path="currentStock" id="currentStock" value=""  class="password required form-control" placeholder="Current Stock"/>
													    <%-- <form:errors path="currentStock" cssClass="error"/> --%>
													    <label for="currentStock" generated="true" class="error"></label>
													</div>
												</div>
												
												
												<div class="form-group password required user_horizontal_password col-sm-6">
													<input class="btn btn-default" name="commit" type="button"
													value=" Add" id="add-btn">
													
															<input class="btn btn-default" onclick="document.getElementById('popup').style.display='none'" name="commit" type="button"
													value="Cancel" >

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

	<!-- Model Dialog -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		<form action="./delete-item" method="post" id="delete-form">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">Confirmation</h4>
                                        </div>
                                        <div class="modal-body">
                                            Delete this Item ?
                                        </div>
                                        <input type="hidden" name="complaintItemId" id="complaintItemId">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" id="cancel-btn">Cancel</button>
                                            <button type="button" class="btn btn-primary" onclick="deleteItem()">Delete</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                    </form>            
                            </div>
     
     <!-- Code End here -->
 
 <!-- other code start here -->
 
<a href="#myModal" id="edit-href" onclick="document.getElementById('popup').style.display=''"></a>

	
 
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
  <script
			src="<c:url value="/resources/utils/add-record-ajax.js"/>"></script>
			  
    <style type="text/css">
    .error{
    color: red;
    }
    </style>
    
    <script type="text/javascript">
    var validator;
    var tempComplaintTypeId = '';
    
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
				if("${complaintItem.deptId}" != 0)
					$("#deptId").val("${complaintItem.deptId}");	
				
				if("${complaintItem.complaintTypeId}" != 0){
					$("#deptId").change();
					$("#complaintTypeId").val("${complaintItem.complaintTypeId}");
				}
					
				
				
				//alert("${complaintItem.complaintTypeId}");
			},
			error:function(){
				
			}
		});
		
		$("#deptId").change(function(){
			var deptValue = $("#deptId").val();
			$("#complaintTypeId").empty();
			
			if(deptValue != 0){
				$.ajax({
					url:"./get-complaints",
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
		
		/* $("#deptId").select2(""); */
		//$("#deptId").change();
		
		$("#add-item-btn").click(function(){
			$("#itemId").val('0');
			$("#deptId").val($("#deptId option:first").val());
			$("#complaintTypeId").empty();
			$("#complaintTypeId").append(new Option("Select Complaint", "0"));
			$("#itemCode").val('');
			$("#itemName").val('');
			$("#itemUnit").val($("#itemUnit option:first").val());
			$("#minStock").val('');
			$("#maxStock").val('');
			$("#currentStock").val('');
			
			ajaxProperties.url = "./add-item";
		    ajaxProperties.formType = "complaint-item";
		    ajaxProperties.operationType = "add";
		    
		    $("[for='deptId']").html('');
	        $("[for='complaintTypeId']").html('');
	        $("[for='itemCode']").html('');
	        $("[for='itemName']").html('');
	        $("[for='itemUnit']").html('');
	        $("[for='maxStock']").html('');
	        $("[for='minStock']").html('');
	        $("[for='currentStock']").html('');
	        
			//$("#deptId").val('0');
			$("#add-btn").val('Add');
			//$("#complaintTypeName").val('');
			$("#popup").css('display', '');
			/* $("#itemId").val(0);
			
			validator.resetForm(); */
			tempComplaintTypeId = '';
		});
		
		$("#add-btn").click(function(){
			//alert('Add-btn');
			var itemId = $("#itemId").val();
			var deptId = $("#deptId").val();
			var complaintTypeId = $("#complaintTypeId").val();
			var itemCode = $("#itemCode").val();
			var itemName = $("#itemName").val();
			var itemUnit = $("#itemUnit").val();
			var minStock = $("#minStock").val();
			var maxStock = $("#maxStock").val();
			var currentStock = $("#currentStock").val();
			
			//alert(id + " - " + deptId + " - " + complaintTypeName);
			
			/* if(ajaxProperties.operationType == "add")
		    	ajaxProperties.data = {"deptId": deptId, };
			else */
				ajaxProperties.data = {"itemId":itemId, "deptId":deptId, "complaintTypeId":complaintTypeId, 
					"itemCode":itemCode, "itemName":itemName, "itemUnit":itemUnit, "minStock":minStock, 
					"maxStock":maxStock, "currentStock":currentStock};
			
			doAjaxPost();
		});
		
		$("#cancel-btn").click(function(){
			$("#itemId").val('');
			$("#itemCode").val('');
			$("#itemName").val('');
			$("#minStock").val('');
			$("#maxStock").val('');
			$("#currentStock").val('');
			$("#itemUnit").val($("#itemUnit option:first").val());
			$("#deptId").val($("#deptId option:first").val());
			//$("#deptId").val(deptId).change();
			$("#complaintTypeId").empty();
		});
		
		/* if("${flag}" == "true")
			$("#add-item-btn").click(); */
		
		/* Form Validation */
	/*validator = 	$("#add-update-form").validate({
            rules: {
            	deptId: {
    	            required: true
	             },
            	complaintTypeId: {
    	            required: true
	             },
            	itemCode: {
    	            required: true
	             },
            	itemname: {
    	            required: true
	             },
            	itemUnit: {
    	            required: true
	             },
            	maxStock: {
    	            required: true,
    	            number:true
	             },
            	minStack: {
    	            required: true,
    	            number:true
	             },
            	currentStack: {
    	            required: true,
    	            number:true
	             }
            },
            messages: {
            	deptId: "Please Select Department",
            	complaintTypeId: "Please Select Complaint Type",
            	itemCode: "Please enter Item Code",
            	itemname: "Please enter Item Name",
            	itemUnit: "Please Select Item Unit",
            	maxStock: {
            		required:"Please enter Maximum Stock",
            		number:"Please enter valid number"
            	},
            	minStack: {
            		required:"Please enter Minimum Stock",
            		number:"Please enter valid number"
            	},
            	currentStack: {
            		required:"Please enter Current Stock",
            		number:"Please enter valid number"
            	}
            }
        });*/
		
        /* if("${operation}" == "edit" || "${operation}" == "add")	
         $("#popup").css('display', ''); */
        
        if("${operation}" == "add"){
        	//alert('add');
        	$("#add-update-form").prop("action", "./add-item");
        	$("#popup").css('display', '');
        	$("#add-btn").val('Add');
        }
        
        
        if("${operation}" == "edit"){
        	//alert('edit');
            $("#add-update-form").prop("action", "./update-item");
        	$("#popup").css('display', '');
        	$("#add-btn").val('Update');
        }
        	
	});
	
	var deleteItemId;
	
	function deleteItem(){
		console.log('deleteItemId : ' + deleteItemId);
		$("#complaintItemId").val(deleteItemId)
		$("#delete-form").submit();
	}
	
	function setItemId(itemId){
		deleteItemId = itemId;
	}
	
	function updateItem(itemId, itemCode, itemName, minStock, maxStock, currentStock, itemUnit, deptId, complaintTypeId){
		//alert(itemId+" - "+itemCode+ " - "+itemName+ " - "+minStock+ " - "+maxStock+ " - "+currentStock+ " - "+itemUnit + " - "+ deptId + " - " + complaintTypeId);
		tempComplaintTypeId =  complaintTypeId;
		
		$("#itemId").val(itemId);
		$("#deptId").val(deptId).change();
		//$("#complaintTypeId").val(complaintTypeId).change();
		$("#itemCode").val(itemCode);
		$("#itemName").val(itemName);
		$("#itemUnit").val(itemUnit);
		$("#minStock").val(minStock);
		$("#maxStock").val(maxStock);
		$("#currentStock").val(currentStock);
		
		ajaxProperties.url = "./update-item";
	    ajaxProperties.formType = "complaint-item";
	    ajaxProperties.operationType = "add";
	    
	    $("[for='deptId']").html('');
        $("[for='complaintTypeId']").html('');
        $("[for='itemCode']").html('');
        $("[for='itemName']").html('');
        $("[for='itemUnit']").html('');
        $("[for='maxStock']").html('');
        $("[for='minStock']").html('');
        $("[for='currentStock']").html('');
        
		//$("#deptId").val('0');
		$("#add-btn").val('Update');
		//$("#complaintTypeName").val('');
		$("#popup").css('display', '');
		
	}
	
</script>


 
    </tiles:putAttribute>
</tiles:insertDefinition>