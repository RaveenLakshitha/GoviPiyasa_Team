import axios from "axios";
import React from "react";
import { Link, useNavigate } from "react-router-dom";
import logo from "../logo.png";
import "./styles.css";
const Header = () => {
  const navigate = useNavigate();
  const signOutClick = async (event) => {
    event.preventDefault();

    try {
      const data = await axios.post(
        "http://localhost:5000/api/v1/auths/signoutUser"
      );
      console.log(data.data.token);
      localStorage.removeItem("token");
      console.log(window.localStorage.getItem("token"));
      navigate("/login");
    } catch (e) {
      console.log(e);
    }
  };

  ////////////////////////////////////////

  ////////////////////////////////////////
  return (
    <div className="header">
      <div className="homeLogo">
        <Link to="/" className="link">
          <div>
            <div className="image">
              <img src={logo} height="50" alt="" />
            </div>
          </div>
        </Link>
      </div>
      <div>
        {/*  <NotificationsNoneIcon
            className="float-start m-3"
            onClick={() => {
              window.location.pathname = "/notification";
            }}
          /> */}
        <div className="barButtons">
          <Link to="/login" className="link">
            <li className="sideBarList">
              <div id="title">Log in</div>
            </li>
          </Link>
          <button className="float-start m-3" onClick={signOutClick}>
            Sign Out
          </button>
          <Link to="/about" className="link">
            <li className="sideBarList">
              <div id="title">About</div>
            </li>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Header;
