import React, { Component } from "react";
import { Grid, Paper, Typography, TextField, InputAdornment, IconButton, Table, TableRow, TableHead, TableCell, TableBody, Button } from "@material-ui/core";
import SearchIcon from '@material-ui/icons/Search';
import "./Tickets.scss";

export default class Tickets extends Component {
  constructor(props) {
    super(props)
    this.state = {};
  }

  render() {

    //const { classes } = this.props;

    return (
      <div>
        <Grid container spacing={8} className="myContainer">

          <Grid item xs={12}>
            <Grid container spacing={8} className="">
              <Grid item xs={6}>
                <Typography className="userLabel">Usuario: Pepito Morgan</Typography>
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
                    <TextField fullWidth variant="filled" label="Buscar Película" InputLabelProps={{ shrink: true }} />
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


              <Grid item xs={12}>
                <Grid container spacing={8}>
                  <Grid item xs={12}>
                    <Typography>Favoritas</Typography>
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
            <Button fullWidth variant="contained">Agregar al carrito</Button>
          </Grid>

          <Grid item xs={6} className="myItemContainer">
            <Grid container spacing={8}>
              <Grid item><Typography>Items en el carrito: 3</Typography></Grid>
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