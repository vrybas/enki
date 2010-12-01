Feature: Settings
	Because I want my blog to have a proper name
	As an Admin
	I want to be able to edit my blog settings
	
	Scenario: Showing your settings
		Given I am logged in
		When I go to /admin
		Then I should see "Settings"
		When I follow "Settings"
		Then I should see "Blog Settings"
	
	Scenario: Editing settings for the first time
		Given I am logged in
		When I go to /admin/settings
		Then I should see "Blog Settings"
		Then I should see "It appears you haven't got any settings set yet. Let's get that blog personalized!"
		Then I fill in the following:
			| Title  | Agile Pandas 			|
			| Description | Agile Pandas blog |
		Then I press "Save settings"
		Then I should see "Your settings have been saved"