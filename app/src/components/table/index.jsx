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
  OutlinedInput,
  InputLabel,
  FormControl,
} from "@material-ui/core";
import { KeyboardArrowDown, KeyboardArrowUp } from "@material-ui/icons";
import "../../";

import getPeopleService from "../../services/getPeoplesService";
import getSpeciesService from "../../services/getSpeciesService";

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
          {row.details.species.length > 0 ? row.details.species[0] : "N/D"}
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
                    <TableCell>birth_year</TableCell>
                    <TableCell align="left">eye_color</TableCell>
                    <TableCell align="left">gender</TableCell>
                    <TableCell align="left">hair_color</TableCell>
                    <TableCell align="left">height</TableCell>
                    <TableCell align="left">mass</TableCell>
                    <TableCell align="left">skin_color</TableCell>
                    <TableCell align="left">homeworld</TableCell>
                    <TableCell align="left">films</TableCell>
                    <TableCell align="left">species</TableCell>
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
                      {"Film " +
                        `${row.details.films.map((film) =>
                          film.charAt(film.length - 2)
                        )}`}
                    </TableCell>
                    <TableCell>
                      {row.details.species.length !== 0
                        ? row.details.species[0]
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
  const [specieList, setSpecieList] = useState([]);
  const [peoplesName, setPeoplesName] = useState([]);

  async function GetPeopleService() {
    const peoplesList = await getPeopleService();
    const peoples = peoplesList ? peoplesList : [];
    setPeoples(peoples);
    setPeopleList(peoples);
    setPeoplesName(peoples.filter((people) => people.name));
  }

  async function GetSpeciesService() {
    const speciesList = await getSpeciesService();
    const species = speciesList ? speciesList : [];
    setSpecieList(species);
    console.log(species[0]);
  }

  useEffect(() => {
    GetPeopleService();
    GetSpeciesService();
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
        species.map((e) => (e.specie = people.especie))
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
          value={peoplesName[0]}
          onChange={handleSetPeople}
        >
          <MenuItem value="">
            <em>Todos</em>
          </MenuItem>
          {peoplesName.map((people) => (
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
              <TableCell align="left">Birth_year&nbsp;</TableCell>
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
