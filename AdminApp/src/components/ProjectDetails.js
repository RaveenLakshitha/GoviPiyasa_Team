import { Card, Button, Image, Row, Col } from "react-bootstrap";

const ProjectDetails = () => {

  return (
    <div>
      <Card m-6>
        <Card.Header as="h4" className="text-center">Mock's projects</Card.Header>
        <Card.Body>
          <Card.Title>Description</Card.Title>
          <Card.Text>
            With supporting text below as a natural lead-in to additional content.
          </Card.Text>
          <Card.Title>Designs</Card.Title>
          <Card.Text>
            <Row>
              <Col xs={4} md={2}>
                <Image src="https://i.pinimg.com/originals/f8/0b/09/f80b09090fbbd387196f8d1bb9520759.jpg" thumbnail />
              </Col>
            </Row>
            
          </Card.Text>
          <Button size="sm" variant="secondary" color="white" float-end
            onClick={()=>{
              window.location.pathname = "/architect"
            }}>
              Back
          </Button>
        </Card.Body>
      </Card>
    </div>
  );
}
 
export default ProjectDetails;