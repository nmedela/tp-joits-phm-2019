import React, { Component } from "react";
import TextField from "@material-ui/core/TextField";
import Button from "@material-ui/core/Button";
import "./Login.scss";
import LoginService from "../../services/LoginService";

const initialState = {
  userInput: null,
  passwordInput: null,
  errorLogin: null
};

class Login extends Component {
  state = {
    ...initialState
  };
  loginUser = async () => {
    try {
      const loggedUser = await LoginService.login({
        username: this.state.userInput,
        password: this.state.passwordInput
      });

      LoginService.saveSession(loggedUser.id);
      this.props.login();
      this.props.history.push("/buying-flow/tickets");
    } catch (e) {
      this.setState({
        errorLogin: "Usuario/password incorrectos"
      });
    }
  };

  cleanInputs = () => {
    this.setState({
      ...initialState
    });
  };

  render() {
    const { passwordInput, userInput, errorLogin } = this.state;
    return (
      <div>
        <div className="login__container">
          <div className="login__container__textfields">
            <TextField
              label="Usuario"
              type="text"
              className="login__container__user-input"
              value={userInput}
              onChange={event =>
                this.setState({ userInput: event.target.value })
              }
            />
            <TextField
              label="Contraseña"
              type="password"
              className="login__container__password-input"
              value={passwordInput}
              onChange={event =>
                this.setState({ passwordInput: event.target.value })
              }
            />
            {!!errorLogin && <div>{errorLogin}</div>}
          </div>

          <div className="login__container__buttons">
            <Button
              color="primary"
              className="login__container__accept-button"
              variant="contained"
              disabled={!passwordInput || !userInput}
              onClick={this.loginUser}
            >
              Aceptar
            </Button>
            <Button
              color="secondary"
              className="login__container__cancel-button"
              variant="contained"
              onClick={this.cleanInputs}
            >
              Cancelar
            </Button>
          </div>
        </div>
      </div>
    );
  }
}

export default Login;
