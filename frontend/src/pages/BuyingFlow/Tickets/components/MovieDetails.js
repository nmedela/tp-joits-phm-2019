import React, { Component, Fragment } from 'react'
import { Dialog, DialogTitle, Table, TableHead, TableRow, TableCell, TableBody, Typography, DialogContentText, DialogContent, Divider, Checkbox, DialogActions, Button } from '@material-ui/core';
import "./MovieTable.scss";
import MovieServiceMock from './../../../../services/mocks/MovieServiceMock';

const movieService = new MovieServiceMock();

export default class MovieDetails extends Component {

  state = { shoppingCart: [] }

  loadMovieScreenings = async () => {
    const screenings = await movieService.getScreeningsForMovie(this.props.movie);
    this.setState({ screenings: screenings, shoppingCart: this.props.shoppingCart.filter((element) => true) });
  }

  cancelEdit = () => {
    this.props.handleClose();
  }

  saveChanges = () => {
    this.props.updateShoppingCart(this.state.shoppingCart);
  }

  handleClick = (screen) => () => {
    if (this.state.shoppingCart.includes(screen.id)) {
      this.setState((prevState) => ({ shoppingCart: prevState.shoppingCart.filter((element) => { return element !== screen.id }) }));
    }
    else {
      this.setState((prevState) => { prevState.shoppingCart.push(screen.id); return prevState; });
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
                  <TableCell>Ubicacion</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {this.state.screenings && this.state.screenings.map((screen) => {
                  return (
                    <TableRow className="tableRow" onClick={this.handleClick(screen)} selected={this.state.shoppingCart.includes(screen.id)}>
                      <TableCell padding="none"><Checkbox checked={this.state.shoppingCart.includes(screen.id)} /></TableCell>
                      <TableCell>{screen.date}</TableCell>
                      <TableCell>{screen.time}</TableCell>
                      <TableCell>{screen.location}</TableCell>
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
