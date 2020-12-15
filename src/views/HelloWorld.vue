<template>
  <div class="HelloWorld">

    <h1>Hello World</h1>

    <section>
      <h2>Compteur</h2>
      <h3>{{ count }}</h3>
      <button @click="increment">INC</button>
    </section>

    <section>
      <h2>Users</h2>
      <p 
      v-for="user in users"
      v-bind:key="user.id">
        {{ user }}
      </p>
      <button @click="store_users">USERS</button>
    </section>

  </div>
</template>

<script>
export default {
  computed: {
    count() {
      return this.$store.getters.count
    },
    users() {
      return this.$store.getters.users
    }
  },
  methods: {
    increment: function () {
      this.$store.dispatch('increment')
    },
    store_users: function () {
      this.$store.dispatch('get_users')
    },
  }
}
</script>

<style>
  button {padding: 1em;}
  section {padding: 1em;}
</style>