<template>
  <section>
    <!-- <el-input placeholder="Please input" /> -->
    <div>
      <div v-for="qg in questionGroups" :key="qg.id">
        {{ qg.title }}
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
