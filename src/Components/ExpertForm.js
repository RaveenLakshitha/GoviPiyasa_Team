import { Form, Button, Col, Row } from "react-bootstrap";
import { Modal } from "react-bootstrap";

const ExpertForm = (props) => {

  return (
    <div>

      <Modal show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Add Delivery</Modal.Title>
        </Modal.Header>
        <Modal.Body>

      <Form>
        <Row>
          <Col>
          <Form.Group controlId="formFName">
            <Form.Label column="sm">First name</Form.Label>
            <Form.Control className="m-2 w-75" type="text" size="sm" placeholder="Enter first name" />
          </Form.Group>
          </Col>
          <Col>
            <Form.Group controlId="formLName">
              <Form.Label column="sm">Last name</Form.Label>
              <Form.Control className="m-2 w-75" type="text" size="sm" placeholder="Enter last name" />
            </Form.Group>
          </Col>
        </Row>

        <Row>
          <Col>
          <Form.Group controlId="formRole">
            <Form.Label column="sm">Designation</Form.Label>
            <Form.Control className="m-2 w-75" type="text" size="sm" placeholder="Enter your position" />
          </Form.Group>
          </Col>
          <Col>
            <Form.Group controlId="formDistrict">
              <Form.Label column="sm">District</Form.Label>
              <Form.Select className="m-2 w-75" size="sm" defaultValue="Choose...">
                <option>Choose...</option>
                <option>...</option>
              </Form.Select>
            </Form.Group>
          </Col>
        </Row>

        <Row>
          <Form.Group controlId="formEmail">
            <Form.Label column="sm">Email address</Form.Label>
            <Form.Control className="m-2 w-75" size="sm" type="email" placeholder="Enter your email" />
          </Form.Group>
        </Row>

        <Row>
          <Col>
          <Form.Group controlId="formContact">
            <Form.Label column="sm">Contact Number 1</Form.Label>
            <Form.Control className="m-2 w-100" size="sm" type="text" placeholder="Contact number" />
          </Form.Group>
          </Col>
          <Col>
            <Form.Group controlId="formContact">
              <Form.Label column="sm">Contact Number 2</Form.Label>
              <Form.Control className="m-2 w-100" size="sm" type="text" placeholder="Contact number" />
            </Form.Group>
          </Col>
        </Row>

        <Button className="m-3" variant="success">Submit</Button>
        
      </Form>
      </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={props.handleClose}>Close</Button>
        </Modal.Footer>
      </Modal>

    </div>
  );
}
 
export default ExpertForm;