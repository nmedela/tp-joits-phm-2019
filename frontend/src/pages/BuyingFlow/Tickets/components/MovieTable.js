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
import "./MovieTable.scss";

export default class MovieTable extends Component {

  handleClick = (movie) => () => {
    this.props.handleClick(movie);
  }

  render() {

    const { movies ,minimalist } = this.props;

    return (
      <Paper>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>Nombre</TableCell>
              {!minimalist && <React.Fragment > <TableCell>Fecha</TableCell>}
              <TableCell>Rating</TableCell>
              <TableCell>Genero</TableCell></React.Fragment>}
            </TableRow>
          </TableHead>
          <TableBody>
            {
              movies && movies.map(movie => {
                return (
                  <TableRow className="tableRow" hover onClick={this.handleClick(movie)}>
                  
                    <TableCell>{movie.title}</TableCell>
                    <TableCell>{movie.year}</TableCell>
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
