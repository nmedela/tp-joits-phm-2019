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
  TableBody,
  IconButton
} from "@material-ui/core";
import DeleteIcon from "@material-ui/icons/Delete";
import BuyingFlowService from "../../../services/BuyingFlowService";
import ShoppingCartService from "./../../../services/ShoppingCartService";

const shoppingCartService = new ShoppingCartService();
class Confirm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      shoppingCart: []
    };
  }

  componentDidMount = async () => {
    const _shoppingCart = await shoppingCartService.getShoppingCartDetails(
      this.props.userId
    );
    this.setState({ shoppingCart: _shoppingCart });
  };

  goBack = () => {
    this.props.history.push("/buying-flow/tickets");
  };

  removeScreening = element => async () => {
    const newShoppingCart = this.state.shoppingCart.filter(
      screening => screening !== element
    );
    this.updateShoppingCart(newShoppingCart);
  };

  removeAll = () => {
    this.updateShoppingCart([]);
  };

  updateShoppingCart = async newShoppingCart => {
    const oldShoppingCart = this.state.shoppingCart;
    try {
      const response = await shoppingCartService.updateShoppingCart(this.props.userId, newShoppingCart);
      this.setState({ shoppingCart: newShoppingCart });
    } catch (exception) {
      this.setState({ shoppingCart: oldShoppingCart });
    }
  };

  submitOrder = async () => {
    const userId = this.props.userId;
    try {
      await shoppingCartService.submitOrder(userId);
      alert("Se completo con exito su compra");
      this.removeAll();
    } catch (e) {
      alert("No se pudo completar su compra");
    }
    // this.props.history.push("/buying-flow/tickets")
  };

  render() {
    const { shoppingCart } = this.state;
    const hasItemsInCart = shoppingCart.length > 0;
    return (
      <Paper>
        <Card>
          <CardContent style={{ display: "flex", justifyContent: "center" }}>
          { hasItemsInCart ? 
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
                    <TableCell>Precio entrada ($)</TableCell>
                    <TableCell>Genero</TableCell>
                    <TableCell>
                      <IconButton>
                        <DeleteIcon onClick={this.removeAll} />
                      </IconButton>
                    </TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {shoppingCart.map(screening => (
                    <TableRow>
                      <TableCell>{screening.movieTitle}</TableCell>
                      <TableCell>{screening.movieRating}</TableCell>
                      <TableCell>{"$" + screening.price}</TableCell>
                      <TableCell>{screening.movieGenre}</TableCell>
                      <TableCell onClick={this.removeScreening(screening)}>
                        <IconButton>
                          <DeleteIcon />
                        </IconButton>
                      </TableCell>
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
                  {shoppingCart &&
                    shoppingCart.reduce(
                      (total, screening) => total + screening.price,
                      0
                    )}
                </div>
              </div>
            </Grid>
        </Grid>
          
          
          : 
          
          <Grid>
            <Typography align="center" variant="h5">
            No hay items en el carrito

            </Typography>
          </Grid>
          
          }
            
          </CardContent>
          <CardActions>
            {hasItemsInCart && <React.Fragment>
                <Button onClick={this.removeAll}>Limpiar carrito</Button>
                <Button onClick={this.submitOrder}>Comprar</Button>
                <Button onClick={this.goBack}>Volver atras</Button>
              </React.Fragment>}
              
          </CardActions>
        </Card>
      </Paper>
    );
  }
}

export default Confirm;
