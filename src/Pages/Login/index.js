import React, { useState } from "react";

export default function Login() {
  const [email, setemail] = useState("");
  const [password, setpassword] = useState("");

  /* const userLogin = async (event) => {
    event.preventDefault();

    try {
      const data = await axios.post("http://localhost:5000/api/v1/shops");
      console.log(data);
      console.log(data.status);
      console.log(data.data.data[0].shopName);
    } catch (e) {
      console.log(e);
    }
  }; */

  return (
    <div className="App1">
      <form>
        <input
          value={email}
          type="text"
          placeholder="email"
          onChange={(e) => setemail(e.target.value)}
        />
        <input
          value={password}
          type="text"
          placeholder="password"
          onChange={(e) => setpassword(e.target.value)}
        />
        <input type="submit" value="Register"></input>
      </form>
    </div>
  );
}
