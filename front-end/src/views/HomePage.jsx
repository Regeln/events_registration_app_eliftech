import { Link } from "react-router-dom";

import "../index.css";
import Event from "../components/Event.jsx";


function HomePage() {
    return (
        <>
            <h2>Events</h2>
            <div className="grid_wrapper">
                <Event />
                <Event />                         
            </div>
            
        </>
    );
}

export default HomePage;