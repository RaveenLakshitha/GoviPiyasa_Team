import React, { useEffect } from "react";
import { useNavigate } from "react-router-dom";

export default function ProtectedRoute(props) {
  const { Component } = props;
  const navigate = useNavigate();
  useEffect(() => {
    let login = localStorage.getItem("token");
    if (!login) {
      navigate("/login");
    }
  }, []);

  return (
    <div>
      <Component />
    </div>
  );
}
