import { useState, useEffect } from "react";
import { Link } from "react-router-dom";

import "../index.css";


function HomePage() {
    const [sortType, setSortType] = useState("title");
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

    useEffect(() => {
        const sortedEvents = [...events].sort((a, b) => {
            if (sortType === "title" || sortType === "organiser") {
                return a[sortType].localeCompare(b[sortType]);
            } else if (sortType === "event_date") {
                return new Date(a.event_date) - new Date(b.event_date);
            }
        });

        setEvents(sortedEvents);
    }, [sortType]);

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

            <label htmlFor="sort-select">Sorting: </label>
            <select id="sort-select" onChange={(e) => setSortType(e.target.value)}>
                <option value="title">Title</option>
                <option value="event_date">Date</option>
                <option value="organiser">Organizer</option>
            </select>

            <div className="grid-wrapper-events">
                {events.map(event => 
                <div key={event.id} className="event-component">
                    <h3>{event.title}</h3>
                    <p>{event.description}</p>
                    <p>{event.date}</p>
                    <p>{event.organiser}</p>
                    <Link to={`/event/${event.id}/register`}>Register</Link>
                    <Link to={`/event/${event.id}/participants`} className="view">View</Link>
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