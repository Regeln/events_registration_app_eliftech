import express from "express";
import getEvents from "./eventController.js";
import { getParticipants, registerParticipant } from "./participantController.js";

const app = express();

app.use(express.json());

app.post("/api/events/:eventId/register", registerParticipant);
app.get("/api/events/:eventId/participants", getParticipants);
app.get("/api/events", getEvents);


const port = 4000;

app.listen(port, () => {
    console.log(`Started server, port ${port}`);
});