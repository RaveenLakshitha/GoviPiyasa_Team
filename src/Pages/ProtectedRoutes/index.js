import React from "react";
import { Navigate, Outlet } from "react-router";
const useAuth = () => {
  const user = { loggedIn: false };
  return user && user.loggedIn;
};
export default function ProtectedRoutes() {
  const isAuth = useAuth();
  return isAuth ? <Outlet /> : <Navigate to="/" />;
}
