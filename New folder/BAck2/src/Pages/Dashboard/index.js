import axios from "axios";
import React, { useEffect, useState } from "react";
import { Col, Row } from "react-bootstrap";
import { Pie, PieChart, Tooltip } from "recharts";
import "../../App.css";
import AdminCard from "../../Components/AdminCard";
import BarsChart from "../../Components/BarsChart";
import "./styles.css";

const Dashboard = () => {
  const [data1, setExpert] = useState([]);
  const [data2, setDelivery] = useState([]);
  const [data3, setArchitect] = useState([]);

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
  ////////////////////////////////////////////////////////////////////////
  /*   const url =
    "https://webhooks.mongodb-stitch.com/api/client/v2.0/app/covid-19-qppza/service/REST-API/incoming_webhook/metadata";
  const [countries, setCountries] = useState([]);
  const [selectedCountry, setSelectedCountry] = useState("");
  const [filterCountry, setFilterCountry] = useState({});

  function getRandomInt(max) {
    return Math.floor(Math.random() * max);
  }

  useEffect(() => {
    axios.get(url).then((res) => {
      setCountries(res.data.countries);
      const randomCountryNumber = getRandomInt(res.data.countries.length);
      let randomCountry = res.data.countries[randomCountryNumber];
      setSelectedCountry(randomCountry);
      setFilterCountry({ country: randomCountry });
    });
  }, []);

  useEffect(() => {
    if (selectedCountry !== "") {
      setFilterCountry({ country: selectedCountry });
    }
  }, [selectedCountry]); */
  /////////////////////////////////////////////////////////////////////////
  return (
    <div className="App1">
      {/* <div className="Card1"> */}
      <Row md="auto">
        <Col>
          <AdminCard name="Buyers" value="40" />
        </Col>
        <Col>
          <AdminCard name="Sellers" value="10" />
        </Col>
        <Col>
          <AdminCard name="Delivery" value={data2} />
        </Col>
      </Row>

      <Row>
        <Col>
          <AdminCard name="Architectures" value={data3} />
        </Col>
        <Col>
          <AdminCard name="Experts" value={data1} />
        </Col>
        <Col>
          <AdminCard name="Online Payments" value="320" />
        </Col>
      </Row>

      <Row>
        <Col>
          <AdminCard name="Cache on Delivery" value="80" />
        </Col>
        <Col>
          <AdminCard name="Weekly Orders" value="400" />
        </Col>
        <Col>
          <AdminCard name="Online Payments" value="320" />
        </Col>
      </Row>

      <div style={{ textAlign: "center" }}>
        <div className="Chart">
          <div className="charts">
            <BarsChart
              height={"640px"}
              width={"400px"}
              chartId={"629ba3d5-e169-4803-8e37-bd33ab5765e7"}
            />
          </div>
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
      </div>
    </div>
  );
};

export default Dashboard;
