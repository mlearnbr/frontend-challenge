import React from 'react';
import { Card, Grid, Button, Modal } from 'semantic-ui-react'
import CharAttributes from './CharAttributes'

export default function Chars({ data }) {


    function showCharDesc() {
        isVisible = !isVisible;
    }

    let isVisible = false;
    return (
        <>
            <h1>Characters</h1>
            <Grid columns='1'>
                {data.map((char, i) => {
                    return (
                        <Grid.Column key={i}>
                            <Modal trigger={
                                <Button onClick={showCharDesc()}>
                                    <Card.Content>
                                        <Card.Header>{char.name}</Card.Header>
                                    </Card.Content>
                                </Button>
                            }>
                                <CharAttributes isVisible={isVisible} char={char} />
                            </Modal>
                        </Grid.Column>
                    )
                })}
            </Grid>
        </>
    );
}
