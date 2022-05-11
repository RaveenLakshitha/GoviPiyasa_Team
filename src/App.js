import './App.css';
import Sidebar from './Components/Sidebar';
import Header from './Components/Header';
import Footer from './Components/Footer';
import Home from './Components/Home';

function App() {
  return (
    <div className="App">
      <div className="row">
        <Header/>
      </div>
      <div className="row">
        <div className="col-2"><Sidebar/></div>
        <div className="col-sm-10 p-2"><Home/></div>
      </div>
      <div className="row">
        <Footer/>
      </div>
    </div>
  );
}

export default App;
