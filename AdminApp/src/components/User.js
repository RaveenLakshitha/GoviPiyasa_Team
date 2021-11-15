import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import DeleteIcon from '@mui/icons-material/Delete';
import UserModal from './UserModal';
import { useState } from 'react';

const User = () => {

  const [show, setShow] = useState(false);

  //const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (

    <div className="m-1">
      <div className="row">
        <div className="col-6">
     
          <input type="text" placeholder="Search..."/>
        </div>
        
        <div className="col-5">
          <Button variant="success" className="float-sm-end m-3" onClick={()=>handleShow()}>Add user</Button>
          <UserModal show={show}/>
        </div>
      </div>

      <div className="w-100">
      <Table striped hover responsive className="table"> 
        <thead>
          <tr>
            <th>User ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Role</th>
            <th>Email</th>
            <th>Contact no</th>
            <th>City</th>
            <th>Created date</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>Seller</td>
            <td>qw@gmail.com</td>
            <td>0778876543</td>
            <td>Colombo</td>
            <td>2021-11-02</td>
            <td><DeleteIcon fontSize='small'/></td>
          </tr>
          <tr>
            <td>2</td>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>Seller</td>
            <td>qw@gmail.com</td>
            <td>0778876543</td>
            <td>Colombo</td>
            <td>2021-11-02</td>
            <td><DeleteIcon fontSize='small'/></td>
          </tr>
          <tr>
            <td>3</td>
            <td>Larry the Bird</td>
            <td></td>
            <td>Seller</td>
            <td>qw@gmail.com</td>
            <td>0778876543</td>
            <td>Colombo</td>
            <td>2021-11-02</td>
            <td><DeleteIcon fontSize='small'/></td>
          </tr>
        </tbody>
      </Table>
      </div>
    </div>
  );
}
 
export default User;
