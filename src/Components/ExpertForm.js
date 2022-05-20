import { Form, Button, Col, Row } from "react-bootstrap";
import { Modal } from "react-bootstrap";
import axios from "axios";
import React, { useState, useEffect } from "react";
const ExpertForm = (props) => {
  const [contact, setContact] = useState("");
  const [name, setName] = useState("");
  const [designation, setDesig] = useState("");
  const [location, setLoc] = useState("");
  // const [data, setData] = useState([]);
  // useEffect(async () => {
  //   let result = await fetch(
  //     "https://mongoapi3.herokuapp.com/" + props.match.params.id
  //   );
  //   result = await result.json();
  //   setData(result);
  // });
  const id = props.id;
  useEffect(() => {
    console.log("got it");
    if (id) {
      console.log(id);
      getSingleUser(id);
    }
  }, [id]);
  const getSingleUser = async (id) => {
    const response = await axios.get(`https://mongoapi3.herokuapp.com/${id}`);
    if (response.status === 200) {
      //setState({ ...response.data[0] });
      setName(response.data.name);
      setContact(response.data.contact);
      setDesig(response.data.designation);
      setLoc(response.data.location);
    }
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("mama wada");
    // if(!)
    axios
      .post("https://mongoapi3.herokuapp.com/addexpert", {
        name: name,
        designation: designation,
        contact: contact,
        location: location,
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
          <Modal.Title>Add Expert</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form onSubmit={handleSubmit}>
            <Row>
              <Col>
                <Form.Group controlId="formFName">
                  <Form.Label column="sm">First name</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    type="text"
                    size="sm"
                    placeholder="Enter first name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                  />
                </Form.Group>
              </Col>
              <Col>
                <Form.Group controlId="formRole">
                  <Form.Label column="sm">Designation</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    type="text"
                    size="sm"
                    placeholder="Enter your position"
                    value={designation}
                    onChange={(e) => setDesig(e.target.value)}
                  />
                </Form.Group>
              </Col>
            </Row>

            <Row>
              <Col>
                <Form.Group controlId="formContact">
                  <Form.Label column="sm">Contact Number</Form.Label>
                  <Form.Control
                    className="m-2 w-100"
                    size="sm"
                    type="text"
                    placeholder="Contact number"
                    value={contact}
                    onChange={(e) => setContact(e.target.value)}
                  />
                </Form.Group>
              </Col>
              <Col>
                <Form.Group controlId="formDistrict">
                  <Form.Label column="sm">Location</Form.Label>
                  <Form.Select
                    className="m-2 w-75"
                    size="sm"
                    defaultValue="Choose..."
                    onChange={(e) => setLoc(e.target.value)}
                  >
                    <option>Choose...</option>
                    <option>Gampaha</option>
                    <option>Colombo</option>
                  </Form.Select>
                </Form.Group>
              </Col>
            </Row>

            <Button
              className="m-3"
              variant="success"
              type="submit"
              onClick={props.handleClose}
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

export default ExpertForm;
