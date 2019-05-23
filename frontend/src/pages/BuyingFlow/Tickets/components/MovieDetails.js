import React, { Component, Fragment } from 'react'
import { Dialog, DialogTitle, Table, TableHead, TableRow, TableCell, TableBody, Typography, DialogContentText, DialogContent, Divider, Checkbox, DialogActions, Button } from '@material-ui/core';
import "./MovieTable.scss";
import MovieServiceMock from './../../../../services/mocks/MovieServiceMock';
import MovieService from './../../../../services/MovieService';

const movieService = new MovieService();

export default class MovieDetails extends Component {

  state = { shoppingCart: [] }

  loadMovieScreenings = async () => {
    // const screenings = await movieService.getScreeningsForMovie(this.props.movie);
    const screenings = this.props.movie.screenings
    this.setState({ screenings: screenings, shoppingCart: this.props.shoppingCart.filter((element) => true) });
  }

  cancelEdit = () => {
    this.props.handleClose();
  }

  saveChanges = () => {
    this.props.updateShoppingCart(this.state.shoppingCart);
  }

  handleClick = (screening) => () => {
    // if (this.state.shoppingCart.some( ticket => ticket.movie.id === this.props.movie.id && ticket.screeningId === screening.id)) {
    //   const indexToRemove = this.state.shoppingCart.findIndex(chorizo => chorizo.movie.id === this.props.movie.id && chorizo.screeningId === screening.id) 
    if (this.state.shoppingCart.some( ticket => ticket.movie.title === this.props.movie.title && ticket.screening === screening)) {
      const indexToRemove = this.state.shoppingCart.findIndex(chorizo => chorizo.movie.title === this.props.movie.title && chorizo.screening === screening) 

      this.setState((prevState) => ({ shoppingCart: prevState.shoppingCart.filter((ticket,index) => { 
        return index !== indexToRemove})
       }));
    }
    else {
      // this.setState((prevState) => { prevState.shoppingCart.push({movie: this.props.movie, screeningId: screening.id}); return prevState; });
      this.setState((prevState) => { prevState.shoppingCart.push({movie: this.props.movie, screening}); return prevState; });
 
    }
  }


  render() {
    const { movie } = this.props;
    return (
      <Dialog onClose={this.cancelEdit} open={this.props.open} onEnter={this.loadMovieScreenings}>
        {
          movie &&
          <Fragment>
            <DialogTitle>{movie.title}</DialogTitle>
            <DialogContent>
              <Typography variant="subtitle2">Funciones</Typography>
            </DialogContent>
            <Table>
              <TableHead>
                <TableRow role="checkbox">
                  <TableCell padding="none"></TableCell>
                  <TableCell>Fecha</TableCell>
                  <TableCell>Hora</TableCell>
                  <TableCell numeric>Precio entrada ($)</TableCell>
                  <TableCell>Ubicacion</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {this.state.screenings && this.state.screenings.map((screening) => {
                  return (
                    // <TableRow className="tableRow" onClick={this.handleClick(screening)} selected={this.state.shoppingCart.includes(screening.id)}>
                    //   <TableCell padding="none"><Checkbox checked={this.state.shoppingCart.some(ticket => ticket.movie.id === this.props.movie.id && ticket.screeningId === screening.id)} /></TableCell>
                    <TableRow className="tableRow" onClick={this.handleClick(screening)} selected={this.state.shoppingCart.includes(screening)}>
                    <TableCell padding="none"><Checkbox checked={this.state.shoppingCart.some(ticket => ticket.movie.title === this.props.movie.title && ticket.screening === screening)} /></TableCell>
                      <TableCell>{screening.date}</TableCell>
                      <TableCell>{screening.time}</TableCell>
                      <TableCell numeric>{"$" + screening.price}</TableCell>
                      <TableCell>{screening.cinemaName}</TableCell>
                    </TableRow>
                  )
                })}
              </TableBody>
            </Table>
            <DialogActions>
              <Button color="primary" onClick={this.saveChanges}>
                Aceptar
              </Button>
              <Button color="secondary" onClick={this.cancelEdit}>
                Cancelar
              </Button>
            </DialogActions>
          </Fragment>
        }
      </Dialog>
    )
  }
}
