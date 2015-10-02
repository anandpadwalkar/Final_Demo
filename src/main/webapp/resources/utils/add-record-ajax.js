/**
 * 
 */

var ajaxProperties = {url:"", data:"", formType:"", operationType:""};

function doAjaxPost() {

	    $.ajax({
	        type: "POST",
	        url: ajaxProperties.url,
	        data: ajaxProperties.data,
	        success: function(response){
	            //alert(JSON.stringify(response));
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
		
	case "complaint-type":{
		$("[for='deptId']").html('');
        $("[for='complaintTypeName']").html('');
       // console.log(response);
        if(response.status == "SUCCESS"){
            location.href = './complaint-type';
         }else{
        	 $.each(response.result, function(index, errorString){
        		 
        		 var array = errorString.split("#");
        		 $('[for="' +array[0]+ '"]').html(array[1]);
        	 });
        	 
         }
	}
	break;
	
	case "complaint-item":{
		$("[for='deptId']").html('');
        $("[for='complaintTypeId']").html('');
        $("[for='itemCode']").html('');
        $("[for='itemName']").html('');
        $("[for='itemUnit']").html('');
        $("[for='maxStock']").html('');
        $("[for='minStock']").html('');
        $("[for='currentStock']").html('');
       // console.log(response);
        if(response.status == "SUCCESS"){
            location.href = './complaint-items';
         }else{
        	 $.each(response.result, function(index, errorString){
        		 
        		 var array = errorString.split("#");
        		 $('[for="' +array[0]+ '"]').html(array[1]);
        	 });
        	 
         }
	}
	break;
	
	case "create-user":{
		$("[for='deptId']").html('');
        $("[for='employeeId']").html('');
        $("[for='status']").html('');
       // console.log(response);
        if(response.status == "SUCCESS"){
            location.href = './user-list';
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