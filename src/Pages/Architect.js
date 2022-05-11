import Table from 'react-bootstrap/Table';
import DeleteIcon from '@mui/icons-material/Delete';
import { Link } from 'react-router-dom';

const Architect = () => {
  return (
    <div className="m-1">
      <div className="row">
        <div className="col-6">
        
          <input type="text" placeholder="Search..."/>
        </div>
        
      </div>

      <div className="w-100">
      <Table striped hover responsive className="table"> 
        <thead>
          <tr>
            <th>Architect ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Designation</th>
            <th>Email</th>
            <th>Contact no</th>
            <th>About</th>
            <th>Team</th>
            <th>Projects</th>
            <th>Created date</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>architect</td>
            <td>qw@gmail.com</td>
            <td>0778876543</td>
            <td></td>
            <td></td>
            <td><Link to='/projectDetails'>See projects</Link></td>
            <td>2021-11-02</td>
            <td><DeleteIcon fontSize='small'/></td>
          </tr>
          <tr>
            <td>1</td>
            <td>Mark</td>
            <td>Otto</td>
            <td>architect</td>
            <td>qw@gmail.com</td>
            <td>0778876543</td>
            <td></td>
            <td></td>
            <td><Link to='/projectDetails'>See projects</Link></td>
            <td>2021-11-02</td>
            <td><DeleteIcon fontSize='small'/></td>
          </tr>

        </tbody>
      </Table>
      </div>
    </div>
  );
}
 
export default Architect;