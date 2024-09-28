import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./index.css";

import RegisterPage from "./views/RegisterPage.jsx";
import ParticipantsPage from "./views/ParticipantsPage.jsx";
import HomePage from "./views/HomePage.jsx";

function App() {
    return (
        <BrowserRouter>
            <Routes>
                <Route path="/event/:eventId/register" element={<RegisterPage />} />
                <Route path="/event/:eventId/participants" element={<ParticipantsPage />} />
                <Route path="/" element={<HomePage />} />
            </Routes>
        </BrowserRouter>
    );
}

export default App;