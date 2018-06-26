<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		String path = request.getContextPath();
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=path %>/signup/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<title>회원가입</title>
</head>
<body>
<form class="grop-from" id="signup">
  <div class="form-head"><span class="text"> </span><i class="icon-placeholder"></i></div>
  <div class="form-body"><span class="error-text">Please Fill Out This Field</span>
    <div class="form-controls">
      <input id="control-name" placeholder="Name"/>
      <input id="control-phone" placeholder="Phone No"/>
      <input id="control-email" placeholder="Email"/>
      <input id="control-password" placeholder="Password" type="password"/>
      <input id="control-password-repeat" placeholder="Confirm Password" type="password"/>
    </div>
  </div><a class="form-action"><i class="icon-action"></i></a>
</form>
</body>
<script src="<%=path %>/signup/script.js"></script>
<script> $('.form-head').click(function(){
	console.log(" else if 밑에 있는 확인");
    if($(this).closest('.grop-from').attr('id')=='signup'){
        $('.grop-from').attr('id' , 'name');
        $('.icon-action').addClass('back');
    }  
    else if($(this).closest('.grop-from').attr('id')=='success'){
    	console.log(" else if 밑에 있는 확인");
          $('.grop-from').attr('id' , 'signup');
    	sendData("<%=path%>"); 
        location.href ="<%=path %>/login.tm0";
    }

});

function sendData (path) {
	var name = $('#control-name').val(); 
    var phone = $('#control-phone').val(); 
    var email = $('#control-email').val(); 
    var password = $('#control-password').val();
    
    var postUrl = path + "/joinus_proc.tm0";
    console.log(postUrl);
    $.post(postUrl,
    		{
    	name : name,
    	phone : phone,
    	email: email,
    	pw: password
    		},
    		function(data, status){
    			console.log("status" + status);
    			console.log("data" + data);
    			if(status.trim() == "success" && data.trim() == "OK"){
    					console.log("성공");
    			}else{
    					console.log("실패");
    				}
    			
    			
    			//alert("data: " + data + "\nStatus : "+status);
    		});
	
}

</script>
</html>