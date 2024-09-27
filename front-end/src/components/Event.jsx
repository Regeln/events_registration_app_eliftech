import { Link } from "react-router-dom";

function Event() {
    return (
        <>
            <div className="event_component">
                <h3>Title</h3>
                <p>Event description</p>
                <p>Date</p>
                <p>Organiser</p>
                <Link to="/register">Register</Link>
                <Link to="participants" className="view">View</Link>
            </div>
        </>
    );
}

export default Event;