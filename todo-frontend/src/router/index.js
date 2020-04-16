import Vue from "vue";
import VueRouter from "vue-router";
import ListView from "../views/ListView";

Vue.use(VueRouter);
//Ovde definisemo nase rute kao objekte, path je putanja u browseru, npr. /items, /posts
//component je komponenta koja se prikazuje kada se ucita ta ruta.

const routes = [
  {
    path: "/",
    name: "home",
    component: ListView
  }];

// Instancira se VueRouter, standardan nacin za uvezivanje routera.
// Cli sam odradi ovo za nas

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
