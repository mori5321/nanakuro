<template>
  <v-layout row justify-center>
    <v-flex xs11 sm6>
      <v-list two-line>
        <div v-for="(qg, index) in questionGroups" :key="qg.id">
           <v-divider
              v-if="index !== 0"
              :key="'divider-'+qg.id"
            ></v-divider>
            <nuxt-link
              :to="'/question_groups/'+qg.id"
              :key="'link-'+qg.id"
            >
              <v-list-tile
                avatar
                ripple
              >
                <v-list-tile-content>
                  <v-list-tile-title>{{ qg.title }}</v-list-tile-title>
                  <v-list-tile-sub-title class="text--primary">{{ qg.title }}</v-list-tile-sub-title>
                </v-list-tile-content>

                <!-- <v-list-tile-action>
                  <v-icon
                    color="grey lighten-1"
                  >
                    star_border
                  </v-icon>
                  <v-icon
                    v-else
                    color="yellow darken-2"
                  >
                    star
                  </v-icon>
                </v-list-tile-action> -->
            </v-list-tile>
          </nuxt-link>
        </div>
      </v-list>
    </v-flex>
  </v-layout>
</template>

<script>
import Api from '@/services/Api.js'

export default {
  data() {
    return {
      questionGroups: []
    }
  },
  mounted() {
    Api().get('/question_groups')
      .then(res => {
        this.questionGroups = res.data
      }).catch(err => {
        console.log(err)
      })
  }
}

</script>
