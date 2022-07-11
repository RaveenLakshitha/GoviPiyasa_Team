import { DataGrid } from "@mui/x-data-grid";
import axios from "axios";
import * as React from "react";
import { useEffect, useState } from "react";
import "../../App.css";

const User = () => {
  const [search, setSearch] = useState("");
  const [product, setProduct] = useState([]);
  const [data, setData] = useState([]);
  //const [show, setShow] = useState(false);
  const [tableData, setTableData] = useState([]);

  // useEffect(() => {
  //   fetch("https://mongoapi3.herokuapp.com/experts")
  //     .then((data) => data.json())
  //     .then((data) => setTableData(data));
  // }, []);

  const getProductData = async () => {
    try {
      const data = await axios.get(
        "http://localhost:5000/api/v1/auths/getUsers"
      );
      console.log(data.data.data);
      // console.log(data.status);
      // console.log(data.data.data[0].userName);
      setTableData(data.data.data);
    } catch (e) {
      console.log(e);
    }
  };

  useEffect(() => {
    getProductData();
  }, []);

  /*  const removeData = async (id) => {
    if (
      window.confirm("Are you sure that you wanted to delete that user record?")
    ) {
      const response = await axios.delete(
        `https://mongoapi3.herokuapp.com/expert/${id}`
      );
      if (response.status === 200) {
        console.log("id" + id);
      }
      axios.delete(`${URL}/${id}`).then((res) => {
        const del = deliveries.filter((employee) => id !== employee.id);
        setDelivery(del);
      });
    }
  }; */

  // const columns = [
  //   { field: "id", headerName: "ID", width: 50 },
  //   {
  //     field: "profilePicture",
  //     headerName: "Image",
  //     width: 60,
  //     editable: true,
  //   },
  //
  //   {
  //     field: "userName",
  //     headerName: "Name",
  //     width: 150,
  //     editable: true,
  //   },
  //   {
  //     field: "email",
  //     headerName: "Email",
  //     width: 180,
  //     editable: true,
  //   },
  //   {
  //     field: "city",
  //     headerName: "City",
  //     width: 150,
  //     editable: true,
  //   },
  //   {
  //     field: "contactNumber",
  //     headerName: "Contact Number",
  //     width: 160,
  //     editable: true,
  //   },

  // ];

  const columns = [
    { field: "_id", headerName: "ID" },
    { field: "userName", headerName: "User Name", width: 300 },
    { field: "body", headerName: "Body", width: 600 },
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
          rowsPerPageOptions={[10]}
          checkboxSelection
          disableSelectionOnClick
          getRowId={(row) => row._id}
        />
      </div>
    </div>
  );
};

export default User;
