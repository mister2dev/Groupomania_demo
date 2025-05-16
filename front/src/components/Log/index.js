import React, { useState } from "react";
import SignInForm from "./SignInForm";
import SignUpForm from "./SignUpForm";

const Log = () => {
  const [signUpModal, setSignUpModal] = useState();
  const [signInModal, setSignInModal] = useState(true);

  // Mise en place des modals inscription ou connexion

  const handleModals = (e) => {
    if (e.target.id === "register") {
      setSignInModal(false);
      setSignUpModal(true);
    } else if (e.target.id === "login") {
      setSignUpModal(false);
      setSignInModal(true);
    }
  };

  return (
    <div className="connection-form">
      <div className="img-container"></div>
      {/* Affichage conditionnel en fonction de l'état */}
      {signUpModal && <SignUpForm />}
      {signInModal && <SignInForm />}

      <div className="form-container">
        <ul>
          <li onClick={handleModals} id="register">
            Inscription
          </li>
          <li onClick={handleModals} id="login">
            Connexion
          </li>
        </ul>
      </div>
    </div>
  );
};

export default Log;
