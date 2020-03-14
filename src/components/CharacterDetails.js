import React, {useContext, useEffect} from 'react'
import { Link } from 'react-router-dom'
import { ApiContext } from "../context/ApiProvider";
import {makeStyles} from "@material-ui/core/styles";
import {Box, Grid} from "@material-ui/core";
import Typography from "@material-ui/core/Typography";
import CakeIcon from "@material-ui/icons/Cake";
import VisibilityIcon from '@material-ui/icons/Visibility';
import WcIcon from '@material-ui/icons/Wc';
import FaceIcon from '@material-ui/icons/Face';
import EmojiPeopleIcon from '@material-ui/icons/EmojiPeople';
import FitnessCenterIcon from '@material-ui/icons/FitnessCenter';
import LanguageIcon from '@material-ui/icons/Language';
import PetsIcon from '@material-ui/icons/Pets';


const CharacterDetails = (props) => {

    const useStyles = makeStyles(theme => ({
            root: {
                marginRight: 'auto',
                marginLeft:'auto',
                marginBottom:'50px',
                backgroundColor:"#323232",
            },
            media: {
                height: 0,
                width:280,
                marginLeft:'auto',
                marginRight: 'auto',
                marginTop:'auto',
                paddingTop: '99.25%',
                paddingBottom: '30%',
            },
            title:{
                marginLeft:'auto',
                marginRight: 'auto',
                color: "#ffffff"
            }
        }
    ));

    const classes = useStyles();

    const {
        action: { getCharacter, getHomeWorld, getMovies },
        state: { selectedCharacter }} = useContext(ApiContext);

    useEffect(() => {
        getCharacter(props.location.query.url)
    }, [getCharacter, props.location.query.url]);


    return (
            <Grid container className={classes.root}>
                <div  className={classes.root}>
                    {(selectedCharacter !== {}) ? (
                        <Typography variant="h2" component="p">
                            <Typography variant="h3" gutterBottom> <p><Box color="#ffffff" className={classes.title}>{selectedCharacter.name}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom> <p><Box color="#ffffff" className={classes.title}><CakeIcon/> = {selectedCharacter.birth_year}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><VisibilityIcon/> = {selectedCharacter.eye_color}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><WcIcon/> = {selectedCharacter.gender}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><FaceIcon/> = {selectedCharacter.hair_color}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><EmojiPeopleIcon/> = {selectedCharacter.height} cm</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><FitnessCenterIcon/> = {selectedCharacter.mass} kg</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><FaceIcon/> = {selectedCharacter.skin_color}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><LanguageIcon/> = {getHomeWorld(selectedCharacter.homeworld)}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><PetsIcon/> = {getMovies(selectedCharacter.species)}</Box> </p></Typography>
                            <Typography variant="h5" gutterBottom><p><Box color="#ffffff" className={classes.title}><Link color="#ffffff" className={classes.title} to={"/"}>Return</Link></Box> </p></Typography>
                        </Typography>
                    ):""}
                </div>
            </Grid>
    )
};

export default CharacterDetails
