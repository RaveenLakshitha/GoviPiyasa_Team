import './App.css';
import Sidebar from './components/Sidebar';
import Header from './components/Header';
import Footer from './components/Footer';
import Home from './components/Home';

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
