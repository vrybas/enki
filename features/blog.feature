Feature: Blog blogs
	As a user visiting this blog
	I should see the settings of this blog
	
	Scenario: A clean database without settings
		When I go to the home page
		Then I should see "Default Blog Title"
		Then I should see "Default blog description"
		
	Scenario: A blog with blogs available
		Given I have a "blog" with:
			| title       | I like pandas                        |
			| description | And I like them as much as chocolate |
		When I go to the home page
		Then I should see "I like pandas"
		Then I should see "And I like them as much as chocolate"
		
	Scenario: A blog which wants to show fork me
		Given I have a "blog" with:
			| title       | I like pandas                        |
			| description | And I like them as much as chocolate |
			| show_fork   | true																 |
		Then I should see "FORK ME ON Github"
	
	Scenario: A blog which doesn't wants to show fork me
		Given I have a "blog" with:
			| title       | I like pandas                        |
			| description | And I like them as much as chocolate |
			| show_fork   | false																 |
		Then I should not see "FORK ME ON Github"