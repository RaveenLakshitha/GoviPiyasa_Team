import {Modal} from 'react-bootstrap';

const UserModal = (show) => {

  return (
    <div>
      <Modal show={show}>
        <Modal.Header closeButton>
          Title
        </Modal.Header>
        <Modal.Body>
          Modal body
        </Modal.Body>
      </Modal>
    </div>
  );
}
 
export default UserModal;