import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import {Box, Grid} from "@material-ui/core";
import {makeStyles} from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardMedia from '@material-ui/core/CardMedia';
import CardContent from '@material-ui/core/CardContent';
import CakeIcon from '@material-ui/icons/Cake';
import Typography from '@material-ui/core/Typography';
import EmojiPeopleIcon from '@material-ui/icons/EmojiPeople';
import CardActions from '@material-ui/core/CardActions';

export const CharactersCards = (props) => {

    const useStyles = makeStyles(theme => ({
        root: {
            minWidth: 320,
            minheight:200,
            marginRight: 'auto',
            marginLeft:'auto',
            marginBottom:'30px',
            marginTop:'30px',
            backgroundColor:"#323232"
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

    const { characters } = props;
    const classes = useStyles();

    useEffect(() => {
        console.log("props", characters)
    }, [characters]);

    return (
        <Box display="flex" flexDirection="row" boxShadow={3} item xl={3}>
            <Grid container >
                {characters.map((character) => (
                    <Card className={classes.root}>
                        <CardHeader
                            title={
                                <Box color="#ffffff" className={classes.title}>{character.name}</Box>}
                        />
                        <CardMedia
                            className={classes.media}
                            image={character.img}
                            title={character.nickname}
                        />
                        <CardContent>
                            <Typography variant="body2" component="p" >
                                <p><Box color="#ffffff" className={classes.title}><CakeIcon/>{character.birth_year}</Box> </p>
                                <p> <Box color="#ffffff" className={classes.title}><EmojiPeopleIcon/>{character.height+" "}</Box> </p>

                            </Typography>
                        </CardContent>
                        <CardActions disableSpacing>
                            <Link color="#ffffff" className={classes.title}
                                to={
                                    { pathname: `/characterdetails/${character.name}`,
                                        query:{url: character.url}
                                    }}

                            >Character Info</Link>
                        </CardActions>
                    </Card>
                ))}
            </Grid>
        </Box>
    )
};
