Feature: Blog settings
	As a user visiting this blog
	I should see the settings of this blog
	
	Scenario: A clean database without settings
		When I go to the home page
		Then I should see "Default Blog Title"
		Then I should see "Default blog description"
		
	Scenario: A blog with settings available
		Given I have a "setting" with:
			| title       | I like pandas                        |
			| description | And I like them as much as chocolate |
		When I go to the home page
		Then I should see "I like pandas"
		Then I should see "And I like them as much as chocolate"