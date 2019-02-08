import React, { Component } from 'react';
import SessionCard from './SessionCard';

export class ShowSession extends Component {
	constructor(props) {
		super(props);
		this.state = {
			session: props.session,
			coach: props.coach,
			members: props.members,
			user: props.user,
			priceList: props.price_list
		};
	this.buyStripe = this.buyStripe.bind(this);
	}

	buyStripe(){
		document.location.href = "/transactions/new" + "?sessionId=" + this.state.session.id;
	}

	render() {
		const members = this.state.members.map(member => member.id)
		return (
			<div  className='main_container wrapper-col' >
				<SessionCard session={this.state.session} price={this.state.priceList} />
				<div className="text-white">
					{this.state.coach[0].first_name}
					{this.state.members.length}
				</div>

				<div style = {members.includes(this.state.user.id) ? {display: "none"}: {}}>
				<button className='button' onClick={this.buyStripe}>
						Buy Session
				</button>
				</div>
				<div style = {members.includes(this.state.user.id) ? {} : {display: "none"}}>
				<button className='button' >
						Join Session
				</button>
				</div>
			</div>
		);
	}
}

export default ShowSession;

