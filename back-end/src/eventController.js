import { pool } from "./db/index.js";

const getEvents = async (req, res) => {
    try {
        const events = await pool.query("SELECT id, title, description, event_date, organiser FROM event");

        const page = req.query.page;
        const pageSize = req.query.pageSize;

        const startIndex = (page - 1) * pageSize;
        const endIndex = page * pageSize;

        const pagEvents = events.rows.slice(startIndex, endIndex);
        const pageCount = Math.ceil(events.rowCount / pageSize);

        return res.json({ events: pagEvents, pageCount });
    } catch (err) {
        console.error(err);
    }
}

export default getEvents;