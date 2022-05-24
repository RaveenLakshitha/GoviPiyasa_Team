import React, { useState, useEffect } from "react";
import axios from "axios";
import { ToastContainer, toast } from "react-toastify";
//import { useCookies } from "react-cookie";
import { Link, useNavigate } from "react-router-dom";
import "../index.css";
function Register() {
  //const [cookies] = useCookies(["cookie-name"]);
  const [password, setPassword] = useState("");
  const [email, setEmail] = useState("");
  /* const navigate = useNavigate();
  useEffect(() => {
    if (cookies.jwt) {
      navigate("/");
    }
  }, [cookies, navigate]);

  const [values, setValues] = useState({ email: "", password: "" });
  const generateError = (error) =>
    toast.error(error, {
      position: "bottom-right",
    });*/
  const handleSubmit = async (event) => {
    event.preventDefault();
    console.log("Ok");
    axios
      .post("http://localhost:4000/register", {
        password: password,
        email: email,
      })
      .then((res) => {
        console.log(res);
        console.log(res.data);
        alert("inserted");
      }); /*
    try {
      const { data } = await axios.post(
        "http://localhost:4000/register",
        {
          ...values,
        },
        { withCredentials: true }
      );
      if (data) {
        if (data.errors) {
          const { email, password } = data.errors;
          if (email) generateError(email);
          else if (password) generateError(password);
        } else {
          // navigate("/");
        }
      }
    } catch (ex) {
      console.log(ex);
    }*/
  };
  return (
    <div className="container2">
      <h2>Register Account</h2>
      <form onSubmit={(e) => handleSubmit(e)}>
        <div>
          <label htmlFor="email">Email</label>
          <input
            type="email"
            name="email"
            value={email}
            placeholder="Email"
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div>
          <label htmlFor="password">Password</label>
          <input
            type="password"
            placeholder="Password"
            name="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <button type="submit">Submit</button>
        <span>
          Already have an account ?<Link to="/login"> Login</Link>
        </span>
      </form>
      <ToastContainer />
    </div>
  );
}

export default Register;
