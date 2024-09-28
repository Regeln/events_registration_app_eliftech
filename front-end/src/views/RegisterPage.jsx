import { useRef, useState } from "react";
import { useParams } from "react-router-dom";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

function RegisterPage() {
    const params = useParams();
    const [error, setError] = useState("");
    const [isSuccess, setIsSuccess] = useState(false);
    const [birthDatePick, setBirthDatePick] = useState(new Date());

    const nameInput = useRef(null);
    const emailInput = useRef(null);
    const radioSocialMediaInput = useRef(null);
    const radioFriendsInput = useRef(null);
    const radioFoundMyselfInput = useRef(null);

    const handleSubmit = async () => {
        setError("");
        setIsSuccess(false);

        let selectedRadio;
        if (radioSocialMediaInput.current.checked) {
            selectedRadio = radioSocialMediaInput.current.value;
        } else if (radioFriendsInput.current.checked) {
            selectedRadio = radioFriendsInput.current.value;
        } else if (radioFoundMyselfInput.current.checked) {
            selectedRadio = radioFoundMyselfInput.current.value;
        } else {
            selectedRadio = "";
        }

        const participantData = {
            name: nameInput.current.value,
            email: emailInput.current.value,
            birthDate: birthDatePick,
            heardFrom: selectedRadio,
            eventId: params.eventId
        };

        const res = await fetch(`http://localhost:4000/api/events/${params.eventId}/register`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(participantData)
        });

        const data = await res.json();

        if (res.status >= 400) {
            setError(data.message);
        } else {
            setIsSuccess(true);
        }
    }
    
    return (
        <div>
            <form className="registration-form">
                <h2>Event Registration</h2>

                <label htmlFor="full-name">Full name</label>
                <input
                    type="text"
                    id="full-name"
                    ref={nameInput}
                />

                <label htmlFor="email">Email</label>
                <input
                    type="text"
                    id="email"
                    ref={emailInput}
                />

                <label htmlFor="birth-date">Date of birth</label>
                <DatePicker
                    selected={birthDatePick}
                    onChange={date => setBirthDatePick(date)}
                    dateFormat="yyyy-MM-dd"
                    id="birth-date"
                />

                <fieldset>
                    <legend>Where did you hear about this event?</legend>
                    <div className="radio-group">
                        <input 
                            type="radio" 
                            id="social-media" 
                            name="source" 
                            value="social-media"
                            ref={radioSocialMediaInput}                        
                        />
                        <label htmlFor="social-media" className="radio-label">Social media</label>

                        <input 
                            type="radio" 
                            id="friends" 
                            name="source" 
                            value="friends"
                            ref={radioFriendsInput}                         
                        />
                        <label htmlFor="friends" className="radio-label">Friends</label>

                        <input 
                            type="radio" 
                            id="found-myself" 
                            name="source" 
                            value="found-myself" 
                            ref={radioFoundMyselfInput}
                        />
                        <label htmlFor="found-myself" className="radio-label">Found myself</label>
                    </div>
                </fieldset>
            </form>

            <button className="submit-button" onClick={handleSubmit}>
                Register
            </button>
            <div className="submit-error">{error}</div>
            {isSuccess && (
                <div>You are now registered</div>
            )}
        </div>
    );
}

export default RegisterPage;