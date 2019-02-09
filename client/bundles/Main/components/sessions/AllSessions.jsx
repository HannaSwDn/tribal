import React, { Component } from 'react'
import SessionCard from './SessionCard';

export class AllSessions extends Component {
	constructor(props) {
		super(props)
		this.state = {
			sessions: props.sessionlist.sessions.sessions,
			sessionType : props.sessionType,
			buttonName : "",
			showDetails: false,
			user: props.sessionlist.sessions.user,
			mysession: props.sessionlist.sessions.mysessions
		};
		this.showPage = this.showPage.bind(this);
	}

	showPage(event) {
		document.location.href = '/sessions/' + event.target.value;
	}

	render() {
		let mySessions = [];
		if(this.state.mysession) {
			this.state.mysession.forEach(session => {
				mySessions.push(session.id)
			})
		}
		let allSessions = this.state.sessions.map(session => {
			if (mySessions.includes(session.id)) {
				return (
					<SessionCard session={session} user={this.state.user} buttonName={'Join'} showPage={this.showPage} />
				);
			} else {
				return (
					<SessionCard session={session} user={this.state.user} buttonName={'Book'} showPage={this.showPage} />
				);
				}
		});

		return (
			<div id={this.state.sessionType}>
				<h1 className="capitalize">{this.state.sessionType} sessions</h1>
				<div className='session_wrapper'>
					<div>{allSessions}</div>
				</div>
				<br />
			</div>);
	}
}

export default AllSessions;
