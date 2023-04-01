<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<script>
	function validate() {
		var email = document.getElementById("email");
		var password = document.getElementById("password");

		var SSN = document.getElementById("ssn");
		if (email== "" || password == "") {
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

	<h>Create your account below</h>
	<form action="customer-register" method="post">
		Name: <input id="email" name="emailAddress" type="text" required />
		<br /> Password:
		<input type="password"  id="password" name="password"
			required /> <br />
			 <input type="submit" value="submit" onclick="return validate();" />

	</form>

</body>
</html>