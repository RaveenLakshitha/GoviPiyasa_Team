import DeleteIcon from "@mui/icons-material/Delete";
import { useState } from "react";
import Button from "react-bootstrap/Button";
import Table from "react-bootstrap/Table";
import UserModal from "../Components/UserModal";
import ConfirmMessage from "../Components/ConfirmMessage";

const User = () => {
  const [showAdd, setShowAdd] = useState(false);
  const [showDelete, setShowDelete] = useState(false);

  const handleShowAdd = () => setShowAdd(true);
  const handleCloseAdd = () => setShowAdd(false);
  const handleShowDelete = () => setShowDelete(true);
  const handleCloseDelete = () => setShowDelete(false);

  return (
    <div className="m-1">
      <div className="row">
        <div className="col-6">
          <input type="text" placeholder="Search..." />
        </div>

        <div className="col-5">
          <Button
            variant="success"
            className="float-sm-end m-3"
            onClick={handleShowAdd}
          >
            Add user
          </Button>
          <UserModal show={showAdd} onHide={handleCloseAdd} />
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
              <td>
                <Button size="sm" variant="outline-success" onClick={handleShowDelete}>
                  <DeleteIcon fontSize="small" />
                </Button>
                <ConfirmMessage title="Do you want to delete?" show={showDelete} handleClose={handleCloseDelete}/>
              </td>
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
              <td>
                <DeleteIcon fontSize="small" />
              </td>
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
              <td>
                <DeleteIcon fontSize="small" />
              </td>
            </tr>
          </tbody>
        </Table>
      </div>
    </div>
  );
};

export default User;
