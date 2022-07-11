/* import axios from "axios";
import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
export default function Login(props) {
  const [email, setemail] = useState("");
  const [password, setpassword] = useState("");
  const [LoginPass, setLoginPass] = useState(false);

  const navigate = useNavigate();
  const userLogin = async (event) => {
    event.preventDefault();

    try {
      const data = await axios.post(
        "http://localhost:5000/api/v1/auths/login",
        { email, password }
      );
      console.log(data.data.token);
      window.localStorage.setItem("user_token", data.data.token);
      console.log(window.localStorage.getItem("user_token"));
      setLoginPass(true);

      navigate("/");
    } catch (e) {
      console.log(e);
    }
  };

  return (
    <div className="App1">
      <form onSubmit={userLogin}>
        <input
          value={email}
          type="text"
          placeholder="email"
          onChange={(e) => setemail(e.target.value)}
        />
        <input
          value={password}
          type="password"
          placeholder="password"
          onChange={(e) => setpassword(e.target.value)}
        />
        <input type="submit" value="Login"></input>
      </form>
    </div>
  );
}

/* 
function PageComponent() {
  const [count, setCount] = useState(0);
  const increment = () => {
    setCount(count + 1)
  }

  return (
    <div className="App">
      <ChildComponent onClick={increment} count={count} />         
      <h2>count {count}</h2>
      (count should be updated from child)
    </div>
  );
}

const ChildComponent = ({ onClick, count }) => {
  return (
    <button onClick={onClick}>
       Click me {count}
    </button>
  )
}; */

import LockOutlinedIcon from "@mui/icons-material/LockOutlined";
import Avatar from "@mui/material/Avatar";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Checkbox from "@mui/material/Checkbox";
import Container from "@mui/material/Container";
import CssBaseline from "@mui/material/CssBaseline";
import FormControlLabel from "@mui/material/FormControlLabel";
import Grid from "@mui/material/Grid";
import Link from "@mui/material/Link";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import TextField from "@mui/material/TextField";
import Typography from "@mui/material/Typography";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

function Copyright(props) {
  return (
    <Typography
      variant="body2"
      color="text.secondary"
      align="center"
      {...props}
    >
      {"Copyright © "}
      <Link color="inherit" href="https://mui.com/">
        Your Website
      </Link>{" "}
      {new Date().getFullYear()}
      {"."}
    </Typography>
  );
}

const theme = createTheme();

export default function Login() {
  const [token, setToken] = useState("");
  const [password, setPassword] = useState("");
  const [email, setEmail] = useState("");
  const navigate = useNavigate();
  useEffect(() => {
    if (token) {
      navigate("/");
    }
  }, [token, navigate]);
  function handleSubmit(event) {
    event.preventDefault();
    console.log("Ok");
    axios
      .post("https://govi-piyasa-v-0-1.herokuapp.com/api/v1/auths/login", {
        password: password,
        email: email,
      })
      .then((res) => {
        console.log(res);
        console.log(res.data.token);
        setToken(res.data.token);
        window.localStorage.setItem("token", res.data.token);
        alert("Successfully Login");
      });
  }

  return (
    <ThemeProvider theme={theme}>
      <Container component="main" maxWidth="xs">
        <CssBaseline />
        <Box
          sx={{
            marginTop: 8,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
          }}
        >
          <Avatar sx={{ m: 1, bgcolor: "secondary.main" }}>
            <LockOutlinedIcon />
          </Avatar>
          <Typography component="h1" variant="h5">
            Sign in
          </Typography>
          <Box
            component="form"
            onSubmit={handleSubmit}
            noValidate
            sx={{ mt: 1 }}
          >
            <TextField
              margin="normal"
              required
              fullWidth
              id="email"
              label="Email Address"
              name="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              autoComplete="email"
              autoFocus
            />
            <TextField
              margin="normal"
              required
              fullWidth
              name="password"
              label="Password"
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              autoComplete="current-password"
            />
            <FormControlLabel
              control={<Checkbox value="remember" color="primary" />}
              label="Remember me"
            />
            <Button
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 3, mb: 2 }}
            >
              Sign In
            </Button>
            <Grid container>
              <Grid item xs>
                <Link href="/home" variant="body2">
                  Forgot password?
                </Link>
              </Grid>
              <Grid item>
                <Link href="#" variant="body2">
                  {"Don't have an account? Sign Up"}
                </Link>
              </Grid>
            </Grid>
          </Box>
        </Box>
        <Copyright sx={{ mt: 8, mb: 4 }} />
      </Container>
    </ThemeProvider>
  );
}
