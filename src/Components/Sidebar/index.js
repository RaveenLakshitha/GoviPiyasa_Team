import { Link } from "react-router-dom";
import { SidebarData } from "../SidebarData";
import "./styles.css";


const Sidebar = () => {
  return (
    <div className="sidebar">
      {"."}
      <ul className="sidebarlist">
        {SidebarData.map((val, key) => {
          return (
            <li
              key={key}
              /* onClick={(event) => {
                event.preventDefault();
                window.location.pathname = val.link;
              }} */
              className="row"
            >
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
