import { Modal } from "react-bootstrap";

const UserModal = (props) => {
  return (
    <div>
      <Modal show={props.show} onHide={props.onHide}>
        <Modal.Header closeButton>Title</Modal.Header>
        <Modal.Body>Modal body</Modal.Body>
      </Modal>
    </div>
  );
};

export default UserModal;
