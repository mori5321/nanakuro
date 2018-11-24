<template>
  <section>
    <div>
      <h1>{{ questionGroup.title }}</h1>
      <div v-for="question in questionGroup.questions" :key="question.id">
        {{ question.text }}
      </div>
    </div>
  </section>
</template>

<script>
import Api from '@/services/Api.js'

export default {
  data() {
    return {
      questionGroup: ""
    }
  },
  created: function() {
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
