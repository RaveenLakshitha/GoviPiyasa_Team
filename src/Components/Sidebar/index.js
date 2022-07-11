import CloseIcon from "@mui/icons-material/Close";
import React, { useState } from "react";
//import { Outlet } from "react-router";
import { Link } from "react-router-dom";
import { SidebarData } from "../SidebarData";
import "./styles.css";
const Sidebar = () => {
  const [sbar, setsbar] = useState(false);
  const showSbar = () => setsbar(!sbar);

  return (
    <div className="sidebar">
      {"."}
      <li className="row">
        <Link to="#" className="link">
          <li className="sideBarList">
            <CloseIcon onClick={showSbar} />
          </li>
        </Link>
      </li>
      <ul className="sidebarlist">
        {SidebarData.map((val, key) => {
          return (
            <li key={key} className="row">
              <Link to={val.link} className="link">
                <li className="sideBarList">
                  <div id="icon">{val.icon}</div>{" "}
                  <div id="title">{val.title}</div>
                </li>
              </Link>

              {/* <li className="sideBarListItem"><InventoryIcon className='sideBarIcon'/>Products</li> */}
            </li>
          );
        })}
      </ul>
    </div>
  );
};

export default Sidebar;
