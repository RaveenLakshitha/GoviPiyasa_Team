import { Button, Col, Modal, Row } from "react-bootstrap";

const ConfirmMessage = (props) => {
  return (
    <div>
      <Modal show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>{props.title} </Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Row className="justify-content-md-center" xs={1} md={2}>
            <Col xs lg="4">
              <Button className="w-100" variant="outline-success">
                Yes
              </Button>
            </Col>
            <Col xs lg="4">
              <Button
                className="w-100"
                variant="outline-secondary"
                onClick={props.handleClose}
              >
                No
              </Button>
            </Col>
          </Row>
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default ConfirmMessage;
