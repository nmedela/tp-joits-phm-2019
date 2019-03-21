import React, { Component } from "react";
import Card from "@material-ui/core/Card";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import "./Profile.scss";

const Profile = () => (
  <div>
    <Card>
      <CardContent>
        <div className="profile">
          <div className="profile__side">
            <div> Usuario John Code</div>
            <div>
              <TextField label="Edad" />
            </div>
            <div>
              <div>Amigos</div>
              <div>Tabla de amigos</div>
            </div>
          </div>
          <div lassName="profile__side">
            <div>Saldo : $1500</div>
            <div>
              <TextField label="Cargar Saldo" /> <Button>Cargar</Button>
            </div>
            <div>
              <div>Pelis vistas</div>
              <div>Lista de peliculas </div>
            </div>
          </div>
        </div>
      </CardContent>
      <CardActions>
        <Button>Buscar amigos</Button>
        <Button>Aceptar</Button>
        <Button>Cancelar</Button>
      </CardActions>
    </Card>
  </div>
);
export default Profile;
