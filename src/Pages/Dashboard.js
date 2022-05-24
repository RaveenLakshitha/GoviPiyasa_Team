import { Card, Row, Col } from "react-bootstrap";
import axios from "axios";
import React, { useEffect, useState } from "react";
import DatePicker from "react-datepicker";

import {
  PieChart,
  Pie,
  Tooltip,
  BarChart,
  XAxis,
  YAxis,
  Legend,
  CartesianGrid,
  Bar,
} from "recharts";
import "../App.css";

const Dashboard = () => {
  //static demoUrl = "https://codesandbox.io/s/stacked-area-chart-ix341";
  const [data1, setExpert] = useState([]);
  const [data2, setDelivery] = useState([]);
  const [data3, setArchitect] = useState([]);
  const [show1, setShow] = useState(false);
  const [show2, setShow1] = useState(false);

  useEffect(() => {
    getExpertCount();
    getDeliverCount();
    getArchitectCount();
  }, []);
  const getExpertCount = async () => {
    try {
      const data = await axios.get("https://mongoapi3.herokuapp.com/experts");
      setExpert(data.data.length);
    } catch (e) {
      console.log(e);
    }
  };
  const getDeliverCount = async () => {
    try {
      const data = await axios.get("https://mongoapi3.herokuapp.com/delivery");
      console.log(data.data.length);
      setDelivery(data.data.length);
    } catch (e) {
      console.log(e);
    }
  };
  const getArchitectCount = async () => {
    try {
      const data = await axios.get("https://mongoapi3.herokuapp.com/architect");
      console.log(data.data.length);
      setArchitect(data.data.length);
    } catch (e) {
      console.log(e);
    }
  };
  const data = [
    { name: "Expert", users: data1 },
    { name: "Delivery", users: data2 },
    { name: "Architectures", users: data3 },
    { name: "Telegram", users: data2 },
  ];
  return (
    <div>
      <div className="page-header">
        <h3 className="page-title">
          <span className="page-title-icon bg-gradient-primary text-white mr-2">
            <i className="mdi mdi-home"></i>
          </span>{" "}
          Dashboard{" "}
        </h3>
        <nav aria-label="breadcrumb">
          <ul className="breadcrumb">
            <li className="breadcrumb-item active" aria-current="page">
              <span></span>Overview{" "}
              <i className="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
          </ul>
        </nav>
      </div>

      <Row xs={6} md={4}>
        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-warning"
          >
            <Card.Body>
              <Card.Title>Sellers</Card.Title>
              <Card.Text>14</Card.Text>
            </Card.Body>
          </Card>
        </Col>

        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-success"
          >
            <Card.Body>
              <Card.Title>Buyers</Card.Title>
              <Card.Text>23</Card.Text>
            </Card.Body>
          </Card>
        </Col>
        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-success"
            onClick={() => setShow1(true)}
          >
            <Card.Body>
              <Card.Title>Experts</Card.Title>
              <Card.Text>{data1}</Card.Text>
            </Card.Body>
          </Card>
        </Col>

        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-success"
            onClick={() => setShow(true)}
          >
            <Card.Body>
              <Card.Title>Delivery</Card.Title>
              <Card.Text>{data2}</Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      <Row xs={6} md={4}>
        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className=" m-4 w-75 text-center bg-success"
          >
            <Card.Body>
              <Card.Title>Architectures</Card.Title>
              <Card.Text>{data3}</Card.Text>
            </Card.Body>
          </Card>
        </Col>

        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-success"
          >
            <Card.Body>
              <Card.Title>Online Payments</Card.Title>
              <Card.Text>11</Card.Text>
            </Card.Body>
          </Card>
        </Col>
        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-success"
          >
            <Card.Body>
              <Card.Title>Online Payments</Card.Title>
              <Card.Text>11</Card.Text>
            </Card.Body>
          </Card>
        </Col>
        <Col>
          <Card
            border="success"
            style={{ width: "18rem" }}
            className="m-4 w-75 text-center bg-success"
          >
            <Card.Body>
              <Card.Title>Online Payments</Card.Title>
              <Card.Text>11</Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>

      <div style={{ textAlign: "center" }}>
        {show1 ? (
          <div className="Chart">
            {
              <BarChart
                width={400}
                height={300}
                data={data}
                margin={{
                  top: 10,
                  right: 30,
                  left: 30,
                  bottom: 5,
                }}
                barSize={20}
              >
                <XAxis
                  dataKey="name"
                  scale="point"
                  padding={{ left: 10, right: 10 }}
                />
                <YAxis />
                <Tooltip />
                <Legend />
                <CartesianGrid strokeDasharray="3 3" />
                <Bar
                  dataKey="users"
                  fill="#36ed2f"
                  background={{ fill: "#eee" }}
                />
              </BarChart>
            }

            <PieChart width={300} height={300}>
              <Pie
                dataKey="users"
                isAnimationActive={false}
                data={data}
                cx={200}
                cy={200}
                outerRadius={80}
                fill="#36ed2f"
                label
              />
              <Tooltip />
            </PieChart>
          </div>
        ) : null}
        {show2 ? (
          <PieChart width={300} height={300}>
            <Pie
              dataKey="users"
              isAnimationActive={false}
              data={data}
              cx={200}
              cy={200}
              outerRadius={80}
              fill="#b7ed2f"
              label
            />
            <Tooltip />
          </PieChart>
        ) : null}
        <div className="col-lg-5 grid-margin stretch-card">
          <div className="card">
            <div className="card-body p-0 d-flex">
              <div className="dashboard-custom-date-picker">
                <DatePicker
                  inline
                  selected={this.state.startDate}
                  onChange={this.handleChange}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
