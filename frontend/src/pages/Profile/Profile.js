import React, { Component } from "react";
import Card from "@material-ui/core/Card";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import "./Profile.scss";
import ProfileService from "../../services/ProfileService";

class Profile extends Component {
  state = {
    user: null,
    moneyToCharge: null
  };
  async componentDidMount() {
    const user = await ProfileService.getUserData();
    this.setState({
      user
    });
  }
  chargeMoney = async () => {
    try {
      await ProfileService.chargeMoney(this.state.moneyToCharge);
      this.setState({
        moneyToCharge: ""
      });
    } catch (e) {
      console.log(e);
    }
  };
  acepptModifies = async () => {
    try {
      await ProfileService.modifyUser(this.state.user);
    } catch (e) {
      console.log("error", e);
    }
  };
  goToFriendsPage = () => {
    this.props.history.push("/profile/friends");
  };
  render() {
    const { user, moneyToCharge } = this.state;
    return (
      <div>
        <Card>
          <CardContent style={{ display: "flex", justifyContent: "center" }}>
            {!!user ? (
              <div className="profile">
                <div className="profile__side">
                  <div> Usuario {user.name}</div>
                  <div>
                    <TextField
                      label="Edad"
                      value={user.age}
                      type="number"
                      onChange={e =>
                        this.setState({
                          user: {
                            ...this.state.user,
                            age: e.target.value
                          }
                        })
                      }
                    />
                  </div>
                  <div>
                    <div>Amigos</div>
                    <div>Tabla de amigos</div>
                  </div>
                </div>
                <div lassName="profile__side">
                  <div>Saldo : ${user.money}</div>
                  <div>
                    <TextField
                      label="Cargar Saldo"
                      type="number"
                      value={moneyToCharge}
                      onChange={e =>
                        this.setState({ moneyToCharge: e.target.value })
                      }
                    />
                    <Button onClick={this.chargeMoney}>Cargar</Button>
                  </div>
                  <div>
                    <div>Pelis vistas</div>
                    <div>Lista de peliculas </div>
                  </div>
                </div>
              </div>
            ) : (
              <div className="lds-ring">
                <div />
                <div />
                <div />
                <div />
              </div>
            )}
          </CardContent>
          {!!user && (
            <CardActions>
              <Button onClick={this.goToFriendsPage}>Buscar amigos</Button>
              <Button onClick={this.acepptModifies}>Aceptar</Button>
              <Button>Cancelar</Button>
            </CardActions>
          )}
        </Card>
      </div>
    );
  }
}

export default Profile;
