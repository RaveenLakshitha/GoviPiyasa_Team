import axios from "axios";
import React, { useState } from "react";
import { Navigate } from "react-router";
export default function Signup() {
  const [email, setemail] = useState("");
  const [password, setpassword] = useState("");
  const [LoginPass, setLoginPass] = useState(false);
  const userLogin = async (event) => {
    event.preventDefault();

    try {
      const data = await axios.post(
        "http://localhost:5000/api/v1/auths/login",
        { email, password }
      );
      console.log(data.data.token);
      window.localStorage.setItem("user_token", data.data.token);
      console.log(window.localStorage.getItem("user_token"));
      setLoginPass(true);
    } catch (e) {
      console.log(e);
    }
  };
  if (LoginPass) {
    return <Navigate to="/Home" />;
  }
  return (
    <div className="App1">
      <form onSubmit={userLogin}>
        <input
          value={email}
          type="text"
          placeholder="email"
          onChange={(e) => setemail(e.target.value)}
        />
        <input
          value={password}
          type="password"
          placeholder="password"
          onChange={(e) => setpassword(e.target.value)}
        />
        <input type="submit" value="Login"></input>
      </form>
    </div>
  );
}
