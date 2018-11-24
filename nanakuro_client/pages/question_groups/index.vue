<template>
  <v-layout row>
    <v-flex xs12 sm6 offset-sm3>
      <v-list two-line>
        <template v-for="(qg, index) in questionGroups">
           <v-divider
              v-if="index !== 0"
              :key="qg.id"
            ></v-divider>
          <v-list-tile
            :key="qg.title"
            avatar
            ripple
          >
            <v-list-tile-content>
              <v-list-tile-title>{{ qg.title }}</v-list-tile-title>
              <v-list-tile-sub-title class="text--primary">{{ qg.title }}</v-list-tile-sub-title>
              <!-- <v-list-tile-sub-title>{{ qg.title }}</v-list-tile-sub-title> -->
            </v-list-tile-content>

            <v-list-tile-action>
              <!-- <v-list-tile-action-text>{{ qg.title }}</v-list-tile-action-text> -->
              <v-icon
                color="grey lighten-1"
              >
                star_border
              </v-icon>

              <!-- <v-icon
                v-else
                color="yellow darken-2"
              >
                star
              </v-icon> -->
            </v-list-tile-action>
          </v-list-tile>
        </template>
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
  created() {
    Api().get('/question_groups')
      .then(res => {
        this.questionGroups = res.data
      }).catch(err => {
        console.log(err)
      })
  }
}

</script>
