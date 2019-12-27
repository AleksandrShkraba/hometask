# My application for GitHub!

This application give you information about pull request, number of wich you set in parameter --number (required parameter). By default it give you only the title of pull request. You can choose repository using two required parameters --owner and --repo. 

You can get next information for all pull requests: 
 - login of user who made request (--user param)
 - number of commits for this pull requests (--commits param)
 - status of pull requests (--status)
 - number of comments for pull requests (--comments)
 - date and time of creation (--created)

All of this parameters are not required, and you can choose any that you want or don't use anyone.

Example of using:

	python ./git_inf --owner alenaPy --repo devops_lab --number 13 --status --commits


# IMPORTANT

You have to enter your credentials in variables user and password like

		user = "test"
		password = "123321"


