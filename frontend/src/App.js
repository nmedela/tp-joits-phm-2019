import React, { Component } from "react";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";

import Login from "./pages/Login/Login";
import Confirm from "./pages/BuyingFlow/Confirm/Confirm";
import Tickets from "./pages/BuyingFlow/Tickets/Tickets";
import Friends from "./pages/Profile/Friends/Friends";
import Profile from "./pages/Profile/Profile";

class App extends Component {
  render() {
    return (
      <Router>
        <React.Fragment>
          <Route path="/" exact component={Login} />
          <Route path="/profile" exact component={Profile} />
          <Route path="/profile/friends" component={Friends} />
          <Route path="/buying-flow/tickets" component={Tickets} />
          <Route path="/buying-flow/confirm" component={Confirm} />
        </React.Fragment>
      </Router>
    );
  }
}

export default App;
