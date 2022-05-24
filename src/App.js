import "./App.css";
import Login from "./Components/Login";
// import Register from "./Pages/Register";
// import Expert from "./Pages/Expert";
import Home from "./Pages/Home";
import { ToastContainer } from "react-bootstrap";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Dashboard from "./Pages/Dashboard";

import Sidebar from "./Components/Sidebar";
import Header from "./Components/Header";
import Footer from "./Components/Footer";
function App() {
  return (
    <div className="App">
      <div className="row">
        <Header />
      </div>
      <div className="row">
        <div className="col-2">
          <Sidebar />
        </div>
        <div className="col-sm-10 p-2"><Home/></div>
      </div>
      <div className="row">
        <Footer />
      </div>
    </div>
  );
}

export default App;
