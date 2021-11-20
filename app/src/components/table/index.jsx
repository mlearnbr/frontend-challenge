import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import {
  Box,
  Collapse,
  IconButton,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Typography,
  Paper,
} from "@material-ui/core";
import { KeyboardArrowDown, KeyboardArrowUp } from "@material-ui/icons";

import getPeopleService from "../../services/getPeoplesService";

function createData(
  name,
  birth_year,
  eye_color,
  gender,
  hair_color,
  height,
  mass,
  skin_color,
  homeworld,
  films,
  species
) {
  return {
    name: name,
    birth_year: birth_year,
    details: [
      {
        eye_color: eye_color,
        gender: gender,
        hair_color: hair_color,
        height: height,
        mass: mass,
        skin_color: skin_color,
        homeworld: homeworld,
        films: films,
        species: species,
      },
    ],
  };
}

function Row(props) {
  const { row } = props;
  const [open, setOpen] = React.useState(false);

  const [peoples, setPeoples] = useState([]);

  async function GetPeopleService() {
    const peoplesList = await getPeopleService();
    const peoples = peoplesList ? peoplesList : [];
    setPeoples(peoples);
  }

  useEffect(() => {
    GetPeopleService();
  }, []);

  const rows = [
    peoples.map((people) =>
      createData(
        people.name,
        people.birth_year,
        people.eye_color,
        people.gender,
        people.hair_color,
        people.height,
        people.mass,
        peoples.kin_color,
        peoples.homeworld,
        people.films,
        people.species
      )
    ),
  ];
  return (
    <React.Fragment>
      <TableRow sx={{ "& > *": { borderBottom: "unset" } }}>
        <TableCell>
          <IconButton
            aria-label="expand row"
            size="small"
            onClick={() => setOpen(!open)}
          >
            {open ? <KeyboardArrowUp /> : <KeyboardArrowDown />}
          </IconButton>
        </TableCell>
        <TableCell align="right">{row.name}</TableCell>
        <TableCell align="right">{row.birth_year}</TableCell>
      </TableRow>
      <TableRow>
        <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
          <Collapse in={open} timeout="auto" unmountOnExit>
            <Box sx={{ margin: 1 }}>
              <Typography variant="h6" gutterBottom component="div">
                Details
              </Typography>
              <Table size="small" aria-label="purchases">
                <TableHead>
                  <TableRow>
                    <TableCell>Name</TableCell>
                    <TableCell>birth_year</TableCell>
                    <TableCell align="right">eye_color</TableCell>
                    <TableCell align="right">gender</TableCell>
                    <TableCell align="right">hair_color</TableCell>
                    <TableCell align="right">height</TableCell>
                    <TableCell align="right">mass</TableCell>
                    <TableCell align="right">skin_color</TableCell>
                    <TableCell align="right">homeworld</TableCell>
                    <TableCell align="right">films</TableCell>
                    <TableCell align="right">species</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {row.details.map((detailRow) => (
                    <TableRow key={detailRow.date}>
                      <TableCell component="th" scope="row">
                        {detailRow.date}
                      </TableCell>
                      <TableCell>{detailRow.customerId}</TableCell>
                      <TableCell align="right">{detailRow.amount}</TableCell>
                      <TableCell align="right">
                        {Math.round(detailRow.amount * row.price * 100) / 100}
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </Box>
          </Collapse>
        </TableCell>
      </TableRow>
    </React.Fragment>
  );
}

const CollapsibleTable = () => {
  return (
    <TableContainer component={Paper}>
      <Table aria-label="collapsible table">
        <TableHead>
          <TableRow>
            <TableCell />
            <TableCell>Dessert (100g serving)</TableCell>
            <TableCell align="right">Calories</TableCell>
            <TableCell align="right">Fat&nbsp;(g)</TableCell>
            <TableCell align="right">Carbs&nbsp;(g)</TableCell>
            <TableCell align="right">Protein&nbsp;(g)</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <Row key={row.name} row={row} />
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default CollapsibleTable;
