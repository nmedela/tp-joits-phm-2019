import React, { Component } from "react";
import { Grid, Typography, TextField, FormControl } from "@material-ui/core";
import SearchIcon from "@material-ui/icons/Search";
import "./Tickets.scss";
import MovieTable from "./components/MovieTable";
import MovieService from "./../../../services/MovieService";
import MovieServiceMock from "./../../../services/mocks/MovieServiceMock";
import MovieDetails from "./components/MovieDetails";
import ShoppingCartService from "./../../../services/ShoppingCartService";
import ProfileService from "./../../../services/ProfileService";
import ShoppingCartServiceMock from "./../../../services/mocks/ShoppingCartServiceMock";
import Search from "@material-ui/icons/Search";
import Button from "components/CustomButtons/Button.jsx";
import Card from "components/Card/Card.jsx";
import CardHeader from "components/Card/CardHeader.jsx";
import CardAvatar from "components/Card/CardAvatar.jsx";
import CardBody from "components/Card/CardBody.jsx";
import CardFooter from "components/Card/CardFooter.jsx";

import GridItem from "components/Grid/GridItem.jsx";
import GridContainer from "components/Grid/GridContainer.jsx";
const movieService = new MovieService();
const shoppingCartService = new ShoppingCartService();

export default class Tickets extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: null,
      date: new Date(),
      movies: []
    };
  }

  componentDidMount = async () => {
    let movies = await movieService.getMoviesByName("");
    let recommended = await movieService.getRecommended(this.props.userId);
    let shoppingCart = await shoppingCartService.getShoppingCart(this.props.userId);
    const user = await ProfileService.getUserData(this.props.userId);
    this.setState({
      movies: movies,
      recommended: recommended,
      shoppingCart: shoppingCart,
      user
    });
  };

  handleSearchTextChange = event => {
    this.setState({ searchText: event.target.value });
  };

  searchMovies = async event => {
    event.preventDefault();
    const movies = await movieService.getMoviesByName(this.state.searchText);
    this.setState(prevState => {
      prevState.movies = movies;
      return prevState;
    });
  };

  addTicket = movieScreening => {
    this.setState(prevState => {
      prevState.shoppingCart.push(movieScreening);
      return prevState;
    });
  };

  showMovieScreenings = movie => {
    this.setState({ openDialog: true, selectedMovie: movie });
  };

  closeDialog = () => {
    this.setState({ openDialog: false });
  };

  addToShoppingCart = async screening => {
    let newShoppingCart = this.state.shoppingCart;
    newShoppingCart.push(screening);
    this.setState(prevState => ({shoppingCart: newShoppingCart}))

    try {
      const response = await shoppingCartService.updateShoppingCart(
        this.props.userId,
        this.state.shoppingCart
      );
    } catch (exception) {
      alert(exception.message);
    }
  };

  goToCheckout = () => {
    this.props.history.push("/buying-flow/confirm");
  };

  render() {
    const { classes } = this.props;
    return (
      <div>
        <Grid container spacing={8} className="myContainer">
          <Grid item xs={12}>
            <Grid container spacing={8} className="">
              <Grid item xs={6}>
                <Typography className="userLabel">
                  Usuario:{" "}
                  {this.state.user &&
                    `${this.state.user.name} ${this.state.user.lastName}`}
                </Typography>
              </Grid>

              <Grid item xs={6}>
                <Typography className="dateLabel">
                  Fecha:{" "}
                  {`${this.state.date.getDate()}/${this.state.date.getMonth() +
                    1}/${this.state.date.getFullYear()}`}
                </Typography>
              </Grid>
            </Grid>
          </Grid>

          <GridContainer>
            <GridItem xs={12} sm={12} md={6}>
              <Card>
                <CardHeader color="primary">
                  <h4
                    className={{
                      color: "#FFFFFF",
                      marginTop: "0px",
                      minHeight: "auto",
                      fontWeight: "300",
                      fontFamily: "'Roboto', 'Helvetica', 'Arial', sans-serif",
                      marginBottom: "3px",
                      textDecoration: "none"
                    }}
                  >
                    Cartelera
                  </h4>
                </CardHeader>
                <CardBody>
                  <GridContainer>
                    <GridItem
                      xs={12}
                      sm={12}
                      md={12}
                      style={{ marginBottom: "2em" }}
                    >
                      <form onSubmit={this.searchMovies}>
                        <FormControl fullWidth>
                          <TextField
                            fullWidth
                            label="Buscar Película"
                            inputLabelProps={{ shrink: true }}
                            onChange={this.handleSearchTextChange}
                            value={this.state.searchText}
                          />
                        </FormControl>
                      </form>
                    </GridItem>
                    <GridItem xs={12} sm={12} md={12}>
                      {this.state.movies.length > 0 ? (
                        <MovieTable
                          handleClick={this.showMovieScreenings}
                          movies={this.state.movies}
                        />
                      ) : (
                        <div style={{ textAlign: "center", padding: "3em" }}>
                          <Typography>
                            No hay resultados para tu busqueda
                          </Typography>
                        </div>
                      )}
                    </GridItem>
                  </GridContainer>
                </CardBody>
              </Card>
            </GridItem>
            <GridItem xs={12} sm={12} md={6}>
              <Card>
                <CardHeader color="primary">
                  <h4
                    className={{
                      color: "#FFFFFF",
                      marginTop: "0px",
                      minHeight: "auto",
                      fontWeight: "300",
                      fontFamily: "'Roboto', 'Helvetica', 'Arial', sans-serif",
                      marginBottom: "3px",
                      textDecoration: "none"
                    }}
                  >
                    Pelis recomendadas
                  </h4>
                </CardHeader>
                <CardBody>
                  <GridContainer>
                    <GridItem xs={12} sm={12} md={12}>
                      <MovieTable
                        handleClick={this.showMovieScreenings}
                        movies={this.state.recommended}
                        minimalist={true}
                      />
                    </GridItem>
                  </GridContainer>
                </CardBody>
              </Card>
            </GridItem>
          </GridContainer>

          <Grid
            item
            xs={6}
            className="myItemContainer"
            style={{
              display: "flex",
              justifyContent: "flex-start",
              alignItems: "center"
            }}
          >
            <Grid container spacing={8}  style={{
              display: "flex",
              justifyContent: "flex-start",
              alignItems: "center"
            }}>
              <Grid item>
                <Typography>
                  Items en el carrito:{" "}
                  {this.state.shoppingCart && this.state.shoppingCart.length}
                </Typography>
              </Grid>
              <Grid item xs={6}>
                <Button color="primary" onClick={this.goToCheckout}>
                  Finalizar compra
                </Button>
              </Grid>
            </Grid>
          </Grid>

          <Grid item xs={6} className="panelDeControl">
            <Button
              color="primary"
              onClick={() => this.props.history.push("/profile")}
            >
              Panel de Control
            </Button>
          </Grid>
        </Grid>

        <MovieDetails
          open={this.state.openDialog}
          movie={this.state.selectedMovie}
          handleClose={this.closeDialog}
          addToShoppingCart={this.addToShoppingCart}
        />
      </div>
    );
  }
}
