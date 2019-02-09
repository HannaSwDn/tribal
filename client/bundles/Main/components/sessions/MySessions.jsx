import React, { Component } from 'react'
import SessionCard from './SessionCard';


export class MySessions extends Component {
	constructor(props) {
		super(props)
		this.state = {
			user: props.sessions.user,
			mysessions: props.sessions.mysessions
		}
		this.showPage = this.showPage.bind(this)
	}

	componentDidMount() {
		this.setState({
			user: this.props.sessions.user,
			mysessions: this.props.sessions.mysessions
		})
	}
	showPage(event) {
		let user = this.state.user;
		if (user.role === "trainee") {
			document.location.href = '/sessions/' + event.target.value;
		} else if (user.role === "coach") {
			document.location.href = '/startsession?sessionId=' + event.target.value;
		}
	}
	render() {
		let mySessions
		if (this.state.mysessions) {
			mySessions = this.state.mysessions.map(session => {
				return (
					<SessionCard session={session} user={this.state.user}
						buttonName={this.state.user.role == 'coach' ? 'Start Session' : 'Join Session'}
						showPage={this.showPage} />
				);
			}
			);
		} else {
			mySessions = "You haven't booked a session yet!"
		}
		return (
			<div className="text-white text-center">
				<h1>My booked sessions:</h1>
				<div>
					{mySessions}
				</div>
			</div>
		)
	}
}

export default MySessions
