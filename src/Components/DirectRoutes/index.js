import React from "react";
import { Navigate, Route } from "react-router";

export default function Directroutes({ element: Element, ...rest }) {
  return (
    <Route
      {...rest}
      element={(props) => {
        const token = window.localStorage.getItem("user_token");
        if (token) {
          return <Element {...props} />;
        } else {
          return <Navigate to={`/Login`} />;
        }
      }}
    />
  );
}
