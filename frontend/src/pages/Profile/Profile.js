import React, { Component } from "react";
import Card from "@material-ui/core/Card";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import "./Profile.scss";
import Fab from '@material-ui/core/Fab';
import AddIcon from '@material-ui/icons/Add';
import ProfileService from "../../services/ProfileService";
import Paper from '@material-ui/core/Paper';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import FriendsTable from "../../components/FriendsTable";

class Profile extends Component {
  state = {
    user: null,
    moneyToCharge: null,
    seenMovies: null
  };
  async componentDidMount() {
    const user = await ProfileService.getUserData(this.props.userId);
    const seenMovies = await ProfileService.getSeenMovies(this.props.userId)
    this.setState({
      user,
      seenMovies
    });
  }
  chargeMoney = async () => {
    try {
      const newBalance = await ProfileService.chargeMoney(this.props.userId, this.state.moneyToCharge);
      const user = { ...this.state.user }
      user.balance = newBalance
      this.setState({
        moneyToCharge: "",
        user
      });
    } catch (e) {
      console.log(e);
    }
  };
  acepptModifies = async () => {
    try {
      await ProfileService.modifyUser(this.props.userId,this.state.user.age)
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
          <CardContent style={{ display: "flex", justifyContent: "space-around" }}>
            {!!user ? (
              <div className="profile">
                <div className="profile__side">
                  <div style={{ margin: "2em" }}> Usuario {user.name}</div>
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
                  <div style={{ margin: "1em" }}>
                    <div style={{ margin: "2em", boxSizing: 'border-box' }}>Amigos</div>
                    <div>
                      <Paper >
                        <FriendsTable friends={this.state.user.friends}></FriendsTable>
                      </Paper>
                    </div>
                  </div>
                </div>
                <div className="profile__side">
                  <div style={{ margin: "2em" }}>Saldo : ${user.balance}</div>
                  <div >
                    <TextField
                      label="Cargar Saldo"
                      type="number"
                      value={moneyToCharge}
                      onChange={e =>
                        this.setState({ moneyToCharge: e.target.value })
                      }
                    />
                    <Fab variant="extended" onClick={this.chargeMoney} style={{ marginLeft: "4em" }}>
                      <AddIcon />
                      Cargar</Fab>
                  </div>
                  <div style={{ margin: "1em" }}>
                    <div style={{ margin: "2em" }}>Pelis vistas</div>
                    <div>
                      <Paper >
                      <List style={{ overflow: "auto", height: "10em" }}>
                        {this.state.seenMovies && this.state.seenMovies.map(movie =>
                          <ListItem>
                            <ListItemText
                              primary={movie.title}
                            ></ListItemText>
                          </ListItem>,

                        )}
                      </List>
                    </Paper> </div>
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
            <CardActions style={{ display: "flex", justifyContent: "space-around" }}>
              <Button variant="contained" onClick={this.goToFriendsPage}>Buscar amigos</Button>
              <div >
                <Button variant="contained" color="primary" onClick={this.acepptModifies}>Aceptar</Button>
                <Button color="secondary"  >Cancelar</Button>
              </div>
            </CardActions>
          )}
        </Card>
      </div>
    );
  }
}

export default Profile;
