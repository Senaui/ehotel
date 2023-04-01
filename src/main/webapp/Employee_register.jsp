<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create your account belowr</title>
</head>
<script>
	function validate() {
		var email = document.getElementById("email");
		var password = document.getElementById("password");

		var SSN = document.getElementById("ssn");
		if (username == "" || password == "") {
			alert("Email or password cannot be empty");
			return false;

		} else if (ssn != (int)ssn){
			alert("SSN is not a number!");
			return false;
		} else {
			return true;
		}

	}
</script>
<body>

	<h>Create your account here</h>
	<form action="employee-register" method="post">
		Username <input id="email" name="email" type="text" required /><br />
		 Name: <input id="firstname" name="firstname" type="text" required />
		<br />
		Address: <input id="address" name="address" type="text" required /> <br />
		Password: <input type="password"
			id="password" name="password" required /> <br />  <input type="submit" value="submit"
			onclick="return validate();" />

	</form>

</body>
</html>