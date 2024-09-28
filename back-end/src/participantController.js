import { pool } from "./db/index.js";

const getParticipants = async (req, res) => {
    try {
        const participants = await pool.query(
            "SELECT id, name, email FROM participant WHERE event_id = $1",
            [req.params.eventId]    
        );  
        console.log(participants.rows)
        return res.json(participants.rows);
    } catch (err) {
        console.error(err);
        return res.status(500).json({ error: err.toString() });
    }
}

const registerParticipant = async (req, res) => {
    try {
        const { name, email, birthDate, heardFrom , eventId } = req.body;
        console.log(name)
        console.log(email)
        console.log(birthDate)
        console.log(heardFrom)
        console.log(eventId)

        if (!name || !email || !birthDate || !heardFrom || !eventId) {
            return res.status(400).json({ message: "Must enter information in all fields"});
        }
        await pool.query(
            "INSERT INTO participant (name, email, birth_date, heard_from, event_id) VALUES ($1, $2, $3, $4, $5)",
            [name, email, birthDate, heardFrom, eventId]        
        );

        return res.status(201).json({ message: "Participant registered" });
    } catch (err) {
        console.error(err);
        return res.status(500).json({ error: err.toString() });
    }
}

export { getParticipants, registerParticipant };