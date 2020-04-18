<template>
  <section class="section">

		<!-- Component Character -->

		<div v-if="selected">
			<div class="card">
				<div class="card-content">
					<div class="columns">
						<div class="column is-1">
							<div @click="selected = null" class="back-arrow">
								<b-tooltip label="Back to list" type="is-dark" position="is-top">
            			<b-icon icon="arrow-left"></b-icon>
        				</b-tooltip>	
							</div>
						</div>
						<div class="column">
							<section>
							 <h1 class="title is-1">{{selected.name}}</h1>
							</section>	
						</div>
					</div>	  
				</div>
			</div>

			<div class="columns">
				<div class="column">
					<div class="card">
						<div class="card-content">
							<div class="flex">
								<b-field label="Birth year:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.birthYear === null">Data not available</span>
								<span v-else>{{selected.birthYear}}</span>
							</div>
							<div class="flex">
								<b-field label="Eye color:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.eyeColor === null">Data not available</span>
								<span v-else>{{selected.eyeColor}}</span>
							</div>
							<div class="flex">
								<b-field label="Gender:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.gender === null">Data not available</span>
								<span v-else>{{selected.gender}}</span>
							</div>
							<div class="flex">
								<b-field label="Hair color:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.hairColor === null">Data not available</span>
								<span v-else>{{selected.hairColor}}</span>
							</div>
							<div class="flex">
								<b-field label="Height:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.height === null">Data not available</span>
								<span v-else>{{selected.height}}</span>
							</div>
							<div class="flex">
								<b-field label="Mass:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.mass === null">Data not available</span>
								<span v-else>{{selected.mass}}</span>
							</div>
							<div class="flex">
								<b-field label="Skin color:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.skinColor === null">Data not available</span>
								<span v-else>{{selected.skinColor}}</span>
							</div>
								<div class="flex">
								<b-field label="Homeworld:" expanded></b-field>
								<span class="tag is-warning" v-if="selected.homeworld.name === null">Data not available</span>
								<span v-else>{{selected.homeworld.name}}</span>
							</div>
							<div class="flex">
								<b-field label="Specie:" expanded></b-field>
									<span v-if="selected.species.results.length !== 0">{{selected.species.results[0].name}}</span>
								<span v-else>Human</span>
							</div>
						</div>
					</div>
				</div>

				<div class="column">
					<div class="card">
						<div class="card-content">
							<b-field label="Films:"></b-field>
							<b-field v-for="film in selected.films.results" :key="film.id">
								<span>{{film.title}}</span>	
							</b-field>
						</div>
					</div>
				</div>
			</div>
		</div>	

			<!-- Component Characters list -->

		<div v-else>
			<div class="card" >
				<div class="card-content">
					<div class="columns">
						<div class="column">
							<section>
								<b-field>
								<b-input placeholder="Search a name"
									type="search"
									icon="search"
									v-model="searchName">
								</b-input>
								</b-field>
							</section>	
						</div>

						<div class="column">
							<b-field>
								<b-select v-model="selectedFilm" placeholder="Select a film" expanded>
									<option class="option-1" value="">Select a film</option>
									<option value="A New Hope">A New Hope</option>
									<option value="The Phantom Menace">The Phantom Menace</option>
									<option value="Return of the Jedi">Return of the Jedi</option>
									<option value="Revenge of the Sith">Revenge of the Sith</option>
									<option value="Attack of the Clones">Attack of the Clones</option>
									<option value="The Empire Strikes Back">The Empire Strikes Back</option>
								</b-select>
							</b-field>
						</div>
					</div>	  
				</div>
			</div>
			
			<div class="card">
				<div class="card-content">
					<b-table
						:selected.sync="selected"
						:data="filters"
						:paginated="isPaginated"
						:per-page="perPage"
						:current-page.sync="currentPage"
						:pagination-simple="isPaginationSimple"
						:pagination-position="paginationPosition"
						:pagination-size="paginationSize"
						:default-sort-direction="defaultSortDirection"
						:sort-icon="sortIcon"
						:sort-icon-size="sortIconSize"
						default-sort="starwars.name"
						aria-next-label="Next page"
						aria-previous-label="Previous page"
						aria-page-label="Page"
						aria-current-label="Current page" 
					>
						<template slot-scope="props">

							<b-table-column field="name" label="Name" sortable>
								<span>{{props.row.name}}</span>   
							</b-table-column>

							<b-table-column field="species" label="Species" sortable>
								<span v-if="props.row.species.results.length !== 0">{{props.row.species.results[0].name}}</span>
								<span v-else>Human</span>
							</b-table-column>

							<b-table-column field="birthYear" label="Birth year" sortable>
								<span class="tag is-warning" v-if="props.row.birthYear === null">Data not available</span>
								<span v-else>{{props.row.birthYear}}</span>
							</b-table-column>

						</template>
					</b-table> 
				</div> 
			</div>
		</div>	
  </section>
</template>

<script>
export default {
	name: 'HomePage',
  data() {
		return {
			selected: this.starWarsCharacters,
      starWarsCharacters: [],
			searchName: '',
			selectedFilm: '',
			isPaginated: true,
			isPaginationSimple: true,
			paginationPosition: 'bottom',
			paginationSize: 'is-small',
			defaultSortDirection: 'asc',
			sortIcon: 'chevron-up',
			sortIconSize: 'is-small',
			currentPage: 1,
      perPage: 10
		}
  },
  computed: {
    filters() {
			return !this.selectedFilm.length && !this.searchName
			? this.starWarsCharacters.results
			: this.starWarsCharacters.results
			.filter(person => person.films.results.some(film => film.title.includes(this.selectedFilm)))
			.filter(person => person.name.includes(this.searchName))
		}
  },
  created() {
		const query = `{
			characters {
				results {
					ACL
					birthYear
					createdAt
					eyeColor
					films {
						results {
							title
						}
					}
					gender
					hairColor
					height
					homeworld {
						name
					}
					id
					mass
					name
					skinColor
					species  {
						results {
							name
						}
					}
					starships {
						results {
							name
						}
					}
					updatedAt
					vehicles {
						results {
							name
						}
					}
				}
			}
		}`;

	fetch('https://parseapi.back4app.com/graphql',
		{
			method: 'POST',
			headers: {
				'X-Parse-Application-Id': 'kFuqGsemy2j84m8AfykdWikN2WdHEs45uGIFDV7F', // This is the fake app's application id
				'X-Parse-Master-Key': 'mbUJqmLAMaVoASAkhmnOWf6am5qhmFXL5hcw0Ecf', // This is the fake app's readonly master key
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({query})
		})
		.then(response => response.json())
		.then(data => {
			this.starWarsCharacters = data.data.characters
		}) 
	}
}
</script>
<style scoped lang="scss">

.card {
	border-radius: 15px;
	box-shadow: 0 0 0 0 white !important;
	.card-content {
		padding: 2rem 3rem;
		margin-bottom: 2rem;		
	}
}

.option-1 {
	color: #dbdbdb;
}

 td {
	 cursor:pointer;
		&:hover {
 		 	font-weight: bold;
	}
}

.back-arrow {
	cursor: pointer;
	margin-top:15px;
	&:hover{
 		color: gold;
	}
}

.flex {
	display: flex;
	justify-content: space-between;
}

</style>
