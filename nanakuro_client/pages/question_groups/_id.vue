<template>
  <v-layout row justify-center v-show="shown" class="container">
    <v-flex xs11 sm6>
      <h4 class="question-group-title">{{ questionGroup.title }}</h4>
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
      </v-layout>
    </v-flex>
  </v-layout>
</template>

<script>
import Api from '@/services/Api.js'

export default {
  scrollToTop: true,
  data() {
    return {
      questionGroup: "",
      shown: false,
    }
  },
  mounted: function() {
    const params = this.$route.params
    Api().get(`/question_groups/${params.id}`)
      .then(res => {
        this.questionGroup = res.data
        this.shown = true
      }).catch(err => {
        console.log(err)
      })
  },
  methods: {
    createRoom: function(e) {
      const params = this.$route.params
      Api().post(`/question_groups/${params.id}/question_rooms`)
        .then(res => {
          console.log(res)
          this.$router.push({ path: `/question_rooms/${res.data.unique_id}` })
        }).catch(err => {
          console.log(err)
        })
    }
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

.container {
  padding-bottom: 30px;
}

.questionsList {
  margin-bottom: 8px;
}

.questionText {
  font-size: 14px;
}

</style>
