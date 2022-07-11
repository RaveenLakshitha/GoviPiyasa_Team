//import { DataGrid } from "@mui/x-data-grid";
import Paper from "@mui/material/Paper";
import Stack from "@mui/material/Stack";
import { styled } from "@mui/material/styles";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { Button, Modal } from "react-bootstrap";

const Preview = (props) => {
  const [tableData, setTableData] = useState([]);
  const id = props.id;

  useEffect(() => {
    const getData = async () => {
      try {
        console.log(id);
        const data = await axios.get(
          "https://govi-piyasa-v-0-1.herokuapp.com/api/v1/forum/getQuestions"
        );
        setTableData(data.data.data);
      } catch (e) {
        console.log(e);
      }
    };
    getData();
  }, [id]);

  // const columns = [
  //   { field: 'productName', headerName: 'Item', width:150 },
  //   { field: 'price', headerName: 'Price', width: 60 },
  //   { field: 'quantity', headerName: 'Qty', width: 50 },
  //   { field: 'description', headerName: 'Description', width: 200},
  // ]

  const Item = styled(Paper)(({ theme }) => ({
    backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
    ...theme.typography.body2,
    padding: theme.spacing(1),
    textAlign: "center",
    color: theme.palette.text.secondary,
  }));

  return (
    <div>
      <Modal show={props.show} onHide={props.handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Comments</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <h3>{tableData.Title}</h3>

          <p className="space"> Question : {tableData.QuestionBody}</p>

          <p className="space"> Answers </p>

          <Stack spacing={2}>
            {tableData.map((ans) => {
              return <Item>{ans}</Item>;
            })}
          </Stack>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={props.handleClose}>
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    </div>
  );
};

export default Preview;
