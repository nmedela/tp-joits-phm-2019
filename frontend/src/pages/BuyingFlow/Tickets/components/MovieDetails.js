import React, { Component, Fragment } from 'react'
import { Dialog, DialogTitle, Table, TableHead, TableRow, TableCell, TableBody, Typography, DialogContentText, DialogContent, Divider, Checkbox, DialogActions, Button } from '@material-ui/core';
import "./MovieTable.scss";
import MovieServiceMock from './../../../../services/mocks/MovieServiceMock';
import MovieService from './../../../../services/MovieService';
import AddShoppingCartIcon from '@material-ui/icons/AddShoppingCart';
import IconButton from '@material-ui/core/IconButton';

const movieService = new MovieService();

export default class MovieDetails extends Component {

  state = {}

  loadMovieScreenings = async () => {
    const screenings = this.props.movie.screenings
    this.setState({ screenings: screenings});
  }

  handleClick = (screening) => () => {
    const ticket = {
      movieTitle: this.props.movie.title,
      price: screening.price + this.props.movie.price,
      movieRating: this.props.movie.rating,
      movieGenre: this.props.movie.genre,
      date: screening.date,
      time: screening.time, 
      cinemaName: screening.cinemaName 
    }
    this.props.addToShoppingCart(ticket);
  }

  render() {
    const { movie } = this.props;
    return (
      <Dialog fullWidth onClose={this.cancelEdit} open={this.props.open} onEnter={this.loadMovieScreenings}>
        {
          movie &&
          <Fragment>
            <DialogTitle>{movie.title}</DialogTitle>
            <DialogContent>
              <Typography variant="subtitle2">Funciones</Typography>
            </DialogContent>
            <Table fullWidth>
              <TableHead>
                <TableRow role="checkbox">
                  <TableCell>Fecha</TableCell>
                  <TableCell>Hora</TableCell>
                  <TableCell numeric>Precio entrada ($)</TableCell>
                  <TableCell>Ubicacion</TableCell>
                  <TableCell padding="none"></TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {this.state.screenings && this.state.screenings.map((screening) => {
                  return (
                    <TableRow className="tableRow">
                      <TableCell>{screening.date}</TableCell>
                      <TableCell>{screening.time}</TableCell>
                      <TableCell numeric>{"$" + (screening.price + this.props.movie.price)}</TableCell>
                      <TableCell>{screening.cinemaName}</TableCell>
                      <TableCell padding="none">
                        <IconButton color="primary" aria-label="Add to shopping cart" onClick={this.handleClick(screening)}>
                          <AddShoppingCartIcon />
                        </IconButton>
                      </TableCell>
                    </TableRow>
                  )
                })}
              </TableBody>
            </Table>
            <DialogActions>
              <Button color="primary" variant="contained" onClick={this.props.handleClose}>
                Volver
              </Button>
            </DialogActions>
          </Fragment>
        }
      </Dialog>
    )
  }
}
