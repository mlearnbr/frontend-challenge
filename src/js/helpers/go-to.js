export function goToDetails(peopleData) {

    const {router} = this.context;

    // Esta não é a melhor abordagem. Eu utilizaria Redux. Entretanto, devido ao tempo, resolvi passar pela URL
    if (!router.isActive('/details', null, true)) {
        router.push({
            pathname: '/details',
            query: {
                name: peopleData.name,
                birth_year: peopleData.birth_year,
                eye_color: peopleData.eye_color,
                gender: peopleData.gender,
                hair_color: peopleData.hair_color,
                height: peopleData.height,
                mass: peopleData.mass,
                skin_color: peopleData.skin_color,
                homeworld: peopleData.homeworld,
                films: peopleData.films[0],
                species: peopleData.species[0]
            }
        });
    }
}

export function goToHome() {

    const {router} = this.context;

    if (!router.isActive('/home', null, true)) {
        router.push('/home');
    }

}