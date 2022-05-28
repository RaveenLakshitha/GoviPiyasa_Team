import { useState } from "react";
import { Button, Card, Col, Dropdown, Row } from "react-bootstrap";
import "../../App.css";
import InfoCropForm from "../../Components/InfoCropForm";
import anthurium from "../../Images/anthurium.jpg";
import mango from "../../Images/mango.jpg";
import rice from "../../Images/rice.jpg";
const Information = () => {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <div className="App1">
      <div className="m-1">
        <div className="row">
          <div className="col-5">
            <input type="text" placeholder="Search..." />
          </div>
          <div className="col-3">
            <br></br>
            <Dropdown>
              <Dropdown.Toggle
                variant="outline-success"
                id="dropdown-basic"
                size="sm"
              >
                Select category
              </Dropdown.Toggle>
              <Dropdown.Menu>
                <Dropdown.Item href="#/action-1">Flowers</Dropdown.Item>
                <Dropdown.Item href="#/action-2">Vegetables</Dropdown.Item>
                <Dropdown.Item href="#/action-3">Fruits</Dropdown.Item>
              </Dropdown.Menu>
            </Dropdown>
          </div>

          <div className="col-4">
            <Button
              variant="success"
              className="float-sm-end m-3"
              size="sm"
              onClick={handleShow}
            >
              Add Crop
            </Button>
            <InfoCropForm
              show={show}
              title="Add Crop"
              handleClose={handleClose}
            />
          </div>
        </div>

        <div className="w-100">
          <br></br>
          <Row>
            <Col>
              <Card style={{ width: "10rem" }}>
                <Card.Link>
                  <Card.Img
                    variant="top"
                    width="100%"
                    height="120px"
                    src={anthurium}
                  />
                </Card.Link>
                <Card.Body>
                  <Card.Text>Anthuriam</Card.Text>
                </Card.Body>
              </Card>
            </Col>
            <Col>
              <Card style={{ width: "10rem" }}>
                <Card.Link>
                  <Card.Img
                    variant="top"
                    width="100%"
                    height="120px"
                    src={rice}
                  />
                </Card.Link>
                <Card.Body>
                  <Card.Text>Rice</Card.Text>
                </Card.Body>
              </Card>
            </Col>
            <Col>
              <Card style={{ width: "10rem" }}>
                <Card.Link>
                  <Card.Img
                    variant="top"
                    width="100%"
                    height="120px"
                    src={mango}
                  />
                </Card.Link>
                <Card.Body>
                  <Card.Text>Mango</Card.Text>
                </Card.Body>
              </Card>
            </Col>
            <Col>
              <Card style={{ width: "10rem" }}>
                <Card.Link>
                  <Card.Img variant="top" src="../Images/rice.jpg" />
                </Card.Link>
                <Card.Body>
                  <Card.Text>Anthuriam</Card.Text>
                </Card.Body>
              </Card>
            </Col>
            <Col>
              <Card style={{ width: "10rem" }}>
                <Card.Link>
                  <Card.Img variant="top" src="../Images/rice.jpg" />
                </Card.Link>
                <Card.Body>
                  <Card.Text>Anthuriam</Card.Text>
                </Card.Body>
              </Card>
            </Col>
          </Row>
        </div>
      </div>
    </div>
  );
};

export default Information;
