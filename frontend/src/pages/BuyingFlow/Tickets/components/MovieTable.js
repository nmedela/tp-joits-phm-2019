import React, { Component } from 'react'
import {
  Grid,
  Paper,
  Typography,
  TextField,
  InputAdornment,
  IconButton,
  Table,
  TableRow,
  TableHead,
  TableCell,
  TableBody,
  Button
} from "@material-ui/core";

export default class MovieTable extends Component {

  onClick = (movie) => {
    this.props.handleClick(movie);
  }

  render() {

    const { movies } = this.props;

    return (
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
            {
              movies && movies.map(movie => {
                return (
                  <TableRow onClick={this.handleClick}>
                    <TableCell>{movie.title}</TableCell>
                    <TableCell>{movie.date}</TableCell>
                    <TableCell>{movie.rating}</TableCell>
                    <TableCell>{movie.genre}</TableCell>
                  </TableRow>
                )
              })
            }
          </TableBody>
        </Table>
      </Paper>
    )
  }
}
