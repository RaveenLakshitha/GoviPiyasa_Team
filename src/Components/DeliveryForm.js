import { Modal } from "react-bootstrap";
import { Form, Button, Col, Row } from "react-bootstrap";
import axios from "axios";
import React, { useState } from "react";

const DeliveryForm = (props) => {
  const [contact, setContact] = useState("");
  const [name, setName] = useState("");
  const [type, setType] = useState("");

  // const [data, setData] = useState({
  //   name: "",
  //   type: " ",
  //   contact: "",
  // });

  // const handleChange = (e) => {
  //   const value = e.target.value;
  //   setData({
  //     ...data,
  //     [e.target.name]: value,
  //   });
  // };
  //  axios
  //    .delete("https://mongoapi3.herokuapp.com/delivery/:id")
  //    .then(() => this.setState({ status: "Delete successful" }));

  const handleSubmit = (e) => {
    e.preventDefault();

    axios
      .post("https://mongoapi3.herokuapp.com/adddelivery", {
        contact: contact,
        name: name,
        type: type,
      })
      .then((res) => {
        console.log(res);
        console.log(res.data);
        alert("inserted");
      });
  };
  return (
    <div>
      <Modal show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Add Delivery</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form onSubmit={handleSubmit}>
            <Row>
              <Col>
                <Form.Group controlId="formName">
                  <Form.Label column="sm">Name</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    type="text"
                    size="sm"
                    name="name"
                    placeholder="Enter name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                  />
                </Form.Group>
              </Col>

              <Col>
                <Form.Group controlId="formDistrict">
                  <Form.Label column="sm">Vehicle Type</Form.Label>
                  <Form.Select
                    className="m-2 w-75"
                    size="sm"
                    defaultValue="Choose..."
                    //value={type}
                    onChange={(e) => setType(e.target.value)}
                  >
                    <option>Choose...</option>
                    <option>Car</option>
                    <option>Bike</option>
                  </Form.Select>
                </Form.Group>
              </Col>
            </Row>

            <Row>
              <Col>
                <Form.Group controlId="formVehicle">
                  <Form.Label column="sm">District</Form.Label>
                  <Form.Select
                    className="m-2 w-75"
                    size="sm"
                    defaultValue="Choose..."
                  >
                    <option>Choose...</option>
                    <option>...</option>
                  </Form.Select>
                </Form.Group>
              </Col>
              <Col>
                <Form.Group controlId="formContactNo">
                  <Form.Label column="sm">Contact number</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    type="text"
                    size="sm"
                    placeholder="Contact number"
                    value={contact}
                    onChange={(e) => setContact(e.target.value)}
                  />
                </Form.Group>
              </Col>
            </Row>

            <Button
              type="submit"
              onClick={props.handleClose}
              //  onClick={() => handleSubmit()}
              className="m-3"
              variant="success"
            >
              Submit
            </Button>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={props.handleClose}>
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
};

export default DeliveryForm;
