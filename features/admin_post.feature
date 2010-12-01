Feature: Posting
	Because I want to blog about awesome stuff
	An Admin
	Should be able to write posts
	
	Scenario: creating a post
		Given I am logged in
		When I go to /admin/posts/new
		When I fill in the following:
			| post_title 			| Awesome post 															|
			| wmd-input			 	| Pandas mon, I tell ye, they are vigorous 	|
		When I press "Save"
		Then I should see "Awesome post"
		Then I should see "by Agile Panda"