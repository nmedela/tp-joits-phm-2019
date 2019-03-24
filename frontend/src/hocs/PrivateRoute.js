import React from "react";
import { Route, Redirect } from "react-router-dom";

const PrivateRoute = ({ component: Component, ...rest }) => {
  console.log("rest", rest);
  return (
    <Route
      {...rest}
      render={props =>
        !!rest.userId ? (
          <Component userId={rest.userId} {...props} />
        ) : (
          <Redirect to="/" />
        )
      }
    />
  );
};
export default PrivateRoute;
