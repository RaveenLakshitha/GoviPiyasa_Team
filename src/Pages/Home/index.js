import { Outlet } from "react-router";
import Sidebar from "../../Components/Sidebar";
import "./styles.css";
export default function Home() {
  return (
    <div className="HomeMain">
      <Sidebar />
      <Outlet />
    </div>
  );
}
