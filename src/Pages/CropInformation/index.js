const CropInformation = () => {
  return (
    <div>
      <div className="row">
        <div className="col-10">
        </div>
        <div className="col-2">
          <Button variant="success" size="sm" onClick={handleShow}>Add Detail</Button>
          <NotificationForm show={show} handleClose={handleClose}/>
        </div>
      </div>

      <Card className="m-4 w-75">
        <Card.Body>
          <Card.Title>How to cultivate</Card.Title>
          <Card.Text>
            With supporting text below as a natural lead-in to additional content.
          </Card.Text>
          <Button size="sm" variant="outline-success" onClick={handleShowDelete}>
            <DeleteIcon fontSize="small" /></Button>
            <ConfirmMessage title="Do you want to delete?" show={showDelete} handleClose={handleCloseDelete}/>

          <Button size="sm" variant="secondary" color="white" className="m-2">
            <DeleteIcon fontSize="small" />
          </Button>
        </Card.Body>
      </Card>

    </div>
  );
}
 
export default CropInformation;