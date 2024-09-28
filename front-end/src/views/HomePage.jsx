import { useState, useEffect } from "react";
import { Link } from "react-router-dom";

import "../index.css";


function HomePage() {
    const [currentPage, setCurrentPage] = useState(1);
    const [pageCount, setPageCount] = useState();
    const [events, setEvents] = useState([]);

    useEffect(() => {
        const loadEvents = async () => {
            const res = await fetch(`http://localhost:4000/api/events?page=${currentPage}&pageSize=12`);
            const data = await res.json();
            setPageCount(data.pageCount);
            setEvents(data.events);
        };

        loadEvents();
    }, [currentPage]);   

    const handlePrevPage = () => {
        if (currentPage > 1) {
            setCurrentPage(currentPage - 1);
        }
    };

    const handleNextPage = () => {
        if (currentPage < pageCount) {
            setCurrentPage(currentPage + 1);
        }
    };

    return (
        <>
            <h2>Events</h2>
            <div className="grid_wrapper">
                {events.map(event => 
                <div key={event.id} className="event_component">
                    <h3>{event.title}</h3>
                    <p>{event.description}</p>
                    <p>{event.date}</p>
                    <p>{event.organiser}</p>
                    <Link to="/register">Register</Link>
                    <Link to="/participants" className="view">View</Link>
                </div>
                )}
            </div>
            <button onClick={handlePrevPage}>
                ←
            </button>
            <button onClick={handleNextPage}>
                →
            </button>
        </>
    );
}

export default HomePage;