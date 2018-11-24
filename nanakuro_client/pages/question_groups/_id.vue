<template>
  <v-layout row>
    <v-flex xs12 sm6 offset-sm3>
      <h4 class="question-group-title">{{ questionGroup.title }}</h4>
      <v-list two-line>
        <div v-for="(question, index) in questionGroup.questions" :key="question.id">
           <v-divider
              v-if="index !== 0"
              :key="'divider-'+question.id"
            ></v-divider>
            <nuxt-link
              :to="'/question_groups/'+question.id"
              :key="'link-'+question.id"
            >
              <v-list-tile
                avatar
                ripple
              >
                <v-list-tile-content>
                  <v-list-tile-title>{{ question.text }}</v-list-tile-title>
                  <!-- <v-list-tile-sub-title class="text--primary">{{ question.text }}</v-list-tile-sub-title> -->
                </v-list-tile-content>

                <!-- <v-list-tile-action> -->
                  <!-- <v-icon
                    color="grey lighten-1"
                  >
                    star_border
                  </v-icon> -->
                  <!-- <v-icon
                    v-else
                    color="yellow darken-2"
                  >
                    star
                  </v-icon> -->
                <!-- </v-list-tile-action> -->
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
      questionGroup: ""
    }
  },
  mounted: function() {
    const params = this.$route.params
    Api().get(`/question_groups/${params.id}`)
      .then(res => {
        this.questionGroup = res.data
      }).catch(err => {
        console.log(err)
      })
  }
}
</script>


<style scoped lang="scss">

section {
  padding: 20px 20px 0;
}

.question-group-title {
  font-weight: bold;
  font-size: 1.1rem;
  text-align: center;
  padding: 30px 0 10px;
}

</style>
