import React, { Component } from "react";
import { Grid, Paper, Typography, TextField, InputAdornment, IconButton, Table, TableRow, TableHead, TableCell, TableBody, Button } from "@material-ui/core";
import SearchIcon from '@material-ui/icons/Search';
import "./Tickets.scss";
import MovieTable from "./components/MovieTable";
import MovieService from './../../../services/MovieService';
import MovieServiceMock from './../../../services/mocks/MovieServiceMock';

const movieService = new MovieServiceMock();

export default class Tickets extends Component {
  constructor(props) {
    super(props)
    this.state = {
      user: {
        name: "Nicolas Espindola",
        wallet: 10000.0,
        shoppingCart: [],
      }
    };
  }

  componentDidMount = async () => {
    let movies = await movieService.getMoviesByName("");
    let recommended = await movieService.getRecommended();
    this.setState({
      movies: movies,
      recommended: recommended
    });
  }

  handleSearchTextChange = (event) => {
    this.setState({ searchText: event.target.value });
  }

  searchMovies = async (event) => {
    event.preventDefault();
    const movies = await movieService.getMoviesByName(this.state.searchText);
    this.setState((prevState) => {
      prevState.movies = movies;
      return prevState;
    })
  }

  addTicket = (movieScreening) => {
    this.setState((prevState) => {
      prevState.shoppingCart.push(movieScreening);
      return prevState;
    })
  }

  showMovieScreenings = (movie) => {
    alert(movie.title);
  }

  render() {

    //const { classes } = this.props;

    return (
      <div>
        <Grid container spacing={8} className="myContainer">

          <Grid item xs={12}>
            <Grid container spacing={8} className="">
              <Grid item xs={6}>
                <Typography className="userLabel">Usuario: {this.state.user.name}</Typography>
              </Grid>

              <Grid item xs={6}>
                <Typography className="dateLabel">Fecha: 10/02/2019</Typography>
              </Grid>
            </Grid>
          </Grid>

          <Grid item xs={6} className="myItemContainer">
            <Grid container spacing={8}>

              <Grid item xs={12}>
                <Grid container spacing={8}>
                  <Grid item xs={12}>
                    <form onSubmit={this.searchMovies}>
                      <TextField fullWidth variant="filled" label="Buscar Película" InputLabelProps={{ shrink: true }} onChange={this.handleSearchTextChange} value={this.state.searchText} />
                    </form>
                  </Grid>

                  <Grid item xs={12}>
                    <MovieTable handleClick={this.showMovieScreenings} movies={this.state.movies} />
                  </Grid>
                </Grid>
              </Grid>


              <Grid item xs={12}>
                <Grid container spacing={8}>
                  <Grid item xs={12}>
                    <Typography>Pelis recomendadas</Typography>
                  </Grid>

                  <Grid item xs={12}>
                    <MovieTable handleClick={this.showMovieScreenings} movies={this.state.recommended} />
                  </Grid>
                </Grid>
              </Grid>
            </Grid>
          </Grid>

          <Grid item xs={6} className="myItemContainer">
            <Grid container spacing={8}>
              <Grid item xs={12}>
                <Typography>Funciones</Typography>
              </Grid>

              <Grid item xs={12}>
                <Paper>
                  <Table>
                    <TableHead>
                      <TableRow>
                        <TableCell>Nombre</TableCell>
                        <TableCell>Fecha</TableCell>
                        <TableCell>Rating</TableCell>
                        <TableCell>Genero</TableCell>
                      </TableRow>
                    </TableHead>
                    <TableBody>
                      <TableRow>
                        <TableCell>Test</TableCell>
                        <TableCell>Test</TableCell>
                        <TableCell>Test</TableCell>
                        <TableCell>Test</TableCell>
                      </TableRow>
                    </TableBody>
                  </Table>
                </Paper>
              </Grid>
            </Grid>
          </Grid>

          <Grid item xs={12} className="myItemContainer">
            <Button fullWidth variant="contained" onClick={this.addToShoppingCart}>Agregar al carrito</Button>
          </Grid>

          <Grid item xs={6} className="myItemContainer">
            <Grid container spacing={8}>
              <Grid item><Typography>Items en el carrito: {this.state.user.shoppingCart.length}</Typography></Grid>
              <Grid item xs={6}><Button variant="contained">Finalizar compra</Button></Grid>
            </Grid>
          </Grid>

          <Grid item xs={6} className="panelDeControl">
            <Button variant="contained">Panel de Control</Button>
          </Grid>
        </Grid>
      </div>
    )
  }
}