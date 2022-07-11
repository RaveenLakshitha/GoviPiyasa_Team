import { Link } from "react-router-dom";

const Orders = () => {
  return (
    <div className="App1">
      <h1>Orders</h1>

      <nav>
        <Link to="/user/profile">Profile</Link>
        <Link to="/user/account">Account</Link>
      </nav>
    </div>
  );
};

export default Orders;
