import axios from "axios";
import React, { useEffect, useState } from "react";
import { Button, Col, Form, Modal, Row } from "react-bootstrap";

const ExpertForm = (props) => {
  const [contact, setContact] = useState("");
  const [name, setName] = useState("");
  const [designation, setDesig] = useState("");
  const [location, setLoc] = useState("");
  const [email, setEmail] = useState("");
  const [image, setImage] = useState("");
  const [passwd, setPasswd] = useState("");
  const [qualif, setQualif] = useState("");

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
      updateExpert(id);
    }
  }, [id]);

  const updateExpert = async (id) => {
    const response = await axios.get(`https://mongoapi3.herokuapp.com/${id}`);

    if (response.status === 200) {
      //setState({ ...response.data[0] });
      setName(response.data.name);
      setContact(response.data.contact);
      setDesig(response.data.designation);
      setLoc(response.data.city);
      setEmail(response.data.email);
      setImage(response.data.profilePicture);
      setPasswd(response.data.passwd);
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("mama wada");
    // if(!)
    axios
      .post(
        "https://govi-piyasa-v-0-1.herokuapp.com/api/v1/auths/registerExpert",
        {
          userName: name,
          //designation: designation,
          contactNumber: contact,
          city: location,
          email: email,
          password: passwd,
          profilePicture: image,
        }
      )
      .then((res) => {
        console.log(res);
        console.log(res.data);
        alert("Inserted");
      });
  };

  return (
    <div>
      <Modal size="lg" show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Add Expert</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form onSubmit={handleSubmit}>
            <Row>
              <Col>
                <Form.Group controlId="formFName">
                  <Form.Label column="sm">Name</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    type="text"
                    size="sm"
                    placeholder="Enter the name"
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
                    placeholder="Enter the position"
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
                    className="m-2 w-75"
                    size="sm"
                    type="text"
                    placeholder="Contact number"
                    value={contact}
                    onChange={(e) => setContact(e.target.value)}
                  />
                </Form.Group>
              </Col>
              <Col>
                <Form.Group controlId="formEmail">
                  <Form.Label column="sm">Email</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    size="sm"
                    type="text"
                    placeholder="Email address"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                  />
                </Form.Group>
              </Col>
            </Row>
            <Row>
              <Col>
                <Form.Group controlId="formPwd">
                  <Form.Label column="sm">Password</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    size="sm"
                    type="text"
                    placeholder="Password"
                    value={passwd}
                    onChange={(e) => setPasswd(e.target.value)}
                  />
                </Form.Group>
              </Col>
              <Col>
                <Form.Group controlId="formquli">
                  <Form.Label column="sm">Qualifications</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    size="sm"
                    type="text"
                    placeholder="Qualifications"
                    value={qualif}
                    onChange={(e) => setQualif(e.target.value)}
                  />
                </Form.Group>
              </Col>
            </Row>

            <Row>
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
              <Col>
                <Form.Group controlId="formprofile">
                  <Form.Label column="sm">Profile Picture</Form.Label>
                  <Form.Control
                    className="m-2 w-75"
                    size="sm"
                    type="file"
                    placeholder="Enter profile picture"
                    value={image}
                    onChange={(e) => setImage(e.target.value)}
                  />
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
