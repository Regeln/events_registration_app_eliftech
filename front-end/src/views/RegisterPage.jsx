import { useRef } from "react";

function RegisterPage() {
    const nameInput = useRef(null);
    const emailInput = useRef(null);
    const birthInput = useRef(null);

    return (
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
            <input
                type="text"
                id="birth-date"
                ref={birthInput}
            />

            <fieldset>
                <legend>Where did you hear about this event?</legend>
                <div className="radio-group">
                    <input 
                        type="radio" 
                        id="social-media" 
                        name="source" 
                        value="social-media"                        
                    />
                    <label htmlFor="social-media" className="radio-label">Social media</label>

                    <input 
                        type="radio" 
                        id="friends" 
                        name="source" 
                        value="friends"                         
                    />
                    <label htmlFor="friends" className="radio-label">Friends</label>

                    <input 
                        type="radio" 
                        id="found-myself" 
                        name="source" 
                        value="found-myself" 
                    />
                    <label htmlFor="found-myself" className="radio-label">Found myself</label>
                </div>
            </fieldset>

            <button className="submit-button">
                Register
            </button>
        </form>
    );
}

export default RegisterPage;