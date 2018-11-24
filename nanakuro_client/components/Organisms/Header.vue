<template>
  <v-toolbar fixed dark color="teal lighten-2">
    <!-- <v-toolbar-side-icon></v-toolbar-side-icon> -->

    <v-toolbar-title>Nanakuro</v-toolbar-title>

    <v-spacer></v-spacer>

    <v-btn icon>
      <v-icon>search</v-icon>
    </v-btn>

<!--     <v-btn icon>
      <v-icon>apps</v-icon>
    </v-btn> -->
  </v-toolbar>
</template>

<style scoped lang="scss">

.header {
  background: $darkGreen;
  color: $white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 50px;
  font-size: 1.5rem;
}

</style>
