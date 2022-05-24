import Paper from "@material-ui/core/Paper";
import { makeStyles, withStyles } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import axios from "axios";
import { useEffect, useState } from "react";
import Button from "react-bootstrap/Button";
import "../../App.css";
import ExpertForm from "../../Components/ExpertForm";
const StyledTableCell = withStyles((theme) => ({
  head: {
    backgroundColor: theme.palette.common.black,
    color: theme.palette.common.white,
  },
  body: {
    fontSize: 14,
  },
}))(TableCell);

const StyledTableRow = withStyles((theme) => ({
  root: {
    "&:nth-of-type(odd)": {
      backgroundColor: theme.palette.action.hover,
    },
  },
}))(TableRow);

const useStyles = makeStyles({
  table: {
    minWidth: 700,
  },
});

const Architect = () => {
  const classes = useStyles();
  const [product, setProduct] = useState([]);
  const [search, setSearch] = useState("");
  const [show, setShow] = useState(false);
  const [editId, setEditId] = useState("");
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  const editData = (data) => {
    setEditId(data);
    handleShow();
  };

  const getProductData = async () => {
    try {
      const data = await axios.get("https://mongoapi3.herokuapp.com/architect");
      console.log(data.data.length);
      setProduct(data.data);
    } catch (e) {
      console.log(e);
    }
  };

  useEffect(() => {
    getProductData();
  }, []);
  const removeData = async (id) => {
    if (
      window.confirm("Are you sure that you wanted to delete that user record")
    ) {
      const response = await axios.delete(
        `https://mongoapi3.herokuapp.com/expert/${id}`
      );
      if (response.status === 200) {
        console.log("id" + id);
      }
      // axios.delete(`${URL}/${id}`).then((res) => {
      //   const del = deliveries.filter((employee) => id !== employee.id);
      //   setDelivery(del);
      // });
    }
  };

  return (
    <div className="App1">
      <h1>Architectures</h1>
      <input
        type="text"
        placeholder="Search here"
        onChange={(e) => {
          setSearch(e.target.value);
        }}
      />

      <div className="col-8">
        <Button
          variant="success"
          className="float-sm-end m-3"
          size="sm"
          onClick={handleShow}
        >
          Add Architect
        </Button>
        <ExpertForm show={show} id={editId} handleClose={handleClose} />
      </div>
      {/* {product
        .filter((item) => {
          if (search == "") {
            return item;
          } else if (item.name.toLowerCase().includes(search.toLowerCase())) {
            return item;
          }
        })
        .map((item) => {
          return (
            <p>
              {item.name} - {item.price}
            </p>
          );
        })} */}

      <TableContainer component={Paper} style={{ width: "80%" }}>
        <Table className={classes.table} aria-label="customized table">
          <TableHead>
            <TableRow>
              <StyledTableCell>Name</StyledTableCell>
              <StyledTableCell>About</StyledTableCell>

              <StyledTableCell>Contact</StyledTableCell>
              <StyledTableCell>team</StyledTableCell>
              <StyledTableCell>Operation</StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {product
              .filter((item) => {
                if (search === "") {
                  return item;
                } else if (
                  item.name.toLowerCase().includes(search.toLowerCase())
                ) {
                  return item;
                } else {
                  return false;
                }
              })
              .map((item) => {
                return (
                  <StyledTableRow key={item.id}>
                    <StyledTableCell component="th" scope="row">
                      {item.name}
                    </StyledTableCell>
                    <StyledTableCell>{item.about}</StyledTableCell>
                    <StyledTableCell>{item.contact}</StyledTableCell>
                    <StyledTableCell>{item.team}</StyledTableCell>
                    <StyledTableCell>
                      <EditIcon
                        fontSize="small"
                        style={{ marginRight: "10px" }}
                        onClick={() => editData(item._id)}
                      />
                      <DeleteIcon
                        fontSize="small"
                        onClick={() => removeData(item._id)}
                      />
                    </StyledTableCell>
                  </StyledTableRow>
                );
              })}
          </TableBody>
        </Table>
      </TableContainer>
    </div>
  );
};

export default Architect;
