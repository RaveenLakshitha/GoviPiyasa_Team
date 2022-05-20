import { Form, Button, Col, Row } from "react-bootstrap";
import { Modal } from "react-bootstrap";

const InfoCropForm = (props) => {

  return (
    <div>

      <Modal show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>{props.title}</Modal.Title>
        </Modal.Header>
        <Modal.Body>

      <Form>
        <Row>
          <Col>
          <Form.Group controlId="formFName">
            <Form.Label column="sm">Crop name</Form.Label>
            <Form.Control className="m-2 w-75" type="text" size="sm" placeholder="Enter first name" />
          </Form.Group>
          </Col>
          <Col>
          <Form.Group controlId="formDistrict">
              <Form.Label column="sm">Category</Form.Label>
              <Form.Select className="m-2 w-75" size="sm" defaultValue="Choose...">
                <option>Choose...</option>
                <option>...</option>
              </Form.Select>
            </Form.Group>
          </Col>
        </Row>

        <Row>
          <Form.Group controlId="forminfotitle">
            <Form.Label column="sm">Title</Form.Label>
            <Form.Control className="m-2 w-75" size="sm" type="email" placeholder="Enter title" />
          </Form.Group>
          
        </Row>

        <Row>
        <Form.Group controlId="forminfodesc">
          <Form.Label column="sm">Description</Form.Label>
          <Form.Control className="m-2 w-75" size="sm" as="textarea" rows={3} placeholder="Enter description" />
        </Form.Group>
          
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
 
export default InfoCropForm;