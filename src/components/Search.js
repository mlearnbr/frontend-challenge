import React, {useContext, useEffect, useState} from 'react'
import TextField from '@material-ui/core/TextField';
import InputAdornment from '@material-ui/core/InputAdornment';
import SearchIcon from '@material-ui/icons/Search';
import { makeStyles } from '@material-ui/core/styles';
import { ApiContext } from "../context/ApiProvider";

const useStyles = makeStyles(theme => ({
    container: {
        display: 'flex',
        flexWrap: 'wrap',

    },
    textField: {
        marginLeft: "auto",
        marginRight: "auto",
        width: 250,
    },
    input:{
        color: "#fac70b"
    },
    inputLabel:{
        color: "#facf5a"
    },
    dense: {
        marginTop: 19,
    },
    menu: {
        width: 200,
    },
}));

const Search = () => {
    const { action:{
        getSearch
    }} = useContext(ApiContext);
    const classes = useStyles();
    const [search, setSearch] = useState("");

    useEffect(() => {
        getSearch(search)
    }, [getSearch, search]);

    return (
        <form className={classes.container} noValidate autoComplete="off">
            <TextField
                fullWidth
                id="search"
                className={classes.textField}
                InputProps={{
                    className: classes.input,
                    startAdornment: (
                        <InputAdornment position="start">
                            <SearchIcon />
                        </InputAdornment>
                    )
                }}
                InputLabelProps={{
                    className: classes.inputLabel
                }}
                value={search}
                onChange={ e => {
                    e.preventDefault(e);
                    setSearch(e.target.value)}
                }
                margin="normal"
                placeholder="Search Character"
            />
        </form>
    )
};

export default Search;