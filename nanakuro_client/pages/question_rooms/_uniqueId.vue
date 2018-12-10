<template>
  <v-layout row justify-center class="container">
    <v-flex xs11 sm6>
      <!-- <div>
        <p>
          <span class="roomId teal lighten-2 white--text">RoomID</span>
          {{ this.$route.params.uniqueId }}
        </p>
      </div> -->

      <div>
        <v-subheader>回答</v-subheader>
        <p class="subheader-content">まだ回答はありません</p>
      </div>
      <div>
      </div>


      <v-layout justify-center>
        <v-btn
          depressed
          large
          class="teal lighten-2 white--text" @click="createAnswerGroup">回答する</v-btn>
      </v-layout>

      <v-layout>
        <div class="social-buttons">
          <v-subheader>SNSシェア</v-subheader>

          <!-- あとでカスタムアイコンできれいにする -->
          <div class="subheader-content">
            <div class="line-it-button" data-lang="ja" data-type="share-d" data-url="https://localhost:3000/question_rooms/13f4baf53a37c0444e5c28ea" style="display: none;"></div>

            <a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-size="large" data-hashtags="#nanakuro" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
          </div>
        </div>
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

import Api from '@/services/Api.js';

export default {
  data() {
    return {
      // questionGroup: "",
      // shown: false,
    }
  },
  mounted: function() {
    LineIt.loadButton()
    const params = this.$route.params
    // Api().get(`/question_groups/${params.id}`)
    //   .then(res => {
    //     this.questionGroup = res.data
    //     this.shown = true
    //   }).catch(err => {
    //     console.log(err)
    //   })
    // Api().get(`/question_rooms/${params.id}`)
  },
  methods: {
    createAnswerGroup: function(e) {
      const params = this.$route.params
      Api().post(`/answer_groups`, {
        question_room_id: params.id
      }).then(res => {
        this.$router.push(
          { path: `/answer_groups/${res.data.id}` }
        )
      }).catch(err => {
        console.log(err)
      })
    }
  }
}

</script>


<style scoped lang="scss">

.roomId {
  padding: 3px 5px;
  margin-right: 8px;
}

.subheader-content {
  padding: 0 16px;
}

</style>
