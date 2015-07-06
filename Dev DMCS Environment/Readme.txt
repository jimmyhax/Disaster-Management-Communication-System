	V1.7.0 Released – Feb 7, 2015
	
	Product Description

	This tool helps to support Single Sign On (SSO) concept for your web applications.  Single Sign On (SSO) is a term used to indicate when a pool of applications need a centralized authentication, so that users login once and access to any application. 
	Implementing a single sign on is quite simple, and can be done by configuring the applications using the web.config file and this tool will help you to create machine key (for validation and encryption/decryption proposes) and manage members (users) and their roles.
	The general concept is this: members are created, activated, possibly approved by admin, roles are assigned to members. Members can self register and activate their account or admin can to do that. 

	Main Features

	• Single Sign On concept support
	• Public registration form
	• Activation email
	• Change password email
	• Email templates support
	• Audit Event log
	• Machine Key Generator
	• Mail domain restriction
	• Bootstrap Themes
	• Responsive design
	• Simple API
	• Live member search
	• Secrte admin URL
	• Multilanguage support ready
	• Role / Member import & export via CSV
	• Ability to change public form design
	• Public forms default language
	• Import/Export file example
    • Custom Profile Fields 
	• Social Networks Integration
	• LDAP connection support
	• Profile field visibility restriction by domain
	• Profile field visibility restriction by role
	• Member's signup domain

	Requirements

	• MS IIS 7/6
	• ASP.NET 4.0  MVC3
	• MS SQL Server 2008 (possible compact edition 4.0)
	• Or MySQL Server 5+ (InnoDB)

	Browser support
	Role Member Admin is tested and supported in major modern browsers like Chrome, Safari, Internet Explorer, and Firefox

	• IE 8+
	• Chrome
	• FireFox 3+
	• Opera 11+
	• Safari 5+

	Packge content
	
	The package contains:
	• SimpleTools.RoleAdmin.Web - Admin application 
	• SimpleTools.Web.Example - Example application ASP.NET MVC3
	• SimpleTools.Web.Example.Classic - Example application ASP.NET WebForm Classic
	• Demo.Export.Import.Files - export/import file example
	• Database.Install.Script -  Install SQL script
          You can use MS SQL or MySQL. Please see example of connection string in RoleAdmin.Web web.config file.

	Installation Instructions
	Install Admin Application

	1. Create empty database;
	2. Create database user and assign dbo rights to the user;
	3. Execute MS SQL Management Studio and execute Database.Install.Script\InstallDatabase-v1.2.sql or UpgradeDatabase-v1.1-to-v1.2.sql to upgrade.
	4. Change connection string in Web.Config file in SimpleTools.RoleAdmin.Web, see example below:

	Example:
	<add 
	key="SimpleTools.RoleAdmin.Connetion.String"
	value="server=localhost\SQLEXPRESS;database=SimpleTools.RoleMemberAdmin;user id=SimpleTools.RoleMemberAdmin; 
	password=SimpleTools.RoleMemberAdmin" /> 

	5. Create web site in IIS or application in virtual directory and copy content of SimpleTools.RoleAdmin.Web folder. Remember  that you must use .Net 4.0 application pull.

	6. Add read/write permisson on avatar virtual folder for IUSER user.  
   
    7. Set domain attribute in form tag to your root domain (without sub domain name) 
	
  	<forms loginUrl="~/Account/SignIn" protection="All" timeout="180" domain="mydomain.com" name="myApplicationCookie" path="/" requireSSL="false" slidingExpiration="true" enableCrossAppRedirects="true" defaultUrl="~/"/>
	
	8. Use the following admin login:

	Name: admin@demo.com
	Password: admin
	URL:  http://www.yourdomain.com/Admin

	Remember that you can change default admin URL in order to secury admin UI entry point.

	8. See Help & FAQ area on admin web site.

	You can install the tool on your root domain (for instnace accounts.mydomain.com) or use virtual path like this http://www.mydomain.com/security.
	Install example application
	Example application helps to undestand key concept of role and member admin tool in action:
	1. Create web site in IIS or application in virtual directory and copy content of SimpleTools.Web.Example Web folder. Remember  that you must use .Net 4.0 application poll.
	2. Check web.config file and change accounts.yourdomain.com to you account URL:

    <add key="ssoUrlSignInWith" value="http://accounts.yourdomain.com/SignInWith"/>
	<add key="ssoUrlSignIn" value="http://accounts.yourdomain.com/SignIn"/>
	<add key="ssoUrlSignOut" value="http://accounts.yourdomain.com/SignOut"/>
	<add key="ssoUrlSignUp" value="http://accounts.yourdomain.com/SignUp"/>
	<add key="ssoUrlForgotPassword" value="http://accounts.yourdomain.com/ForgotPassword"/>
	<add key="ssoUrlProfile" value="http://accounts.yourdomain.com/Profile"/>
	<add key="ssoAvatar" value="http://accounts.yourdomain.com/Avatar"/>
	<add key="ssoAPIUrl" value="http://accounts.yourdomain.com/Admin/API"/>
	<add key="ssoAPIMemberName" value="example@demo.com"/>
	<add key="ssoAPIMemberToken" value="HYXMvDsQWhGhbShE7yS1"/>  

	You can install the tool on your root domain (for instnace app.mydomain.com) or use virtual path like this http://www.mydomain.com/myapp.

Support your needs

	If you have problems, questions, ideal, etc… Contact me via email radiogaga.dev@gmail.com Please contact us with any questions you may have via the contact form on my author profile page. Updates – Available FREE to existing purchasers.
