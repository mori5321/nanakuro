<template>
  <section>
    <!-- <el-input placeholder="Please input" /> -->
    <div>
      <div v-for="qg in questionGroups" :key="qg.id">
        {{ qg.title }}
        <div v-for="question in qg.questions" :key="question.id">
          {{ question.text }}
        </div>
      </div>
    </div>
  </section>
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
