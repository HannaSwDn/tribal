@javascript

Feature: Trainee can join session in Videocalls

	As a trainee
	In order to join sessions
	I would like to be able to join a videocall hosted on Tribal

	Background:

		Given the following user exists
			| email             | password | password_confirmation | first_name | last_name | role    |
			| coach@email.com   | password | password              | Jack       | Doe       | coach   |
			| trainee@email.com | password | password              | Jon        | Doe       | trainee |

		And the following sessions exist
			| title    | start_date          | end_date            | status    |
			| Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | confirmed |

		And coach Jack has created the session
		And trainee Jon buys a session
		And I am logged in as 'trainee@email.com'

	Scenario: Trainee can join session in Videocalls
		Given I click 'Join' within 'confirmed'
		And I click 'Join Session'
		And I should see 'My feed'
		And I should see 'Remote feeds'
