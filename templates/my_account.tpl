{config_load file=test.conf section="setup"}
{include file="header.tpl"}

<div id="main_pane">


{if $user_access == "admin" or $user_access == "manager" or $user_access == "steward"}

<h1>Change Details</h1>

<div id="primary_{$level}">
<p>
{$primary}
</p>
</div>

<div id="error_string">
<p>
{section name=error_list loop=$error_string}
{$error_string[error_list]}</br>
{/section}
</p>
</div>

<div id="command">
<p>
{$command}
</p>
</div>

<form action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	
	<p>
	Enter new details here.</br>
	If you do NOT want a new password leave the new password fields blank.</br>
	</p>
	<table border="1">
		<tr>
	        <td>ID</td>
	        <td>{$user.ID}<input type="hidden" name="ID" value="{$user.ID}"></td>
	    </tr>
		<tr>
	        <td>Username</td>
	        <td>{$user.USERNAME}<input type="hidden" name="USERNAME" value="{$user.USERNAME}"></td>
	    </tr>
	   <tr>
	        <td>First Name</td>
	        <td><input type="text" name="First_Name" value="{$user.FIRST_NAME}" size="40"></td>
	    </tr>
	    <tr>
	        <td>Last Name</td>
	        <td><input type="text" name="Last_Name" value="{$user.LAST_NAME}" size="40"></td>
	    </tr>
<!--	    <tr>
	        <td>Represents</td>
	        <td><input type="text" name="Represents" value="{$user.REPRESENTS}" size="40"></td>
	    </tr>	    -->
	    <tr>
	        <td>Email</td>
	        <td><input type="text" name="Email" value="{$user.EMAIL}" size="40"></td>
	    </tr>    	    	    
    
	    <tr>
	    	<td>New Password</td> 
	    	<td><input type="password" name="New_Password" value="" size="40"></td>
	    </tr>
	    
	    <tr>
	    	<td>New Password (Repeat)</td> 
	    	<td><input type="password" name="New_Password_Repeat" value="" size="40"></td>
	    </tr>
<!--	    <tr>
	    	<td>Current Password</td> 
	    	<td><input type"password" name="Current_Password" value="" size="40"></td>
	    </tr>
	    -->
	    
	   <tr>
	        <td colspan="2" align="center"><input type="submit" value="Submit" name="Submit_Update"></td>
	    </tr>


	 
</form>


{else} <!-- for the public -->

<h1>Reset Password</h1>

<div id="primary_{$level}">
<p>
{$primary}
</p>
</div>
<div id="command">
<p>
{$command}
</p>
</div>

<form action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	
	<p>
	Enter your username and email address to reset your password.</br>
	A new password will be then be emailed to you.</br>
	If you don't receive the reset password email soon please check your SPAM folder.</br>
	The email will come from tournament@bairui.com, which you may wish to add to your contacts list.</br>
	</p>
	<table border="0">

		<tr>
	        <td>Username</td>
	        <td><input type="text" name="USERNAME" value=""></td>
	    </tr>    
	    <tr>
	        <td>Email</td>
	        <td><input type="text" name="Email" value="" size="40"></td>
	    </tr>    	    	    
 
	   <tr>
	        <td colspan="2" align="center"><input type="submit" value="Submit" name="Submit_Reset"></td>
	    </tr>

</form>

<!--
<h1>Sign Up</h1>

<form action="{$SCRIPT_NAME}" method="post" enctype="multipart/form-data">
	
	<p>
	Signing up is for team managers/instructors only.</br>
	The account must be verified by an admin before it will be activated.</br>
	</p>
	<table border="0">

		<tr>
	        <td>Username</td>
	        <td><input type="text" name="USERNAME" value=""></td>
	    </tr>    
	    <tr>
	        <td>Email</td>
	        <td><input type="text" name="Email" value="" size="40"></td>
	    </tr>    	    	    
 
	   <tr>
	        <td colspan="2" align="center"><input type="submit" value="Submit" name="Submit_New"></td>
	    </tr>


	 
</form>

-->
{/if}


</div>
{include file="footer.tpl"}
</body>
