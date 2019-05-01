// @material-ui/icons
import Person from "@material-ui/icons/Person";
import LibraryBooks from "@material-ui/icons/LibraryBooks";
import ShoppingCart from "@material-ui/icons/ShoppingCart";
import AccountCircle from "@material-ui/icons/AccountCircle";
import People from "@material-ui/icons/People";

const dashboardRoutes = [
  {
    path: "/",
    name: "Login",
    icon: AccountCircle,
  },
  {
    path: "/profile",
    name: "Perfil",
    icon: Person,
  },
  {
    path: "/profile/friends",
    name: "Amigos",
    icon: People,
  },
  {
    path: "/buying-flow/tickets",
    name: "Entradas",
    icon: LibraryBooks,
  },
  {
    path: "/buying-flow/confirm",
    name: "Carrito",
    icon: ShoppingCart,
  },
  
];

export default dashboardRoutes;
