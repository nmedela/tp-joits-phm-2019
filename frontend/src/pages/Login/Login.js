import React, { Component } from "react";
import TextField from "@material-ui/core/TextField";
import Button from "@material-ui/core/Button";
import "./Login.scss";

const Login = () => (
  <div>
    <div className="login__container">
      <div className="login__container__textfields">
        <TextField
          label="Usuario"
          type="text"
          className="login__container__user-input"
        />
        <TextField
          label="Contraseña"
          type="password"
          className="login__container__password-input"
        />
      </div>

      <div className="login__container__buttons">
        <Button
          color="primary"
          className="login__container__accept-button"
          variant="contained"
        >
          Aceptar
        </Button>
        <Button
          color="secondary"
          className="login__container__cancel-button"
          variant="contained"
        >
          Cancelar
        </Button>
      </div>
    </div>
  </div>
);
export default Login;
