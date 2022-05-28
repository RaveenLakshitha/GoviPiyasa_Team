import axios from "axios";
import { useEffect, useState } from "react";
import "../../App.css";
import * as React from "react";
import { Button } from "bootstrap";
import { DataGrid } from "@mui/x-data-grid";


const User = () => {
  const [search, setSearch] = useState("");
  const [product, setProduct] = useState([]);
  const [data, setData]= useState([]);
  //const [show, setShow] = useState(false);
  const [tableData, setTableData] = useState([]);

  // const handleDelete = (id) => {
  //   setTableData(tableData.filter((user) => user.id !== id));
  //   console.log(id);
  // };

  const getProductData = async () => {
    try {
      const data = await axios.get("https://govi-piyasa-v-0-1.herokuapp.com/api/v1/auths/getUsers");
      setTableData(data.data.data);
    } catch (e) {
      console.log(e);
    }
  };

  useEffect(()=>{
    getProductData();
  },[])

  
  const columns = [
    { field: '_id', headerName: 'ID', width: 200 },
    { field: 'profilePicture', headerName: 'Image' },
    { field: 'userName', headerName: 'Name', width: 100 },
    { field: 'email', headerName: 'Email', width: 200},
    { field: 'city', headerName: 'City', width: 100 },
    { field: 'contactNumber', headerName: 'Contact No', width: 100 },
    // { field: "action", headerName: "Action", width: 250,
    //   renderCell: (id) => (
    //     <>
    //       <Button
    //         style={{backgroundColor: "#e8605d", padding: "3px 35px"}}
    //         onClick={() => handleDelete(id)}
    //         variant="contained" color="primary" type="submit"
    //       >
    //         Delete
    //       </Button>
    //     </>
    //   )
    // }
    
  ]

  // {
  //   product.filter((item) => {
  //     if (search === "") {
  //       return item;
  //     } else if (item.name.toLowerCase().includes(search.toLowerCase())) {
  //       return item;
  //     } else {
  //       return false;
  //     }
  //   });
  // }

  return (
    <div className="App1">
      <h3>User list</h3>
      <input type="text" placeholder="Search here"
        onChange={(e) => {
          setSearch(e.target.value);
        }}
      />

      <br></br>

      <div style={{ height: 400, width: "100%", padding: "1em" }}>
        <DataGrid
          rows={tableData}
          columns={columns}
          getRowId={(row) => row._id}
          pageSize={10}
          rowsPerPageOptions={[10]}
          checkboxSelection
          disableSelectionOnClick
        >  
        </DataGrid>
      </div>
    </div>
  );
};

export default User;
