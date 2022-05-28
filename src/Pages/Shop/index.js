import axios from "axios";
import { useEffect, useState } from "react";
import "../../App.css";
import * as React from "react";
import { Button } from "bootstrap";
import { DataGrid, GridActionsCellItem } from "@mui/x-data-grid";
import DeleteIcon from "@mui/icons-material/Delete";
import RemoveRedEyeIcon from '@mui/icons-material/RemoveRedEye';
import Preview from "./preview";


const User = () => {
  const [search, setSearch] = useState("");
  const [product, setProduct] = useState([]);
  const [hoveredRow, setHoveredRow] = useState(null);
  const [data, setData]= useState([]);
  const [tableData, setTableData] = useState([]);
  const [rows, setRows] = useState(tableData);
  const [show, setShow] = useState(null);

  const handleClose = () => setShow(false);
  const handleView = () => setShow(true);


  // const handleDelete = (id) => {
  //   setTableData(tableData.filter((user) => user.id !== id));
  //   console.log(id);
  // };

  // const onMouseEnterRow = (event) => {
  //   const id = Number(event.currentTarget.getAttribute("data-id"));
  //   setHoveredRow(id);
  // };

  // const onMouseLeaveRow = (event) => {
  //   setHoveredRow(null);
  // };

  const deleteUser = React.useCallback(
    (id) => () => {
      setTimeout(() => {
        setData((prevRows) => prevRows.filter((row) => row.id !== id));
      });
    },
    [],
  );


  const getProductData = async () => {
    try {
      const data = await axios.get("https://govi-piyasa-v-0-1.herokuapp.com/api/v1/shops");
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
    { field: 'shopName', headerName: 'Shop' },
    { field: 'userName', headerName: 'Name', width: 100 ,
      valueGetter: (params) => {
        return params.getValue(params.id, "user").userName;
      }
    },
    { field: 'email', headerName: 'Email', width: 200},
    { field: 'shopItems', headerName: 'No of items', width: 100 },
    { field: 'shopReviews', headerName: 'Reviews', width: 100 },
    {
      field: 'actions', type: 'actions', width: 80,
      getActions: (params) => [
        <GridActionsCellItem
          icon={<DeleteIcon />}
          label="Delete"
          onClick={deleteUser(params.id)}
        />,
        <GridActionsCellItem
          icon={<RemoveRedEyeIcon/>}
          label="View"
          onClick={handleView()}
        />,
        <Preview show={show} handleClose={handleClose} />
      ]
    },
    
    // {
    //   field: "actions",
    //   headerName: "Actions",
    //   width: 120,
    //   sortable: false,
    //   disableColumnMenu: true,
    //   renderCell: (params) => {
    //     if (hoveredRow === params.id) {
    //       return (
    //         <Box
    //           sx={{
    //             // backgroundColor: "whitesmoke",
    //             width: "100%",
    //             height: "100%",
    //             display: "flex",
    //             justifyContent: "center",
    //             alignItems: "center"
    //           }}
    //         >
    //           <IconButton onClick={() => console.log(params.id)}>
    //             <EditIcon />
    //           </IconButton>
    //           <IconButton onClick={() => console.log(params.id)}>
    //             <DeleteIcon />
    //           </IconButton>
    //         </Box>
    //       );
    //     } else return null;
    //   }
    // }
    // { field: "action", headerName: "Action", width: 250,
    //   renderCell: (params) => (
    //     <>
    //       <Button
    //         style={{backgroundColor: "#e8605d", padding: "3px 35px"}}
    //         //onClick={() => handleDelete(id)}
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
      <h3>Shop list</h3>
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
          //initialState={{ pinnedColumns: { right: ["actions"] } }}
          // componentsProps={{
          //   row: {
          //     onMouseEnter: onMouseEnterRow,
          //     onMouseLeave: onMouseLeaveRow
          //   }
          // }}
        >  
        </DataGrid>
      </div>
    </div>
  );
};

export default User;
