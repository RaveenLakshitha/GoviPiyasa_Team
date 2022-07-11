import { useEffect, useState } from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import "./App.css";
import Architect from "./Pages/Architect";
import Dashboard from "./Pages/Dashboard";
import Delivery from "./Pages/Delivery";
import Expert from "./Pages/Expert";
import Forum from "./Pages/Forum";
import Home from "./Pages/Home";
import Items from "./Pages/Items";
import Login from "./Pages/Login";
import Orders from "./Pages/Orders";
import Setting from "./Pages/Setting";
import Shop from "./Pages/Shop";
import Signup from "./Pages/Signup";
import User from "./Pages/User";

function App() {
  const [LoginPass, setLoginPass] = useState(false);

  function checkLogin() {
    const token = window.localStorage.getItem("user_token");
    console.log(token);
    if (token) {
      setLoginPass(true);
    } else {
      setLoginPass(false);
    }
  }

  useEffect(() => {
    checkLogin();
  }, []);

  return (
    <Router>
      {/*  <Route
            exact
            path="/"
            element={LoginPass ? <Navigate to="/InnerPage" /> : <Login />}
          />  */}
      <div className="App">
        <Routes>
          {/* <Route
            exact
            path="/"
            element={LoginPass ? <Navigate to="/Home" /> : <Login />}
          >  */}
          <Route exact path="/" element={LoginPass ? <Home /> : <Login />}>
            <Route path="/" element={<Dashboard />} />
            <Route path="/Login" element={<Login />} />
            <Route path="/Signup" element={<Signup />} />
            <Route path="/user" element={<User />} />
            <Route path="/shop" element={<Shop />} />
            <Route path="/expert" element={<Expert />} />
            <Route path="/items" element={<Items />} />
            <Route path="/orders" element={<Orders />} />
            <Route path="/architect" element={<Architect />} />
            <Route path="/forum" element={<Forum />} />
            <Route path="/delivery" element={<Delivery />} />
            <Route path="/setting" element={<Setting />} />
          </Route>
        </Routes>
      </div>
    </Router>

    /*  <ToastContainer />
        <Sidebar />
         <Routes>
          
        </Routes> */
  );
}

export default App;
