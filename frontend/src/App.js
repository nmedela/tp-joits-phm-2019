import React, { Component } from "react";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

import Login from "./pages/Login/Login";
import Confirm from "./pages/BuyingFlow/Confirm/Confirm";
import Tickets from "./pages/BuyingFlow/Tickets/Tickets";
import Friends from "./pages/Profile/Friends/Friends";
import Profile from "./pages/Profile/Profile";
import PrivateRoute from "./hocs/PrivateRoute";
import LoginService from "./services/LoginService";
import Navbar from "./components/Navbar";

class App extends Component {
  state = {
    userId: LoginService.getSession()
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
    const { userId } = this.state;
    return (
      <Router>
        <React.Fragment>
          <Navbar logOut={this.logOut} isLogged={!!userId} />
          <div className="container-joits">
            <Route
              path="/"
              exact
              userId={userId}
              render={props => <Login {...props} login={this.login} />}
            />
            <PrivateRoute path="/profile" userId={userId} component={Profile} />
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
        </React.Fragment>
      </Router>
    );
  }
}

export default App;
