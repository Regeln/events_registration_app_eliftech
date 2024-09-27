import express from "express";
import events from "../db.js";

const app = express();

app.use(express.json());

app.get("/api/events", (req, res) => {
    const page = req.query.page;
    const pageSize = req.query.pageSize;

    const startIndex = (page - 1) * pageSize;
    const endIndex = page * pageSize;

    const pagEvents = events.slice(startIndex, endIndex);
    const pageCount = Math.ceil(events.length / pageSize);

    return res.json({ events: pagEvents, pageCount });
});

const port = 4000;

app.listen(port, () => {
    console.log(`Started server, port ${port}`);
});