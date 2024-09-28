import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

import "../index.css";

function ParticipantsPage() {
    const params = useParams();

    const [participants, setParticipants] = useState([]);
    const [eventName, setEventName] = useState("");

    useEffect(() => {
        const loadParticipants = async () => { 
            const res = await fetch(`http://localhost:4000/api/events/${params.eventId}/participants`);
            const data = await res.json();
            
            setParticipants(data);
            
        };

        loadParticipants();
    }, [params.id])  

    return (
        <div>
            <h2>"{eventName}" participants</h2>
            <div className="grid-wrapper-participants">
                {participants.map(participant => 
                    <div key={participant.id} className="participant-component">
                        <h3>{participant.name}</h3>
                        <p>{participant.email}</p>
                    </div>
                    )}
            </div>
        </div>
    );
}

export default ParticipantsPage