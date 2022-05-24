import { ToastContainer } from "react-bootstrap";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import "./App.css";
import Footer from "./Components/Footer/index";
import Header from "./Components/Header";
import Sidebar from "./Components/Sidebar";
import Architect from "./Pages/Architect";
import Dashboard from "./Pages/Dashboard/index";
import Delivery from "./Pages/Delivery";
import Expert from "./Pages/Expert";
import Forum from "./Pages/Forum";
import Information from "./Pages/Information";
import Items from "./Pages/Items";
import Login from "./Pages/Login";
import Notification from "./Pages/Notification";
import Orders from "./Pages/Orders";
import Profile from "./Pages/Profile";
import Setting from "./Pages/Setting";
import Shop from "./Pages/Shop";
import User from "./Pages/User";
function App() {
  return (
    <Router>
      <Header />
      <div className="App">
        <ToastContainer />
        <Sidebar />
        <Routes>
          <Route exact path="/Login" element={<Login />} />
          <Route exact path="/" element={<Dashboard />} />
          <Route path="/user" element={<User />} />
          <Route path="/shop" element={<Shop />} />
          <Route path="/expert" element={<Expert />} />
          <Route path="/items" element={<Items />} />
          <Route path="/orders" element={<Orders />} />
          <Route path="/architect" element={<Architect />} />
          <Route path="/forum" element={<Forum />} />
          <Route path="/delivery" element={<Delivery />} />
          <Route path="/information" element={<Information />} />
          <Route path="/setting" element={<Setting />} />
          <Route path="/notification" element={<Notification />} />
          <Route path="/myprofile" element={<Profile />} />
        </Routes>
      </div>
      <Footer />
    </Router>
  );
}

export default App;
