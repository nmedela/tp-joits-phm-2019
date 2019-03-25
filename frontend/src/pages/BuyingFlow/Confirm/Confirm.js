import React, { Component } from "react";
import PropTypes from "prop-types";
import {
  Grid,
  Typography,
  Button,
  CardContent,
  CardActions,
  Paper,
  Card,
  Table,
  TableRow,
  TableHead,
  TableCell,
  TableBody
} from "@material-ui/core";
import BuyingFlowService from "../../../services/BuyingFlowService";

class Confirm extends Component {
  state = {
    cart: {
      items: [
        {
          id: 0,
          name: "pepito",
          rating: 7.8,
          genere: "Miedo",
          price: 200
        }
      ]
    }
  };
  cleanCart = () => {
    this.setState({
      cart: {
        items: [],
        total: 0
      }
    });
  };
  goBack = () => {
    this.props.history.push("/buying-flow/tickets");
  };
  buy = async () => {
    try {
      await BuyingFlowService.buy(this.state.cart);
      console.log("Compra exitosa");
    } catch (e) {
      console.log("error en la compra", e);
    }
  };
  remove = itemToRemove => () => {
    const newCart = { ...this.state.cart };

    newCart.items = newCart.items.filter(item => item.id !== itemToRemove.id);
    newCart.total = newCart.total - itemToRemove.price;
    this.setState({
      cart: newCart
    });
  };
  render() {
    const { cart } = this.state;
    return (
      <Paper>
        <Card>
          <CardContent style={{ display: "flex", justifyContent: "center" }}>
            <Grid item xs={12}>
              <Grid container spacing={12}>
                <Typography className="userLabel">
                  Pelis en el carrito
                </Typography>
              </Grid>
              <Grid container spacing={12}>
                <Table>
                  <TableHead>
                    <TableRow>
                      <TableCell>Nombre</TableCell>
                      <TableCell>Rating</TableCell>
                      <TableCell>Genero</TableCell>
                      <TableCell>Precio</TableCell>
                      <TableCell />
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {cart.items.map(item => (
                      <TableRow>
                        <TableCell>{item.name}</TableCell>
                        <TableCell>{item.rating}</TableCell>
                        <TableCell>{item.genere}</TableCell>
                        <TableCell>{item.price}</TableCell>
                        <TableCell onClick={this.remove(item)}> x </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </Grid>
              <Grid container spacing={12}>
                <div
                  style={{
                    display: "flex",
                    justifyContent: "flex-end",
                    width: "100%",
                    marginTop: "1em"
                  }}
                >
                  <div>
                    Total : $
                    {cart.items.reduce((total, item) => total + item.price, 0)}
                  </div>
                </div>
              </Grid>
            </Grid>
          </CardContent>
          <CardActions>
            <Button onClick={this.cleanCart}>Limpiar carrito</Button>
            <Button onClick={this.buy}>Comprar</Button>
            <Button onClick={this.goBack}>Volver atras</Button>
          </CardActions>
        </Card>
      </Paper>
    );
  }
}

export default Confirm;
