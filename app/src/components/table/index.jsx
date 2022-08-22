import React, { useEffect, useState } from "react";
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
  Select,
  MenuItem,
  InputLabel,
  FormControl,
} from "@material-ui/core";
import { KeyboardArrowDown, KeyboardArrowUp } from "@material-ui/icons";

import getPeopleService from "../../services/getPeoplesService";

import "./style.css";
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
    details: {
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
  };
}

function Row(props) {
  const { row } = props;
  const [open, setOpen] = React.useState(false);

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
        <TableCell component="th" scope="row" align="left">
          {row.name}
        </TableCell>
        <TableCell align="left">
          {row.details.species.length !== 0
            ? row.details.species[0].name
            : "N/D"}
        </TableCell>
        <TableCell align="left">{row.birth_year}</TableCell>
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
                    <TableCell>Birth Year</TableCell>
                    <TableCell align="left">Eye Color</TableCell>
                    <TableCell align="left">Gender</TableCell>
                    <TableCell align="left">Hair Color</TableCell>
                    <TableCell align="left">Height</TableCell>
                    <TableCell align="left">Mass</TableCell>
                    <TableCell align="left">Skin Color</TableCell>
                    <TableCell align="left">Home World</TableCell>
                    <TableCell align="left">Films</TableCell>
                    <TableCell align="left">Species</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  <TableRow key={row.name}>
                    <TableCell component="th" scope="row">
                      {row.name}
                    </TableCell>
                    <TableCell>{row.birth_year}</TableCell>
                    <TableCell>{row.details.eye_color}</TableCell>
                    <TableCell>{row.details.gender}</TableCell>
                    <TableCell>{row.details.hair_color}</TableCell>
                    <TableCell>{row.details.height}</TableCell>
                    <TableCell>{row.details.mass}</TableCell>
                    <TableCell>{row.details.skin_color}</TableCell>
                    <TableCell href={row.details.homeworld}>
                      {"Planet " +
                        `${row.details.homeworld.charAt(
                          row.details.homeworld.length - 2
                        )}`}
                    </TableCell>
                    <TableCell>
                      {row.details.films.length >= 1
                        ? `${row.details.films[0].title} | ${row.details.films[1].title} ...`
                        : "N/D"}
                    </TableCell>
                    <TableCell>
                      {row.details.species.length !== 0
                        ? row.details.species[0].name
                        : "N/D"}
                    </TableCell>
                  </TableRow>
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
  const [peoples, setPeoples] = useState([]);
  const [peopleList, setPeopleList] = useState([]);

  const [peoplesName, setPeoplesName] = useState([]);

  async function GetPeopleService() {
    const peoplesList = await getPeopleService();
    const peoples = peoplesList ? peoplesList : [];
    setPeoples(peoples);
    setPeopleList(peoples);
    setPeoplesName(peoples.filter((people) => people.name));
  }

  useEffect(() => {
    GetPeopleService();
  }, []);

  const rows = [
    peopleList.map((people) =>
      createData(
        people.name,
        people.birth_year,
        people.eye_color,
        people.gender,
        people.hair_color,
        people.height,
        people.mass,
        people.skin_color,
        people.homeworld,
        people.films,
        people.species
      )
    ),
  ];

  const handleSetPeople = (event) => {
    event.target.value.length === 0
      ? setPeopleList(peoples)
      : filterPeople(event.target.value);
  };

  const filterPeople = (people) => {
    let value = peoples.filter((e) => e.name === people);
    setPeopleList(value);
  };

  return (
    <>
      <FormControl sx={{ m: 1, width: 500 }}>
        <InputLabel id="demo-multiple-checkbox-label">Characters</InputLabel>
        <Select
          labelId="demo-multiple-checkbox-label"
          onChange={handleSetPeople}
          variant="outlined"
          value={peoples.filter((people) => people.name)}
          autoWidth
        >
          <MenuItem value="">
            <em>Todos</em>
          </MenuItem>
          {peoples.map((people) => (
            <MenuItem value={people.name}>{people.name}</MenuItem>
          ))}
        </Select>
      </FormControl>

      <TableContainer component={Paper} className="config-table">
        <Table aria-label="collapsible table">
          <TableHead>
            <TableRow>
              <Table Cell />
              <TableCell>Name </TableCell>
              <TableCell align="left">Specie</TableCell>
              <TableCell align="left">Birth Year&nbsp;</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows[0].map((row) => (
              <Row key={row.name} row={row} />
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </>
  );
};

export default CollapsibleTable;
