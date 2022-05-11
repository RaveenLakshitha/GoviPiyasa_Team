import { Modal } from "react-bootstrap";
import { Form, Button, Col, Row } from "react-bootstrap";

const DeliveryForm = (props) => {
  
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
            <Form.Group controlId="formName">
              <Form.Label column="sm">Name</Form.Label>
              <Form.Control className="m-2 w-75" type="text" size="sm" placeholder="Enter name" />
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
            <Col>
            <Form.Group controlId="formVehicle">
              <Form.Label column="sm">Vehicle type</Form.Label>
              <Form.Select className="m-2 w-75" size="sm" defaultValue="Choose...">
                  <option>Choose...</option>
                  <option>...</option>
                </Form.Select>
            </Form.Group>
            </Col>
            <Col>
              <Form.Group controlId="formContactNo">
                <Form.Label column="sm">Contact number</Form.Label>
                <Form.Control className="m-2 w-75" type="text" size="sm" placeholder="Contact number" />
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
 
export default DeliveryForm;