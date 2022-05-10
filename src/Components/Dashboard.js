import { Card, Row, Col } from "react-bootstrap";

const Dashboard = () => {
  return (
    <div>
      <Row xs={6} md={4}>
      <Col>
        <Card border="success" style={{ width: '18rem' }} className="m-4 w-75 text-center">
          <Card.Body>
            <Card.Title>Sellers</Card.Title>
            <Card.Text>
              14
            </Card.Text>
          </Card.Body>
        </Card>
      </Col>

      <Col>
      <Card border="success" style={{ width: '18rem' }} className="m-4 w-75 text-center">
        <Card.Body>
          <Card.Title>Buyers</Card.Title>
          <Card.Text>
            23
          </Card.Text>
        </Card.Body>
      </Card>
      </Col>

      <Col>
      <Card border="success" style={{ width: '18rem' }} className="m-4 w-75 text-center">
        <Card.Body>
          <Card.Title>Experts</Card.Title>
          <Card.Text>
            23
          </Card.Text>
        </Card.Body>
      </Card>
      </Col>

      <Col>
      <Card border="success" style={{ width: '18rem' }} className="m-4 w-75 text-center">
        <Card.Body>
          <Card.Title>Architects</Card.Title>
          <Card.Text>
            03
          </Card.Text>
        </Card.Body>
      </Card>
      </Col>

      </Row>

      <Row xs={6} md={4}>
      <Col>
        <Card border="success" style={{ width: '18rem' }} className="m-4 w-75 text-center">
          <Card.Body>
            <Card.Title>Weekly Orders</Card.Title>
            <Card.Text>
              08
            </Card.Text>
          </Card.Body>
        </Card>
      </Col>

      <Col>
        <Card border="success" style={{ width: '18rem' }} className="m-4 w-75 text-center">
          <Card.Body>
            <Card.Title>Online Payments</Card.Title>
            <Card.Text>
              11
            </Card.Text>
          </Card.Body>
        </Card>
      </Col>


      </Row>

    </div>
  );
}
 
export default Dashboard;