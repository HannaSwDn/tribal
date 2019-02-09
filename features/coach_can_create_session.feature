@javascript
Feature: Coach can create session

	As a coach
	In order to utilize my spare time
	I would like to be able to make sessions on Tribal

	Background:
		Given the following price table exists
			| price_point | trainee_1 | trainee_3 | trainee_4 | trainee_5 | trainee_6 |
			| low         | 60        | 25        | 20        | 15        | 10        |
			| medium      | 120       | 50        | 40        | 30        | 20        |
			| high        | 180       | 75        | 60        | 45        | 30        |

		And the following user exists
			| email             | password | password_confirmation | first_name       | last_name | role    |
			| coach@email.com   | password | password              | Coach-Jon        | Doe       | coach   |
			| trainee@email.com | password | password              | CoTraineeach-Jon | Doe       | trainee |

		And I visit the site


	Scenario: Coach can create session
		Given I am logged in as 'coach@email.com'
		And I click 'Add Session'
		Then I fill in 'session[title]' field with 'Spinning'
		And I select 'Low' from 'session[price_point]'
		And I set the date and time
		And I click 'Add Session'
		Then I should see 'SPINNING'

	Scenario: Coach can not create session
		Given I am logged in as 'coach@email.com'
		And I click 'Add Session'
		And I click 'Add Session'
		Then I should see 'Every field needs to be filled in!'

	Scenario: Trainee can not create session
		Given I am logged in as 'trainee@email.com'
		And I should not see 'Add Session'

