import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import DeleteIcon from '@mui/icons-material/Delete';
import EditIcon from '@mui/icons-material/Edit';
import DeliveryForm from './DeliveryForm';
import { useState } from 'react';

const Delivery = () => {

  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <div>
      
      <div className="m-1">
      <div className="row">
        <div className="col-6">
          <input type="text" placeholder="Search..."/>
        </div>
        
        <div className="col-5">
          <Button variant="success" className="float-sm-end m-3" size="sm" onClick={handleShow}>Add Delivery</Button>  
          <DeliveryForm show={show} handleClose={handleClose}/>
        </div>
      </div>

      <div className="w-100">
      <Table striped hover responsive className="table"> 
        <thead>
          <tr>
            <th>Delivery ID</th>
            <th>Name</th>
            <th>Mode</th>
            <th>Contact no</th>
            <th>District</th>
            <th>Created date</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Bicycle</td>
            <td>0778876543</td>
            <td>Colombo</td>
            <td>2021-11-02</td>
            <td><EditIcon fontSize='small' style={{marginRight:'10px'}}/><DeleteIcon fontSize='small'/></td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Car</td>
            <td>0778876543</td>
            <td>Colombo</td>
            <td>2021-11-02</td>
            <td><EditIcon fontSize='small' style={{marginRight:'10px'}}/><DeleteIcon fontSize='small'/></td>
          </tr>
          <tr>
            <td>3</td>
            <td>Larry the Bird</td>
            <td>Bicycle</td>
            <td>0778876543</td>
            <td>Colombo</td>
            <td>2021-11-02</td>
            <td><EditIcon fontSize='small' style={{marginRight:'10px'}}/><DeleteIcon fontSize='small'/></td>
          </tr>
        </tbody>
      </Table>
      </div>
    </div>

    </div>
  );
}
 
export default Delivery;