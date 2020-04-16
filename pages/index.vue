<template>
  <section class="section">
    <div class="card">
			<div class="card-content">
				<div class="columns">
					<div class="column">
						<section>
							<b-field>
							<b-input placeholder="Buscar por nome"
                type="search"
                icon="search"
                v-model="searchName">
							</b-input>
							</b-field>
						</section>	
					</div>
				</div>	  
			</div>
		</div>
		<div class="card">
			<div class="card-content">
				<b-table 
					:data="filteredItems"
					:paginated="isPaginated"
					:per-page="perPage"
					:current-page.sync="currentPage"
					:pagination-simple="isPaginationSimple"
					:pagination-position="paginationPosition"
					:pagination-size="paginationSize"
					:default-sort-direction="defaultSortDirection"
					:sort-icon="sortIcon"
					:sort-icon-size="sortIconSize"
					default-sort="data.paciente"
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
							<span class="tag is-light" v-else>No defined species</span>
						</b-table-column>

            <b-table-column field="birthYear" label="Birth year" sortable>
              <span class="tag is-light" v-if="props.row.birthYear === null">Data not available</span>
              <span v-else>{{props.row.birthYear}}</span>
						</b-table-column>
					</template>
				</b-table> 
			</div> 
		</div>
  </section>
</template>

<script>
export default {
  name: 'HomePage',
  data() {
		return {
      starWarsCharacters: [],
      searchName: '',
			isPaginated: true,
			isPaginationSimple: false,
			paginationPosition: 'both',
			paginationSize: 'is-small',
			defaultSortDirection: 'asc',
			sortIcon: 'chevron-up',
			sortIconSize: 'is-small',
			currentPage: 1,
      perPage: 10
		}
  },
  computed: {
    filteredItems() {
			console.log(this.starWarsCharacters)
      return !this.searchName.length 
        ? this.starWarsCharacters.results 
        : this.starWarsCharacters.results.filter(person => person.name.includes(this.searchName))
    }
  },
  mounted() {
    this.getstarWarsCharacters()
  },
  methods: {
    getstarWarsCharacters() {

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
}
</script>
<style scoped>

.card {
	border-radius: 15px;
	box-shadow: 0 0 0 0 white !important;
}
.card-content {
  padding: 2rem 3rem;
  margin-bottom: 2rem;		
}

</style>
