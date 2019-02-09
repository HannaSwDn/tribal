@javascript

Feature: Coach creates and starts videocall for session

	As a coach
	In order to have a session
	I would like to be able to create and start a video call for the session

	Background:
		Given the following price table exists
			| price_point | trainee_1 | trainee_3 | trainee_4 | trainee_5 | trainee_6 |
			| low         | 60        | 25        | 20        | 15        | 10        |
			| medium      | 120       | 50        | 40        | 30        | 20        |
			| high        | 180       | 75        | 60        | 45        | 30        |

		And the following user exists
			| email             | password | password_confirmation | first_name  | last_name | role    |
			| coach@email.com   | password | password              | Jack        | Doe       | coach   |
			| trainee@email.com | password | password              | Trainee-Jon | Doe       | trainee |

		And the following sessions exist
			| title    | start_date          | end_date            | status    |
			| Crossfit | 2019-02-01 15:00:00 | 2019-02-01 15:30:00 | confirmed |

		And coach Jack has created the session
		And I am logged in as 'coach@email.com'

	Scenario: Videocall gets added to session
		Given I click 'Join' within 'confirmed'
		And I click 'Start Session'
		And I should see 'My feed'
		And I should see 'Remote feeds'
