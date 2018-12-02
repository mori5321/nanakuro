<template>
  <div class="header teal lighten-2">
    <nuxt-link
      to="/question_groups">
      <div class="logo">
        nanaQuro
      </div>
    </nuxt-link>
  </div>
</template>

<style scoped lang="scss">

.header {
  // background: $darkGreen;
  color: $white;
  display: flex;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 100;
  justify-content: space-between;
  align-items: center;
  height: 60px;
  font-size: 1.5rem;
}

.logo {
  margin-left: 15px;
}

</style>
