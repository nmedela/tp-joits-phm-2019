import React, { Component } from "react";

import Login from "./pages/Login/Login";
import Confirm from "./pages/BuyingFlow/Confirm/Confirm";
import Tickets from "./pages/BuyingFlow/Tickets/Tickets";
import Friends from "./pages/Profile/Friends/Friends";
import Profile from "./pages/Profile/Profile";
import LoginService from "./services/LoginService";
import Navbar from "./components/Navbar";
import withStyles from "@material-ui/core/styles/withStyles";

import {
  BrowserRouter as Router,
  Route,
  Redirect
} from "react-router-dom";
import PrivateRoute from "./hocs/PrivateRoute";

// core components
import Sidebar from "components/Sidebar/Sidebar.jsx";
import image from "assets/img/sidebar-2.jpg";
import logo from "assets/img/popcorn.png";
import routes from "./routes.js";

import dashboardStyle from "assets/jss/material-dashboard-react/layouts/dashboardStyle.jsx";

class App extends Component {
  state = {
    userId: LoginService.getSession(),
    image: image,
    color: "blue",
    hasImage: true,
    fixedClasses: "dropdown show",
    mobileOpen: false
  };

  logOut = () => {
    LoginService.logout();
    this.setState({
      userId: null
    });
  };
  login = () => {
    this.setState({
      userId: LoginService.getSession()
    });
  };
 

  render() {
    const { classes, ...rest } = this.props;

    const { userId } = this.state;
    return (
      <Router>
        <React.Fragment>
          <div className={classes.wrapper}>
            <Sidebar
              routes={routes}
              logoText={"Joits"}
              logo={logo}
              image={this.state.image}
              handleDrawerToggle={this.handleDrawerToggle}
              isLogged={!!userId}
              open={this.state.mobileOpen}
              color={this.state.color}
              {...rest}
            />
            <div className={classes.mainPanel} ref="mainPanel">
              <Navbar
                isLogged={!!userId}
                logOut={this.logOut}
              />
              <Route
                path="/"
                exact
                userId={userId}
                render={props =>
                  !userId ? (
                    <Login {...props} login={this.login} />
                  ) : (
                    <Redirect to="/profile" />
                  )
                }
              />
              <PrivateRoute
                path="/profile"
                userId={userId}
                exact
                component={Profile}
              />
              <PrivateRoute
                path="/profile/friends"
                userId={userId}
                component={Friends}
              />
              <PrivateRoute
                path="/buying-flow/tickets"
                userId={userId}
                component={Tickets}
              />
              <PrivateRoute
                path="/buying-flow/confirm"
                userId={userId}
                component={Confirm}
              />
            </div>
          </div>
        </React.Fragment>
      </Router>
    );
  }
}

export default withStyles(dashboardStyle)(App);