<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/loginstyle.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$.ajax({
			async:false,
			url:"../complaint/all-dept",
			type:"POST",
			success:function(response){
				//alert(JSON.stringify(response));
				var text = '';
				$.each(response, function(index, dept){
					text += '<option value="'+dept.deptId+'">'+dept.deptname+'</option>'
				});
				
				$("#deptId").html(text);
			},
			error:function(){
				
			}
		});
		
		 $.ajax({
			async:false,
			url:"../transaction/get-all-complaint-repair-employee",
			type:"POST",
			success:function(response){
				//alert(JSON.stringify(response));
				var text = '';
				$.each(response, function(index, obj){
					 text  +='<tr>'+
					'				'+
					'				<td colspan=\"1\"  style=\"background:#fef2f2;height: 25px\">Action</td> '+
					'				<td colspan=\"1\"  style=\"background:#fef2f2;height: 25px\">'+obj.admin+'</td> '+
					'				<td colspan=\"1\"  style=\"background:#fef2f2;height: 25px\">'+obj.employee+'</td> '+
					'				<td colspan=\"1\"  style=\"background:#fef2f2;height: 25px\">'+obj.employeeType+'</td> '+
					'				<td colspan=\"1\"  style=\"background:#fef2f2;height: 25px\">'+obj.deptName+'</td> '+
					'				</tr>';
				});
				
				$("#user_detail").append(text);
			},
			error:function(){
				
			}
		}); 
		
		
		
		
		//$("#user_detail").append(text);
		
		$("#deptId").change(function(){
			var deptId = $("#deptId").val();
			$.ajax({
				url:"./get-user-of-dept",
				type:"POST",
				data : {"deptId" : deptId},
				success:function(response){
					//alert(JSON.stringify(response));
					 var text = '';
					$.each(response, function(index, employee){
						text += '<option value="'+employee.id+'">'+employee.employeeName+'</option>'
					});
					
					$("#adminId").html(text); 
				},
				error:function(){
					
				}
			});
		});
		
		$("#adminId").change(function(){
			var adminId = $("#adminId").val();
			var text = '';
			text += '<option value="'+0+'">'+"NONE"+'</option>'
			$("#adminId > option").each(function() {
			    //alert(this.text + ' ' + this.value);
			    if(this.value != adminId)
			    	text += '<option value="'+this.value+'">'+this.text+'</option>'
			});
			$("#empId").empty();
			$("#empId").html(text);
		});
		
		
		$('#admin-check').change(function() {
	        if($(this).is(":checked")) {
	           	$("#employee-row").hide();
	        }else
	        	$("#employee-row").show();
	                
	    });
	});
</script>

<title>Repair & Maintenance</title>
</head>

<body>
	<table class="main_table">
		<tr class=header>
			<td style="width: 10%; text-align: center"><img alt=""
				src="Images/iitms_icon.png" style="width: 64px; height: 66px">
			</td>
			<td
				style="width: 50%; font-family: Arial Black; font-size: 25px; font-weight: bold; color: #FFFFFF">
				Welcome to IITMS Repair & Maintenance</td>
			<td
				style="width: 20%; font-family: Verdana; font-size: 12px; color: #FFFFFF">
				<span style="vertical-align: top; color: Yellow; font-weight: bold;">
					<span id="ctl00_Label_Name">WELCOME : PREETI DESHMUKH</span>
			</span><br> <br> <span
				style="vertical-align: bottom; font-weight: bold;"> <span
					id="ctl00_Label_Date">10/09/2015</span></span>
			</td>
		</tr>
		<tr class="page_title">
			<td colspan="3"><label class="title_name">COMPLAINT TYPE</label>

			</td>
		</tr>
		<tr class="body">
			<td colspan="3" style="padding: 5%">
			
		<form action="./add-cms-user" method="post">	
			<table id="maintain_user" style=" display:none; padding:50px;width:60%;left:20%; height:50%;z-index: 100;position: absolute;border:1px solid yellow;background: #fffdcc">
			 <tr>
			  <td style="height:15px;position:relative">Department : </td>
			  <td style="height:15px;position:relative""> 
			  
			  <select name="deptId" id="deptId">
			  <!-- <option> CSE</option>
			    <option> Electronic</option>
			      <option> IT</option>
			        <option> MECH</option> -->
			   </select> </td>
			  </tr>
			  
			  <tr>
			  <td  style="height:15px;position:relative"">Employee : </td>
			  <td  style="height:15px;position:relative"> 
			  
			  <select name="adminId"  id="adminId">
			  <!-- <option> CSE</option>
			    <option> Electronic</option>
			      <option> IT</option>
			        <option> MECH</option> -->
			   </select> </td>
			  </tr>
			  
			  <tr >
			  <td  style="height:15px;position:relative"><input type="checkbox" id="admin-check" name="isAdmin" value="true"></input> </td>
			   <td  style="height:15px;position:relative">Set As Admin</td>
			  </tr>
			  
			  <tr id="employee-row">
			  <td  style="height:15px;position:relative">Entry For : </td>
			  <td  style="height:15px;position:relative"> 
			  <select name="empId" id="empId">
			   <option value="0" selected="selected">None
			  <!-- <option> CSE</option>
			    <option> Electronic</option>
			      <option> IT</option>
			        <option> MECH</option>
			   </select> --> </td>
			  </tr>
			  
			  
			  <tr >
			  <td  style="height:15px;position:relative"><input type="submit" value="Save" style="float: right;padding-right: 3px;"></input> </td>
			  <td  style="height:15px;position:relative"> <input type="button" value="Clear" onclick="document.getElementById('maintain_user').style.display ='none';"></input></td>
			  </tr>
			</table>
		</form>	
			
			<label style="min-width: 88px;    background: red;    border-radius: 5px;    height: 20px;    color: white;    padding: 5px;
    top: -3px;    position: relative;    left: 2%;"  onclick="document.getElementById('maintain_user').style.display ='';">Add User</label>
				<table id="user_detail" style="position: relative; width: 96%;height:350px;margin: auto;overflow-x:hidden;overflow-y:auto;border: 1px dotted red; font-size: 12px;text-align: center ">
				<tr>
				<th colspan="5" style="background:brown;height: 25px">USER DETAILS</th> 
				</tr>
				
				<tr>
				
				<th colspan="1"  style="background:#ffcecd;height: 25px">ACTION</th> 
				<th colspan="1"  style="background:#ffcecd;height: 25px">ADMIN NAME</th> 
				<th colspan="1"  style="background:#ffcecd;height: 25px">EMPLOYEE NAME</th> 
				<th colspan="1"  style="background:#ffcecd;height: 25px">STATUS</th> 
				<th colspan="1"  style="background:#ffcecd;height: 25px">DEPARTMENT</th> 
				</tr>
				
				<!--<tr>
				
				<td colspan="1"  style="background:#fef2f2;height: 25px">ACTION</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansod</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansodE</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ADMIN</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ESTATE</td> 
				</tr>
				 <tr>
				
				<td colspan="1"  style="background:#fef2f2;height: 25px">ACTION</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansod</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansodE</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ADMIN</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ESTATE</td> 
				</tr>
				<tr>
				
				<td colspan="1"  style="background:#fef2f2;height: 25px">ACTION</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansod</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansodE</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ADMIN</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ESTATE</td> 
				</tr>
				
				<tr>
				
				<td colspan="1"  style="background:#fef2f2;height: 25px">ACTION</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansod</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansodE</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ADMIN</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ESTATE</td> 
				</tr>
				<tr>
				
				<td colspan="1"  style="background:#fef2f2;height: 25px">ACTION</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansod</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">DR.ankur bansodE</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ADMIN</td> 
				<td colspan="1"  style="background:#fef2f2;height: 25px">ESTATE</td> 
				</tr> -->
				
				
				
				
				</table>
			</td>

		</tr>
		<tr class="footer">

			<td colspan="1" style="padding-top: 10px; color: White" valign="top"
				width="25%" align="left"><b style="position: relative;">
					&nbsp;&nbsp;&nbsp;Developed By <a href="http://www.iitms.co.in"
					target="_blank">IITMS</a> Team </td>
			<td colspan="2" style="padding-top: 10px; color: White" valign="top"
				align="right"><b> Master Software Group 2015 © All rights
					reserved.</b></td>
		</tr>


	</table>

</body>
