import { Card, Button } from "react-bootstrap";
import NotificationForm from "./NotificationForm";
import { useState } from "react";

const Notification = () => {

  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <div>
      <h2 className="text-center">Notifications</h2>
      <div className="row">
        <div className="col-10">
          <input type="text" placeholder="Search..."/>
        </div>
        <div className="col-2">
          <Button variant="success" size="sm" onClick={handleShow}>Add Notification</Button>
          <NotificationForm show={show} handleClose={handleClose}/>
        </div>
      </div>
      
    <div className="row">
      <Card className="m-4 w-75">
        <Card.Body>
          <Card.Title>New Update</Card.Title>
          <Card.Text>
            With supporting text below as a natural lead-in to additional content.
          </Card.Text>
          <Button size="sm" variant="secondary" color="white" float-end>
              Publish
          </Button>
          <Button size="sm" variant="secondary" color="white" className="m-2">
              Discard
          </Button>
        </Card.Body>
      </Card>
      </div>
    </div>
  );
}
 
export default Notification;