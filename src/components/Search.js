import React, {useContext, useEffect, useState} from 'react'
import TextField from '@material-ui/core/TextField';
import InputAdornment from '@material-ui/core/InputAdornment';
import FindReplaceIcon from '@material-ui/icons/FindReplace';
import { makeStyles } from '@material-ui/core/styles';
import { ApiContext } from "../context/ApiProvider";

const useStyles = makeStyles(theme => ({
    container: {
        display: 'flex',
        flexWrap: 'wrap'
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
    }} = useContext(ApiContext)
    const classes = useStyles();
    const [search, setSearch] = useState("")

    useEffect(() => {
        getSearch(search)
    }, [getSearch, search])

    return (
        <form className={classes.container} noValidate autoComplete="off">
            <TextField
                fullWidth
                id="search"
                label="Search"
                className={classes.textField}
                InputProps={{
                    className: classes.input,
                    startAdornment: (
                        <InputAdornment position="start">
                            <FindReplaceIcon />
                        </InputAdornment>
                    )
                }}
                InputLabelProps={{
                    className: classes.inputLabel
                }}
                value={search}
                onChange={ e => {
                    e.preventDefault(e)
                    setSearch(e.target.value)}
                }

                margin="normal"
                placeholder="Search Star Wars Character"
            />
        </form>
    )
}

export default Search;