import React, { Component } from "react";
import {
  CardContent,
  CardActions,
  Paper,
  Table,
  TableRow,
  TableHead,
  TableCell,
  TableBody,
  Dialog,
  DialogTitle,
  DialogActions,
  Typography
} from "@material-ui/core";
import FriendsTable from "../../../components/FriendsTable";
import ProfileService from "../../../services/ProfileService";
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
import withStyles from "@material-ui/core/styles/withStyles";

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

class Friends extends Component {
  state = {
    friends: [],
    suggestedFriends: [{ name: "gonzalo", lastname: "gras" }],
    openModalAddfriend: false,
    friendToAdd: null,
    searchInput: "",
    snackbar: {
      open: false
    }
  };

  openModalAddFriend = friend => {
    this.setState(
      {
        friendToAdd: friend
      },
      () => this.handleClickOpen()
    );
  };
  addFriend = async () => {
    const { friendToAdd } = this.state;
    try {
      ProfileService.addFriend(this.props.userId, friendToAdd).then(() => {
        const friends = ProfileService.searchFriends(
          this.props.userId,
          this.state.searchInput
        ).then(friends =>
          this.setState({
            friends,
            snackbar: {
              open: true,
              message: `Agregaste a ${friendToAdd.name} ${
                friendToAdd.lastName
              }  con exito`
            }
          })
        );
      });
      this.handleClose();
    } catch (error) {
      console.log("un error en la agregacion del amigo", error);
    }
  };

  handleClickOpen = () => {
    this.setState({ openModalAddfriend: true });
  };

  handleClose = () => {
    this.setState({ openModalAddfriend: false });
  };
  searchFriends = async event => {
    event.preventDefault();
    try {
      const result = await ProfileService.searchFriends(
        this.props.userId,
        this.state.searchInput
      );
      this.setState({
        friends: result
      });
      console.log("friends ?", result);
    } catch (error) {
      console.log("error searching friend", error);
    }
  };
  async componentDidMount() {
    try {
      const suggestedFriends = await ProfileService.suggestedFriends(
        this.props.userId
      );
      const friends = await ProfileService.searchFriends(
        this.props.userId,
        this.state.searchInput
      );

      this.setState({
        suggestedFriends,
        friends
      });
    } catch (error) {
      console.log("error searching friend", error);
    }
  }
  render() {
    const { friends, suggestedFriends, friendToAdd, searchInput } = this.state;
    const { classes } = this.props;
    return (
      <React.Fragment>
        <GridContainer style={{ padding: "2em" }}>
          <GridItem xs={12} sm={12} md={6}>
            <Card>
              <CardHeader color="primary">
                <h4 className={classes.cardTitleWhite}>Buscador de amigos</h4>
              </CardHeader>
              <CardBody>
                <GridContainer>
                  <GridItem xs={12} sm={12} md={8}>
                    <form onSubmit={this.searchFriends}>
                      <CustomInput
                        labelText="Buscar persona"
                        id="company-disabled"
                        formControlProps={{
                          fullWidth: true
                        }}
                        inputProps={{
                          value: searchInput,
                          type: "text",
                          onChange: event =>
                            this.setState({ searchInput: event.target.value })
                        }}
                      />
                    </form>
                  </GridItem>
                  <GridItem
                    xs={12}
                    sm={12}
                    md={4}
                    style={{ display: "flex", alignItems: "flex-end" }}
                  >
                    <Button color="primary" onClick={this.searchFriends}>
                      Aceptar
                    </Button>
                  </GridItem>
                </GridContainer>
                {friends.length > 0 ? (
                  <FriendsTable friends={friends} />
                ) : (
                  <div style={{textAlign:"center",padding:"3em"}}>
                  <Typography>No hay resultados para tu busqueda</Typography>

                  </div>
                )}
              </CardBody>
            </Card>
          </GridItem>
          <GridItem xs={12} sm={12} md={6}>
            <Card>
              <CardHeader color="primary">
                <h4 className={classes.cardTitleWhite}>Amigos sugeridos</h4>
              </CardHeader>
              <CardBody>
                <FriendsTable
                  friends={suggestedFriends}
                  onClickFriend={this.openModalAddFriend}
                />
              </CardBody>
            </Card>
          </GridItem>
        </GridContainer>
        )}
        <Snackbar
          place="bc"
          color="success"
          message={this.state.snackbar.message}
          open={this.state.snackbar.open}
          closeNotification={() => this.setState({ snackbar: { open: false } })}
          close
        />
        <Dialog
          open={this.state.openModalAddfriend}
          onClose={this.handleClose}
          aria-labelledby="alert-dialog-title"
          aria-describedby="alert-dialog-description"
        >
          <DialogTitle id="alert-dialog-title">
            Seguro quiere agregar a :{" "}
            {friendToAdd && `${friendToAdd.name} ${friendToAdd.lastName}`} a su
            lista de contactos ?
          </DialogTitle>
          <DialogActions>
            <Button onClick={this.addFriend} color="primary" autoFocus>
              Agregar
            </Button>
            <Button onClick={this.handleClose} color="primary">
              Cancelar
            </Button>
          </DialogActions>
        </Dialog>
      </React.Fragment>
    );
  }
}
export default withStyles(styles)(Friends);
/*
<div>
        <Paper>
          <Card>
            <CardContent>
              <form
                action=""
                onSubmit={this.searchFriends}
                style={{ display: "flex", alignItems: "baseline" }}
              >
                <TextField
                  label="Buscar Persona"
                  value={searchInput}
                  onChange={event =>
                    this.setState({ searchInput: event.target.value })
                  }
                />
                <div style={{ marginLeft: "1em" }}>
                  <Button
                    onClick={this.searchFriends}
                    color="primary"
                    variant="contained"
                  >
                    Buscar
                  </Button>
                </div>
              </form>

              <div>
                <FriendsTable friends={friends} />
              </div>
              <div style={{ marginTop: "2em" }}>Amigos sugeridos</div>
              <div>
                <FriendsTable
                  friends={suggestedFriends}
                  onClickFriend={this.openModalAddFriend}
                />
              </div>
            </CardContent>
            <CardActions>
              <Button onClick={() => this.props.history.push("/profile")}>
                Volver
              </Button>
            </CardActions>
          </Card>
        </Paper>
        
      </div>

*/
