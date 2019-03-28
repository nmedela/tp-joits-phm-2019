import React, { Component } from "react";
import {
  Button,
  CardContent,
  CardActions,
  Paper,
  Card,
  TextField,
  Table,
  TableRow,
  TableHead,
  TableCell,
  TableBody,
  Dialog,
  DialogTitle,
  DialogActions
} from "@material-ui/core";
import FriendsTable from "../../../components/FriendsTable";
import ProfileService from "../../../services/ProfileService";

class Friends extends Component {
  state = {
    friends: [],
    suggestedFriends: [{ name: "gonzalo", lastname: "gras" }],
    openModalAddfriend: false,
    friendToAdd: null,
    searchInput: ""
  };

  openModalAddFriend = friend => {
    this.setState(
      {
        friendToAdd: friend
      },
      () => this.handleClickOpen()
    );
  };
  addFriend = () => {
    try {
      ProfileService.addFriend(this.state.friendToAdd);
      console.log("se agrego al amigo exitosamente");
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
      const result = await ProfileService.searchFriends(this.state.searchInput);
      this.setState({
        friends: result
      });
    } catch (error) {
      console.log("error searching friend", error);
    }
  };
  render() {
    const { friends, suggestedFriends, friendToAdd, searchInput } = this.state;
    return (
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
        <Dialog
          open={this.state.openModalAddfriend}
          onClose={this.handleClose}
          aria-labelledby="alert-dialog-title"
          aria-describedby="alert-dialog-description"
        >
          <DialogTitle id="alert-dialog-title">
            Seguro quiere agregar a :{" "}
            {friendToAdd && `${friendToAdd.name} ${friendToAdd.lastname}`} a su
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
      </div>
    );
  }
}
export default Friends;
