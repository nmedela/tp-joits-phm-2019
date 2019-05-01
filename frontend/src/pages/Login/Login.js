import React from "react";
import PropTypes from "prop-types";
import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
import CssBaseline from "@material-ui/core/CssBaseline";
import FormControl from "@material-ui/core/FormControl";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Checkbox from "@material-ui/core/Checkbox";
import Input from "@material-ui/core/Input";
import InputLabel from "@material-ui/core/InputLabel";
import LockOutlinedIcon from "@material-ui/icons/LockOutlined";
import Paper from "@material-ui/core/Paper";
import Typography from "@material-ui/core/Typography";
import withStyles from "@material-ui/core/styles/withStyles";
import LoginService from "../../services/LoginService";
import SnackbarContent from "components/Snackbar/SnackbarContent.jsx";
import Snackbar from "components/Snackbar/Snackbar.jsx";

const styles = theme => ({
  main: {
    width: "auto",
    display: "block", // Fix IE 11 issue.
    marginLeft: theme.spacing.unit * 3,
    marginRight: theme.spacing.unit * 3,
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      width: 400,
      marginLeft: "auto",
      marginRight: "auto"
    }
  },
  paper: {
    marginTop: theme.spacing.unit * 8,
    marginBottom: theme.spacing.unit * 8,
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    padding: `${theme.spacing.unit * 2}px ${theme.spacing.unit * 3}px ${theme
      .spacing.unit * 3}px`
  },
  avatar: {
    margin: theme.spacing.unit,
    backgroundColor: theme.palette.secondary.main
  },
  form: {
    width: "100%", // Fix IE 11 issue.
    marginTop: theme.spacing.unit
  },
  submit: {
    marginTop: theme.spacing.unit * 3
  }
});

const initialState = {
  userInput: null,
  passwordInput: null,
  errorLogin: null
};

class Login extends React.Component {
  state = {
    ...initialState
  };
  loginUser = async () => {
    try {
      const loggedUser = await LoginService.login({
        username: this.state.userInput,
        password: this.state.passwordInput
      });

      LoginService.saveSession(loggedUser.id);
      this.props.login();
      this.props.history.push("/buying-flow/tickets");
    } catch (e) {
      this.setState({
        errorLogin: "Usuario/password incorrectos"
      });
    }
  };
  render() {
    const { classes } = this.props;
    const { passwordInput, userInput, errorLogin } = this.state;

    return (
      <div style={{height:"100%",width:"100%"}}>
        <main className={classes.main}>
          <CssBaseline />
          <Paper className={classes.paper}>
            <Avatar className={classes.avatar}>
              <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
              Sign in
            </Typography>
            <form
              className={classes.form}
              onSubmit={event => {
                event.preventDefault();
                this.loginUser();
              }}
            >
              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="user">Usuario</InputLabel>
                <Input
                  id="user"
                  name="user"
                  autoComplete="text"
                  autoFocus
                  value={userInput}
                  onChange={event =>
                    this.setState({ userInput: event.target.value })
                  }
                />
              </FormControl>
              <FormControl margin="normal" required fullWidth>
                <InputLabel htmlFor="password">Contraseña</InputLabel>
                <Input
                  name="password"
                  type="password"
                  id="password"
                  autoComplete="current-password"
                  value={passwordInput}
                  onChange={event =>
                    this.setState({ passwordInput: event.target.value })
                  }
                />
              </FormControl>
              <FormControlLabel
                control={<Checkbox value="remember" color="primary" />}
                label="Recordarme"
              />
              <Button
                type="submit"
                fullWidth
                variant="contained"
                color="primary"
                className={classes.submit}
                disabled={!passwordInput || !userInput}
                onClick={this.loginUser}
              >
                Sign in
              </Button>
            </form>
          </Paper>
        </main>
        <Snackbar
          place="bc"
          color="danger"
          message="Usuario o password incorrectos"
          open={this.state.errorLogin}
          closeNotification={() => this.setState({ errorLogin: false })}
          close
        />
      </div>
    );
  }
}

Login.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(Login);
