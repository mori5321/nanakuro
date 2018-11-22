<template>
  <section>
    GoodNight
    <el-input placeholder="Please input" />
  </section>
</template>

<script>
import Api from '@/services/Api.js'

export default {
  created() {
    Api().get('/question_groups')
      .then(res => {
        console.log(res.data)
      }).catch(err => {
        console.log(err)
      })
  }
}

</script>
