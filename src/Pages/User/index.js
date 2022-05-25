import axios from "axios";
import { useEffect, useState } from "react";
import Button from "react-bootstrap/Button";
import "../../App.css";
import ExpertForm from "../../Components/ExpertForm";
import * as React from "react";
import { DataGrid } from "@mui/x-data-grid";

const User = () => {
  const [search, setSearch] = useState("");
  const [product, setProduct] = useState([]);
  //const [show, setShow] = useState(false);
  const [tableData, setTableData] = useState([]);

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
    </div>
  );
};

export default User;
