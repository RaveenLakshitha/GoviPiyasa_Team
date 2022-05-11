import { BrowserRouter as Router,Switch,Route } from "react-router-dom";
import Dashboard from "./Dashboard";
import Shop from "./Shop";
import User from "./User";
import Items from "./Items";
import Orders from "./Orders";
import Architect from "./Architect";
import Forum from "./Forum";
import Delivery from "./Delivery";
import Information from "./Information";
import Setting from "./Setting";
import Expert from "./Expert";
import Notification from "./Notification";
import Profile from "./Profile";

const Home = () => {
  return (
    <Router>
      <div>
        <Switch>
          <Route exact path="/"><Dashboard/></Route>
          <Route path="/user"><User/></Route>
          <Route path="/shop"><Shop/></Route>
          <Route path="/expert"><Expert/></Route>
          <Route path="/items"><Items/></Route>
          <Route path="/orders"><Orders/></Route>
          <Route path="/architect"><Architect/></Route>
          <Route path="/forum"><Forum/></Route>
          <Route path="/delivery"><Delivery/></Route>
          <Route path="/information"><Information/></Route>
          <Route path="/setting"><Setting/></Route>
          <Route path="/notification"><Notification/></Route>
          <Route path="/myprofile"><Profile/></Route>
        </Switch>
      </div>
    </Router>     
  );
}
 
export default Home;