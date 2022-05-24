import { Button, Form, Modal, Row } from "react-bootstrap";

const NotificationForm = (props) => {
  return (
    <div>
      <Modal show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Add Notification</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Row>
              <Form.Group controlId="formTitle">
                <Form.Label column="sm">Title</Form.Label>
                <Form.Control
                  className="m-2 w-75"
                  type="text"
                  size="sm"
                  placeholder="Enter message title"
                />
              </Form.Group>
            </Row>

            <Row>
              <Form.Group controlId="formMsg">
                <Form.Label column="sm">Message</Form.Label>
                <Form.Control
                  className="m-2 w-75"
                  as="textarea"
                  size="sm"
                  placeholder="Your message here"
                />
              </Form.Group>
            </Row>

            <Button className="m-3" variant="success">
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

export default NotificationForm;
