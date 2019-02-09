import React from 'react';
import AllSessions from "./AllSessions";

function MainSessionsDisplay(props) {
	return (
		<div>
			<AllSessions sessionType="scheduled" sessionlist={props} />
			<AllSessions sessionType="confirmed" sessionlist={props} />
			<AllSessions sessionType="full" sessionlist={props} />
		</div>
	)
}

export default MainSessionsDisplay
