Feature: Blog setup
	As a newly installed app
	As an owner of this blog
	I should see setup instruction
	
	@wip
	Scenario: Freshly installed blog
		Given I am on the home page
		Then I should see "Blog setup"
		Then I should see "Hey! This appears to be a newly installed blog. Before you continue using this blog we'd like you to setup some default settings."