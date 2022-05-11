import {SidebarData} from './SidebarData'

const Sidebar = () => {
  return (
    <div className="sidebar">
      {"."}
      <ul className="sidebarlist">
      {SidebarData.map((val, key) => {
        return(
          <li 
            key={key} 
            onClick={()=>{
              window.location.pathname = val.link
            }}
            className="row">

            <div id="icon">{val.icon}</div> {" "}
            <div id="title">{val.title}</div>
          </li>
        );
      })}
      </ul>
    </div>
  );
}
 
export default Sidebar;