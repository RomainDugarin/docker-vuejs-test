import Vue from 'vue'
import Vuex from 'vuex'
// import axios from 'vue'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    count: 0,
    users: new Array()
  },
  getters: {
    count: state => {
      return state.count
    },
    users: state => {
      return state.users
    }
  },
  mutations: {
    INCREMENT (state) {
      state.count++
    },
    GET_USERS (state) {
      // fetch("https://jsonplaceholder.typicode.com/todos/1")
      //   .then(response => state.users.push(response))
            
      state.users.push({
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
      })
    }
  },
  actions: {
    increment (context) {
      context.commit('INCREMENT')
    },
    get_users (context) {
      context.commit('GET_USERS')
    }
  }
})
