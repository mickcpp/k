<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<title>Registrazione</title>
</head>
<body>

		<%@ include file="./fragments/header.jsp" %>
		<%@ include file="./fragments/menu.jsp" %>
	
		<div id="main" class="clear">
	<h2>Registrazione</h2>
	<form action="Registrazione" method="post" id="myform" onsubmit="event.preventDefault(); validate(this)">
		
		<div class="tableRow">
			<p>Nome:</p>
			<p><input type="text" name="nome" placeholder="Mario" onfocus="myFunction(this)" required/></p>	
		</div>
		<div class="tableRow">
			<p></p>
			<p id="errNome"></p> 
		</div>
		<div class="tableRow"> 
			<p>Cognome:</p>
			<p><input type="text" name="cognome" placeholder="Rossi" onfocus="myFunction(this)" required/></p>
		</div>
		<div class="tableRow">
			<p></p>
			<p id="errCognome"></p> 
		</div>
		<div class="tableRow">
			<p>Email:</p>
			<p><input type="text" id="em" name="email" placeholder="MarioRossi@gmail.com" onfocus="myFunction(this)" required/></p>	
		</div>
		<div class="tableRow">
			<p></p>
			<p id="errEmail"></p> 
		</div>
		<div class="tableRow">
			<p>Data di nascita:</p>
			<p><input type="text" name="nascita" placeholder="23-10-1987" onfocus="myFunction(this)" required/></p>	
		</div>
		<div class="tableRow">
			<p></p>
			<p id="errNascita"></p> 
		</div>
		<div class="tableRow">
			<p>Username:</p>
			<p><input type="text" id="us" name="us" placeholder="MarioR87" onfocus="myFunction(this)" required/></p>
		</div>
		<div class="tableRow">
			<p></p>
			<p id="errUser"></p> 
		</div>
		<div class="tableRow">
			<p>Password:</p>
			<p><input type="password" name="pw" placeholder="********" onfocus="myFunction(this)" required/></p>
		</div>
		<div class="tableRow">
			<p></p>
			<p id="errPass"></p> 
		</div>
		<div class="tableRow">
			<p></p>
			<p><input type="submit" value="Registrati">	</p>
		</div>		
		
	</form>
	</div>
	
			<%@ include file="./fragments/footer.jsp" %>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="script/Registrazione.js"></script>

	<script>
		$(document).ready(function(){
			$("#us").keyup(function(){
				var x = $("#us").val();
				if(x != ''){
					$.post("./CheckUsername",{"us" : x},function(data){
						if(data == '0'){
							$("#errUser").html("username già in uso").css({"color" : "red"});
						}
						else{
							$("#errUser").html("");
						} 
						});
					}
				else{
					$("#errUser").html("");
				}

			});
		});
	
		
		$(document).ready(function(){
			$("#em").keyup(function(){
				var x = $("#em").val();
				if(x != ''){
					$.post("./CheckEmail",{"em" : x},function(data){
						if(data == '0'){
							$("#errEmail").html("email già in uso").css({"color" : "red"});
						}
						else{
							$("#errEmail").html("");
						}
						});
					}
				else{
					$("#errEmail").html("");
				}

			});
		});
	


	</script>
</body>
</html>