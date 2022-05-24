import AccountCircleOutlinedIcon from "@mui/icons-material/AccountCircleOutlined";
import NotificationsNoneIcon from "@mui/icons-material/NotificationsNone";
import SettingsIcon from "@mui/icons-material/Settings";
import React from "react";
import logo from "../logo.png";
import "./styles.css";
const Header = () => {
  return (
    <div className="header">
      <div className="row">
        <div className="col-10">
          <div className="image">
            <img src={logo} height="50" alt="" />
          </div>
        </div>

        <div className="col-2">
          <NotificationsNoneIcon
            className="float-start m-3"
            onClick={() => {
              window.location.pathname = "/notification";
            }}
          />

          <AccountCircleOutlinedIcon
            className="m-3"
            onClick={() => {
              window.location.pathname = "/myprofile";
            }}
          />

          <SettingsIcon
            className="m-3"
            onClick={() => {
              window.location.pathname = "/setting";
            }}
          />
        </div>
      </div>
    </div>
  );
};

export default Header;
