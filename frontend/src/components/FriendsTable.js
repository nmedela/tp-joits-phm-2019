import React, { Component } from "react";
import PropTypes from "prop-types";
import {
  Table,
  TableRow,
  TableHead,
  TableCell,
  TableBody
} from "@material-ui/core";
const FriendsTable = props => {
  const onClick = friend => () => {
    props.onClickFriend(friend);
  };
  return (
    <Table>
      <TableHead>
        <TableRow>
          <TableCell>Nombre</TableCell>
          <TableCell>Apellido</TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {props.friends.map(friend => (
          <TableRow onClick={onClick(friend)}>
            <TableCell>{friend.name}</TableCell>
            <TableCell>{friend.lastName}</TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
};

FriendsTable.defaultProps = {
  onClickFriend: () => {}
};
FriendsTable.propsType = {
  onClickFriend: PropTypes.func
};

export default FriendsTable;
