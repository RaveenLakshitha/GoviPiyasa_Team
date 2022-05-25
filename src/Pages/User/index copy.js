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
import * as React from "react";
import { DataGrid, GridColDef, GridValueGetterParams } from "@mui/x-data-grid";

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

const User = () => {
  const classes = useStyles();
  const [product, setProduct] = useState([]);
  const [search, setSearch] = useState("");
  const [show, setShow] = useState(false);

  const [tableData, setTableData] = useState([]);

  // const handleClose = () => setShow(false);
  // const handleShow = () => setShow(true);

  // const getProductData = async () => {
  //   try {
  //     const data = await axios.get("https://mongoapi3.herokuapp.com/users");
  //     console.log(data.data);
  //     setProduct(data.data);
  //   } catch (e) {
  //     console.log(e);
  //   }
  // };

  // useEffect(() => {
  //   getProductData();
  // }, []);

  // useEffect(() => {
  //   axios
  //     .get("https://mongoapi3.herokuapp.com/users")
  //     .then((res) => {
  //       setTableData(res.data);
  //       console.log("Result:", data);
  //     })
  //     .catch((error) => {
  //       console.log(error);
  //     });
  // }, []);

  useEffect(() => {
    fetch("https://mongoapi3.herokuapp.com/api/v1/users")
      .then((data) => data.json())
      .then((data) => setTableData(data));
  }, []);

  // const removeData = async (id) => {
  //   if (
  //     window.confirm("Are you sure that you wanted to delete that user record?")
  //   ) {
  //     const response = await axios.delete(
  //       `https://mongoapi3.herokuapp.com/expert/${id}`
  //     );
  //     if (response.status === 200) {
  //       console.log("id" + id);
  //     }
  //     // axios.delete(`${URL}/${id}`).then((res) => {
  //     //   const del = deliveries.filter((employee) => id !== employee.id);
  //     //   setDelivery(del);
  //     // });
  //   }
  // };

  const columns = [
    { field: "id", headerName: "ID", width: 90 },
    {
      field: "firstName",
      headerName: "First name",
      width: 150,
      editable: true,
    },
    {
      field: "age",
      headerName: "Age",
      type: "number",
      width: 110,
      editable: true,
    },
    {
      field: "fullName",
      headerName: "Full name",
      description: "This column has a value getter and is not sortable.",
      sortable: false,
      width: 160,
      valueGetter: (params) =>
        `${params.row.firstName || ""} ${params.row.lastName || ""}`,
    },
  ];

  {
    product.filter((item) => {
      if (search === "") {
        return item;
      } else if (item.name.toLowerCase().includes(search.toLowerCase())) {
        return item;
      } else {
        return false;
      }
    });
  }

  //   {product
  //     .filter((item) => {
  //       if (search === "") {
  //         return item;
  //       } else if (
  //         item.name.toLowerCase().includes(search.toLowerCase())
  //       ) {
  //         return item;
  //       } else {
  //         return false;
  //       }
  //     })
  //     .map((item) => {
  //       return (
  //         <StyledTableRow key={item.id}>
  //           <StyledTableCell component="th" scope="row">
  //             {item.name}
  //           </StyledTableCell>
  //           <StyledTableCell>{item.designation}</StyledTableCell>
  //           <StyledTableCell>{item.contact}</StyledTableCell>
  //           <StyledTableCell>{item.location}</StyledTableCell>
  //           <StyledTableCell>
  //             <EditIcon
  //               fontSize="small"
  //               style={{ marginRight: "10px" }}
  //             />
  //             <DeleteIcon
  //               fontSize="small"
  //               onClick={() => removeData(item._id)}
  //             />
  //           </StyledTableCell>
  //         </StyledTableRow>
  //       );
  //     })}
  // ];

  return (
    <div className="App1">
      <h3>User list</h3>
      <input
        type="text"
        placeholder="Search here"
        onChange={(e) => {
          setSearch(e.target.value);
        }}
      />

      <br></br>

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

      <div style={{ height: 400, width: "100%", padding: "1em" }}>
        <DataGrid
          rows={tableData}
          columns={columns}
          pageSize={5}
          rowsPerPageOptions={[5]}
          checkboxSelection
          disableSelectionOnClick
        />
      </div>

      {/* 
      <TableContainer component={Paper} style={{ width: "80%" }}>
        <Table className={classes.table} aria-label="customized table">
          <TableHead>
            <TableRow>
              <StyledTableCell>Name</StyledTableCell>
              <StyledTableCell>Designation</StyledTableCell>

              <StyledTableCell>Contact</StyledTableCell>
              <StyledTableCell>Location</StyledTableCell>
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
                    <StyledTableCell>{item.designation}</StyledTableCell>
                    <StyledTableCell>{item.contact}</StyledTableCell>
                    <StyledTableCell>{item.location}</StyledTableCell>
                    <StyledTableCell>
                      <EditIcon
                        fontSize="small"
                        style={{ marginRight: "10px" }}
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
      </TableContainer> */}
    </div>
  );
};

export default User;
