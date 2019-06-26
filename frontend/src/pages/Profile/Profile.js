import React, { Component } from "react";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import TextField from "@material-ui/core/TextField";
import "./Profile.scss";
import Fab from "@material-ui/core/Fab";
import AddIcon from "@material-ui/icons/Add";
import ProfileService from "../../services/ProfileService";
import Paper from "@material-ui/core/Paper";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemText from "@material-ui/core/ListItemText";
import FriendsTable from "../../components/FriendsTable";

import withStyles from "@material-ui/core/styles/withStyles";
import InputLabel from "@material-ui/core/InputLabel";
// core components
import GridItem from "components/Grid/GridItem.jsx";
import GridContainer from "components/Grid/GridContainer.jsx";
import CustomInput from "components/CustomInput/CustomInput.jsx";
import Button from "components/CustomButtons/Button.jsx";
import Card from "components/Card/Card.jsx";
import CardHeader from "components/Card/CardHeader.jsx";
import CardAvatar from "components/Card/CardAvatar.jsx";
import CardBody from "components/Card/CardBody.jsx";
import CardFooter from "components/Card/CardFooter.jsx";

import avatar from "assets/img/faces/marc.jpg";
import Snackbar from "components/Snackbar/Snackbar.jsx";

const styles = {
  cardCategoryWhite: {
    color: "rgba(255,255,255,.62)",
    margin: "0",
    fontSize: "14px",
    marginTop: "0",
    marginBottom: "0"
  },
  cardTitleWhite: {
    color: "#FFFFFF",
    marginTop: "0px",
    minHeight: "auto",
    fontWeight: "300",
    fontFamily: "'Roboto', 'Helvetica', 'Arial', sans-serif",
    marginBottom: "3px",
    textDecoration: "none"
  }
};

class Profile extends Component {
  state = {
    user: null,
    moneyToCharge: "",
    seenMovies: "",
    snackbar:{
      open:false
    }
  };
  async componentDidMount() {
    const user = await ProfileService.getUserData(this.props.userId);
    // const seenMovies = await ProfileService.getSeenMovies(this.props.userId);
    this.setState({
      user,
      // seenMovies
    });
  }
  chargeMoney = async () => {
    try {
      // const newBalance = await ProfileService.chargeMoney(this.props.userId, this.state.moneyToCharge);
      const user = { ...this.state.user };
      user.balance =
        parseFloat(user.balance) + parseFloat(this.state.moneyToCharge);
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
      await ProfileService.modifyUser(this.props.userId, this.state.user);
      this.setState({
        snackbar:{
          ...this.state.snackbar,
        }
      })
    } catch (e) {
      console.log("error", e);
    }
  };
  cancelChange = async () => {
    try {
      this.componentDidMount();
    } catch (e) {
      console.log("error", e);
    }
  };
  goToFriendsPage = () => {
    this.props.history.push("/profile/friends");
  };
  render() {
    const { user, moneyToCharge } = this.state;
    console.log("im here");
    const { classes } = this.props;
    return (
      <React.Fragment>
        {!!user && (
          <GridContainer style={{padding:"2em"}}>
            <GridItem xs={12} sm={12} md={4}>
              <Card profile>
                <CardAvatar profile>
                  <a href="#pablo" onClick={e => e.preventDefault()}>
                    <img src={avatar} alt="..." />
                  </a>
                </CardAvatar>
                <CardBody profile>
                  <h4 className={classes.cardTitle}>
                    {user.name} {user.lastName}
                  </h4>
                  <p className={classes.description}>
                    Saldo : ${user.balance}
                  </p>
                </CardBody>
              </Card>
            </GridItem>
            <GridItem xs={12} sm={12} md={8}>
              <Card>
                <CardHeader color="primary">
                  <h4 className={classes.cardTitleWhite}>Editar perfil</h4>
                  <p className={classes.cardCategoryWhite}>
                    Complete your profile
                  </p>
                </CardHeader>
                <CardBody>
                  <GridContainer>
                    <GridItem xs={12} sm={12} md={6}>
                      <CustomInput
                        labelText="Edad"
                        id="company-disabled"
                        formControlProps={{
                          fullWidth: true
                        }}
                        inputProps={{
                          value: user.age,
                          type: "number",
                          onChange: e =>
                            this.setState({
                              user: {
                                ...this.state.user,
                                age: e.target.value
                              }
                            })
                        }}
                      />
                    </GridItem>
                    <GridItem xs={12} sm={12} md={6}>
                      <CustomInput
                        labelText="Cargar Saldo"
                        id="username"
                        formControlProps={{
                          fullWidth: false
                        }}
                        inputProps={{
                          type: "number",
                          value: moneyToCharge,
                          onChange: e =>
                            this.setState({ moneyToCharge: e.target.value })
                        }}
                      />
                      <Fab
                        variant="extended"
                        onClick={this.chargeMoney}
                        style={{ marginLeft: "2em" }}
                      >
                        <AddIcon />
                        Cargar
                      </Fab>
                    </GridItem>
                  </GridContainer>
                </CardBody>
                <CardFooter>
                  <Button color="primary" onClick={this.acepptModifies}>Aceptar</Button>
                  <Button color="secondary" onClick={this.cancelChange}>Cancelar</Button>
                </CardFooter>
              </Card>
            </GridItem>

            <GridItem xs={12} sm={12} md={6}>
              <Card profile>
                <CardHeader color="primary">
                  <h4 className={classes.cardTitleWhite}>Peliculas vistas</h4>
                  <p className={classes.cardCategoryWhite}>
                    Tus peliculas vistas
                  </p>
                </CardHeader>
                <CardBody profile>
                  <List style={{ overflow: "auto", height: "10em" }}>
                    {this.state.user &&
                      this.state.user.tickets &&
                      this.state.user.tickets.map(ticket => (
                        <ListItem>
                          <ListItemText primary={ticket} />
                        </ListItem>
                      ))}
                  </List>
                </CardBody>
              </Card>
            </GridItem>

            <GridItem xs={12} sm={12} md={6}>
              <Card profile>
                <CardHeader color="primary">
                  <h4 className={classes.cardTitleWhite}>Amigos</h4>
                  <p className={classes.cardCategoryWhite}>
                    Tus amigos
                  </p>
                </CardHeader>
                <CardBody profile>
                <FriendsTable friends={user.friends}></FriendsTable>
                <Button style={{marginTop:"3em"}} color="primary" onClick={this.goToFriendsPage} >Buscar amigos</Button>

                </CardBody>
              </Card>
            </GridItem>

          </GridContainer>
        )}
         <Snackbar
          place="bc"
          color="success"
          message="El usuario fue modificado con exito"
          open={this.state.snackbar.open}
          closeNotification={() => this.setState({ snackbar: {open:false} })}
          close
        />
      </React.Fragment>
    );
  }
}

export default withStyles(styles)(Profile);

/*


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
                          {this.state.user &&  this.state.user.tickets && this.state.user.tickets.map(ticket =>
                            <ListItem>
                              <ListItemText
                                primary={ticket.movie.title}
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
                <Button color="secondary" onClick={this.cancelChange}  >Cancelar</Button>
              </div>
            </CardActions>
          )}
        </Card>
      </div>
 */
