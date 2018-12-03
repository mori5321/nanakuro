<template>
  <v-layout row justify-center class="container">
    <v-flex xs11 sm6>
      <div>
        RoomID: {{ this.$route.params.uniqueId }}
      </div>
      <v-layout justify-center>
        <v-btn
          depressed
          large
          class="teal lighten-2 white--text">回答する</v-btn>
      </v-layout>
      <!-- <h4 class="question-group-title">{{ questionGroup.title }}</h4>
      <v-list class="questionsList">
        <div v-for="(question, index) in questionGroup.questions" :key="question.id">
           <v-divider
              v-if="index !== 0"
              :key="'divider-'+question.id"
            ></v-divider>
            <v-list-tile
              ripple
            >
              <v-list-tile-content>
                <v-list-tile-title class="questionText">{{ question.text }}</v-list-tile-title>
              </v-list-tile-content>
          </v-list-tile>
        </div>
      </v-list>
      <v-layout justify-center>
        <v-btn
          @click="createRoom"
          depressed
          large
          class="teal lighten-2 white--text">ルームを作成</v-btn>
      </v-layout> -->
    </v-flex>
  </v-layout>
</template>


<script>

'@/services/Api.js'

export default {
  data() {
    return {
      // questionGroup: "",
      // shown: false,
    }
  },
  mounted: function() {
    // const params = this.$route.params
    // Api().get(`/question_groups/${params.id}`)
    //   .then(res => {
    //     this.questionGroup = res.data
    //     this.shown = true
    //   }).catch(err => {
    //     console.log(err)
    //   })
  },
  methods: {
    // createRoom: function(e) {
    //   const params = this.$route.params
    //   Api().post(`/question_groups/${params.id}/question_rooms`)
    //     .then(res => {
    //       console.log(res)
    //     }).catch(err => {
    //       console.log(err)
    //     })
    // }
  }
}

</script>
