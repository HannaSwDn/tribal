import React from "react";

const AddSessionForm = props => {
	return <div className="main_container">
		<h1>Add Session</h1>
		<form
			id="Session-form"
			name="Session-form"
			onSubmit={props.onSubmit}
			className="m-4 wrapper-col"
		>
			<label htmlFor="Title">Title</label>
			<input
				onChange={props.onChange}
				value={props.title}
				id="title"
				name="session[title]"
				type="text"
				className="m-4 form_field"
			/>

			<label htmlFor="start_date">Date and time</label>
			<input
				onChange={props.onChange}
				value={props.start_date}
				id="start_date"
				name="session[start_date]"
				type="datetime-local"
				className="m-4 form_field"
			/>

			<label htmlFor="price_point">Price</label>
			<select name="session[price_point]"
				id="price_point">
				<option value="1">Low</option>
				<option value="2">Medium</option>
				<option value="3">High</option>
			</select>
			{/* <input
                onChange={props.onChange}
                value={props.price_point}
                id="price_point"
                name="session[price_point]"
                type="number"
                className="m-4 form_field"
            /> */}

			<button className="m-4 button" name="Submit" type="submit" >
				Add Session
			</button>
		</form>
	</div>
};

export default AddSessionForm;
