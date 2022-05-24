import { Routes, Route, BrowserRouter } from "react-router-dom";

import Dashboard from "../Pages/Dashboard";
import Shop from "../Pages/Shop";
import User from "../Pages/User";
import Items from "../Pages/Items";
import Orders from "../Pages/Orders";
import Architect from "../Pages/Architect";
import Forum from "../Pages/Forum";
import Delivery from "../Pages/Delivery";
import Information from "../Pages/Information";
import Setting from "../Pages/Setting";
import Expert from "../Pages/Expert";
import Notification from "../Pages/Notification";
import Profile from "../Pages/Profile";

import Register from "../Pages/Register";
import "../App.css";


function Home() {
  return(
    
  
       <BrowserRouter>
            <Routes>
              <Route exact path="/dashboard" element={<Dashboard />} />
              <Route path="/user" element={<User />} />
              <Route path="/shop" element={<Shop />} />
              <Route path="/expert" element={<Expert />} />
              <Route path="/items" element={<Items />} />
              <Route path="/orders" element={<Orders />} />
              <Route path="/architect" element={<Architect />} />
              <Route path="/forum" element={<Forum />} />
              <Route path="/delivery" element={<Delivery />} />s
              <Route path="/information" element={<Information />} />
              <Route path="/setting" element={<Setting />} />
              <Route path="/notification" element={<Notification />} />
              <Route path="/register" element={<Register />} />
              <Route path="/myprofile" element={<Profile />} />
            </Routes>
          </BrowserRouter>
    
  );
}

export default Home;
