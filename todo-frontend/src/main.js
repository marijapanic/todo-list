import "core-js/stable";
import "regenerator-runtime/runtime";
import "mutationobserver-shim";
import Vue from "vue";
import axios from 'axios';
import VueAxios from 'vue-axios';
import "./plugins/bootstrap-vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

Vue.use(VueAxios, axios);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
